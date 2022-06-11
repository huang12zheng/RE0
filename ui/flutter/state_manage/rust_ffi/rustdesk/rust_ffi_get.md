# translate
arg.to_str
    ...
        m.get("locale")  m.get("text")
        crate::client::translate_locale(text.to_owned(), locale);
    
# uuid
# check_clients_length
    get_clients_state
# clients_state
    get_clients_state
# read_local_dir_sync
    m.get("path") m.get("show_hidden")
    if fs::read_dir(&fs::get_path(path), show_hidden.eq("true"))  
    res = make_fd_to_json(fd);
# connect_statue
    Config::get_id
# server_password
    Config::get_password()
# server_id
# software_update_url
     crate::common::SOFTWARE_UPDATE_URL.lock().unwrap().clone()
# image_quality
    Session::get_image_quality

# option
    Config::get_option(arg)
# test_if_valid_server
    hbb_common::socke
# toggle_option
    Session::get_toggle_option(arg)
# event
    Session::pop_event()
# remember
    Session::get_remember()
# peers
    PeerConfig::peers().drain