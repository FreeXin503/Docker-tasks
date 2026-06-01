set -ex

if [ ! -n "\" ]; then
    VER=git tag | grep -v "v" | tail -n 1 |  python3 -c "import sys; vers = sys.stdin.readline().strip().split('.'); print('.'.join([*vers[:2], str(int(vers[2])+1)]))"
else
    VER="\"
fi
git tag \
git push -u origin \

docker build -t crpi-o2w6jf5eugmdc8xx.cn-guangzhou.personal.cr.aliyuncs.com/lcw1140/imagesite:\ .
docker push crpi-o2w6jf5eugmdc8xx.cn-guangzhou.personal.cr.aliyuncs.com/lcw1140/imagesite:\
echo crpi-o2w6jf5eugmdc8xx.cn-guangzhou.personal.cr.aliyuncs.com/lcw1140/imagesite:\