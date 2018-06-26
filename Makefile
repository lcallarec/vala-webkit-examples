PHONY: compile compile-web-extension
	
compile:
	$(MAKE) compile-web-extension
	valac --pkg gtk+-3.0 --pkg webkit2gtk-4.0 --thread browser.vala -o browser

compile-web-extension:
	valac --vapi=javascriptcore-gtk.vapi --thread --pkg glib-2.0 --pkg javascriptcoregtk-4.0 --pkg webkit2gtk-web-extension-4.0 --library=web-extension -H web-extension.h web-extension.vala -X -fPIC -X -shared -o web-extension.so
	