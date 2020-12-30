# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: sihuan <sihuan at sakuya.love>
# Contributor: Nick Cao <nickcao at nichi dot co>

pkgname=wechat-uos
pkgver=2.0.0
pkgrel=8
pkgdesc="UOS专业版微信 (迫真魔改版)"
arch=(x86_64)
url=https://www.chinauos.com/resource/download-professional
depends=(gtk2 gtk3 libxss gconf nss lsb-release bubblewrap)
license=(MIT)
source=(
    "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.weixin/com.qq.weixin_${pkgver}_amd64.deb"
    'uos-lsb' 'uos-release' 'wechat-uos' 'wechat-uos.desktop'
)
b2sums=('6abb4054ac7efc10bd093de8064a8972ef703d29f7fe2caf94a5be19230f861e77c1965ca78687aeea32016e6ab41d6d18d0610a9f11c351f92c114b06795972'
        '3cd62350b8b12d857e7a6b7d14ddc0fde9617f1e927371962f95ce633f7686c12ff3d8bc0e4048c85ef5a7414885ed03aecd8f7fbb6ca6f5e6d52d68273d4c43'
        '49de7f51a7d43acbdb5d6e54aa77e56476d79ff3bb950a99bfe6023c4eb067737fcfcdf51ea7d2428e7923659267bce8477bde71df00c4def1f8e16999d84a49'
        'f7cab48a63bc28fdcf0be582a1671981bfd50e3c82d717392306ce82d19e501c3596139f43ade2f63bb1ca7d8b1b54317bc76b3f72c86b8a8a2531ffec67902e'
        '13f84de388ff2c20f9e7c42b773e8dbd63da473851690ce37cb80966e2fac0843933d0d561c7c5f8918e456f56db9a66b82cbd5952b056a954b519ef76826ed2')

prepare() {
    bsdtar -xf data.tar.xz
}
        
package() {
    mkdir -p $pkgdir/opt/wechat-uos $pkgdir/usr/share/icons
    cp -at $pkgdir/opt/wechat-uos  $srcdir/opt/apps/com.qq.weixin/files/*
    cp -at $pkgdir/usr/share/icons $srcdir/opt/apps/com.qq.weixin/entries/icons/hicolor
    
    install -Dm755 -t $pkgdir/usr/bin/                wechat-uos
    install -Dm644 -t $pkgdir/opt/wechat-uos/crap/    uos-lsb uos-release
    install -Dm755 -t $pkgdir/usr/share/applications/ wechat-uos.desktop
}
