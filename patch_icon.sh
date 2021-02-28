srcdir=$1

for s in 128 64 48 16; do
    newsize="${s}x${s}"
    echo "Downsampling from 256x256 to $newsize..."
    convert -geometry $newsize \
        $srcdir/opt/apps/com.qq.weixin/entries/icons/hicolor/256x256/apps/wechat.png \
        $srcdir/opt/apps/com.qq.weixin/entries/icons/hicolor/$newsize/apps/wechat.png
done
