.PHONY: compile compile-web-extension clean
	
compile: compile-web-extension
	valac --pkg gtk+-3.0 --pkg webkit2gtk-4.0 --thread browser.vala -o browser

compile-web-extension: clean
	valac --vapi=javascriptcore-gtk.vapi --thread --pkg glib-2.0 --pkg javascriptcoregtk-4.0 --pkg webkit2gtk-web-extension-4.0 --library=web-extension -H web-extension.h web-extension.vala -X -fPIC -X -shared -o web-extension.so
	
clean:
	rm -f browser && rm -rf web-extension.so