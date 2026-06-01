FROM alpine AS builder
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache nodejs npm
COPY ./frontend /src/frontend
WORKDIR /src/frontend
RUN npm install --registry=https://registry.npmmirror.com && npm run build

FROM python:alpine AS prod
COPY ./backend /src/backend
COPY --from=builder /src/frontend/dist /src/backend/dist
WORKDIR /src/backend
ENV TZ=Asia/Shanghai
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
CMD ["python", "index.py"]