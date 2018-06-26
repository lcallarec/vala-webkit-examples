[CCode (cname="G_MODULE_EXPORT webkit_web_extension_initialize_with_user_data", has_target = false)]
public static void webkit_web_extension_initialize_with_user_data(WebKit.WebExtension extension, Variant user_data) {
    extension.page_created.connect((page) => {
        var sw = WebKit.ScriptWorld.get_default();
        var frame = page.get_main_frame();
        unowned JS.Context gc = frame.get_javascript_context_for_script_world(sw);

        JS.String v = new JS.String.create_with_utf8_cstring("alert('this is an alert window')");
        gc.evaluate_script(v);

        stdout.printf("# PAGE CREATED : # %" + uint64.FORMAT + "\n", page.get_id());

        page.send_request.connect((request) => {
            stdout.printf("# REQUEST SENT : %s\n", request.get_uri());
            return false;
        });
    });
}