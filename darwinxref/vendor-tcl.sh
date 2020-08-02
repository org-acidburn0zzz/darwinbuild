#!/bin/zsh -e

if [ ! -f $BUILT_PRODUCTS_DIR/libtcl8.6.dylib ]; then
	cp /usr/local/opt/tcl-tk/lib/libtcl8.6.dylib $BUILT_PRODUCTS_DIR
	chmod u+w $BUILT_PRODUCTS_DIR/libtcl8.6.dylib
	install_name_tool -id '@loader_path/../share/darwinbuild/libtcl8.6.dylib' $BUILT_PRODUCTS_DIR/libtcl8.6.dylib
fi

if [ "$ACTION" = "install" ]; then
	mkdir -p $DSTROOT/usr/local/share/darwinbuild
	install -o $INSTALL_OWNER -g $INSTALL_GROUP -m $INSTALL_MODE_FLAG \
		$BUILT_PRODUCTS_DIR/libtcl8.6.dylib \
		$DSTROOT/usr/local/share/darwinbuild
fi
