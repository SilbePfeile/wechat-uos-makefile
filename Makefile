pkgver=2.0.0
epoch=2
srcdir=deb
pkgdir=
pkgname=com.qq.weixin_${pkgver}-${epoch}_amd64.deb

prepare:
	wget -nc "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.weixin/${pkgname}"
	mkdir -p ${srcdir}
	dpkg -x ${pkgname} ${srcdir}

install:
	mkdir -p ${pkgdir}/opt/wechat-uos ${pkgdir}/usr/share/icons
	cp -at ${pkgdir}/opt/wechat-uos  ${srcdir}/opt/apps/com.qq.weixin/files/*
	cp -at ${pkgdir}/usr/share/icons ${srcdir}/opt/apps/com.qq.weixin/entries/icons/hicolor

	install -Dm755 -t ${pkgdir}/usr/bin/                wechat-uos
	install -Dm644 -t ${pkgdir}/opt/wechat-uos/crap/    uos-lsb uos-release
	install -Dm644 -t ${pkgdir}/usr/share/applications/ wechat-uos.desktop
	install -Dm644 -t ${pkgdir}/usr/lib/license/        ${srcdir}/usr/lib/license/libuosdevicea.so

update-local:
	install -Dm755 -t ${pkgdir}/usr/bin/                wechat-uos
	install -Dm644 -t ${pkgdir}/opt/wechat-uos/crap/    uos-lsb uos-release
	install -Dm644 -t ${pkgdir}/usr/share/applications/ wechat-uos.desktop

clean:
	rm -rf ${srcdir}
	rm ${pkgname}

uninstall:
	rm -rf ${pkgdir}/opt/wechat-uos
	find ${pkgdir}/usr/share/icons/hicolor -name 'wechat.png' -exec rm {} \;
	rm ${pkgdir}/usr/bin/wechat-uos
	rm ${pkgdir}/opt/wechat-uos/crap/uos-lsb ${pkgdir}/opt/wechat-uos/crap/uos-release
	rm ${pkgdir}/usr/share/applications/wechat-uos.desktop
	rm ${pkgdir}/usr/lib/license/libuosdevicea.so
