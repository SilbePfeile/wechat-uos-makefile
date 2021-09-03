pkgver=2.0.0+lsblk
_pkgver=2.0.0
epoch=2
pkgrel=1145141919
srcdir=deb
pkgdir=
pkgname=com.qq.weixin_${_pkgver}-${epoch}_amd64.deb

prepare:
	@echo Downloading source .deb package
	wget -nc "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.weixin/${pkgname}"
	mkdir -p ${srcdir}

	@echo Decompressing Debian Package...
	dpkg -x ${pkgname} ${srcdir}

	@echo Patching Incorrect Size Icons...
	./patch_icon.sh ${srcdir}

install:
	@echo Copying Application Binaries...
	mkdir -p ${pkgdir}/opt/wechat-uos
	cp -at ${pkgdir}/opt/wechat-uos  ${srcdir}/opt/apps/com.qq.weixin/files/*
	install -Dm644 ${srcdir}/usr/lib/license/libuosdevicea.so -t ${pkgdir}/usr/lib/license/

	@echo "Copying Patched Icons..."
	mkdir -p ${pkgdir}/usr/share/icons
	cp -at ${pkgdir}/usr/share/icons ${srcdir}/opt/apps/com.qq.weixin/entries/icons/hicolor

	@echo "Linking Binaries..."
	install -Dm755 wechat-uos -t ${pkgdir}/usr/bin/

	@echo "Creating Desktops and Hacks..."
	install -Dm644 uos-lsb uos-release -t ${pkgdir}/opt/wechat-uos/crap/
	install -Dm755 uos-lsblk -t ${pkgdir}/opt/wechat-uos/crap/
	install -Dm644 wechat-uos.desktop -t ${pkgdir}/usr/share/applications/	

clean:
	rm -rf ${srcdir}
	rm ${pkgname}

uninstall:
	rm -rf ${pkgdir}/opt/wechat-uos
	find ${pkgdir}/usr/share/icons/hicolor -name 'wechat.png' -exec rm {} \;
	rm ${pkgdir}/usr/bin/wechat-uos
	rm ${pkgdir}/usr/share/applications/wechat-uos.desktop
	rm ${pkgdir}/usr/lib/license/libuosdevicea.so
