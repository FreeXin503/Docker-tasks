set -ex
VER=${1:-0.0.1}
REGISTRY=crpi-o2w6jf5eugmdc8xx.cn-guangzhou.personal.cr.aliyuncs.com/lcw1140
docker build -t image_share:${VER} .
cd frontend
docker build -t demo_fe:${VER} .
cd ..
echo image_share:${VER}
echo demo_fe:${VER}
