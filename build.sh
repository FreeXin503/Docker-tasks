set -ex
VER=${1:-0.0.1}
REGISTRY=crpi-o2w6jf5eugmdc8xx.cn-guangzhou.personal.cr.aliyuncs.com/lcw1140
docker build -t ${REGISTRY}/image_share:${VER} .
docker push ${REGISTRY}/image_share:${VER}
cd frontend
docker build -t ${REGISTRY}/demo_fe:${VER} .
docker push ${REGISTRY}/demo_fe:${VER}
cd ..
echo ${REGISTRY}/image_share:${VER}
echo ${REGISTRY}/demo_fe:${VER}
