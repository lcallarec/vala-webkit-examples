int main(string[] args) {

    Gtk.init (ref args);
    var window = new Gtk.Window();
    var context = new WebKit.WebContext();
        
    try {
        var browser_location = guess_browser_location();
        stdout.printf("EXT : %s\n", browser_location);
        context.set_web_extensions_directory(browser_location);
        context.set_web_extensions_initialization_user_data(new Variant("s", "s"));
        
        var view = new WebKit.WebView.with_context(context);
        window.add(view);

        window.show_all();

        view.load_uri("https://www.google.fr");
    
        Gtk.main();

    } catch (Error e) {
        return 1;
    }

    return 0;
}

string guess_browser_location() throws FileError {

    string program_location = GLib.FileUtils.read_link("/proc/self/exe");
    string[] tokens = program_location.split("/");

    var builder = new StringBuilder();
    for (int8 i = 0; i < tokens.length - 1; i++) {
        builder.append(tokens[i]);
        if (i != tokens.length - 2) builder.append("/");
    }

    return builder.str;
}