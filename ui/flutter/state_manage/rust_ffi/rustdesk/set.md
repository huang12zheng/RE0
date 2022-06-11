# init
initialize(value)

# info1
*crate::common::MOBILE_INFO1.lock().unwrap() = value.to_owned()
# info2
*crate::common::MOBILE_INFO2.lock().unwrap() = value.to_owned()
# connect
Session::start(value, false)
# connect_file_transfer
Session::start(value, true)
# login
Session::login(password, remember == "true")
# close
Session::close
# refresh
Session::refresh
# reconnect
Session::reconnect
# toggle_option
Session::toggle_option(arg)
# image_quality
Session::set_image_quality(value)
# lock_screen
Session::lock_screen()
# ctrl_alt_del
Session::ctrl_alt_del()
# switch_display
Session::switch_display(v)
# remove
PeerConfig::remove(value)
# input_key
Session::input_key(name, down, press, alt, ctrl, shift, command)
# input_string
Session::input_string(value)
# chat_client_mode
Session::send_chat(value.to_owned())
# send_mouse
Session::send_mouse(mask, x, y, alt, ctrl, shift, command)
# option
Config::set_option(name.to_owned(), value.to_owned())
# peer_option
Session::set_option(name.to_owned(), value.to_owned())
# input_os_password
session.read_remote_dir(path.to_owned(), show_hidden.eq("true"));
# send_files
Session::send_files(
    id.parse().unwrap_or(0),
    path.to_owned(),
    to.to_owned(),
    file_num.parse().unwrap_or(0),
    show_hidden.eq("true"),
    is_remote.eq("true"),
)
# set_confirm_override_file
Session::set_confirm_override_file(
    id.parse().unwrap_or(0),
    file_num.parse().unwrap_or(0),
    need_override.eq("true"),
    remember.eq("true"),
    is_upload.eq("true"),
);
# remove_file
session.remove_file(
    id.parse().unwrap_or(0),
    path.to_owned(),
    file_num.parse().unwrap_or(0),
    is_remote.eq("true"),
);
# read_dir_recursive
session.remove_dir_all(
    id.parse().unwrap_or(0),
    path.to_owned(),
    is_remote.eq("true"),
);
# remove_all_empty_dirs
session.remove_dir(
    id.parse().unwrap_or(0),
    path.to_owned(),
    is_remote.eq("true"),
);
# cancel_job
session.cancel_job(id)
# create_dir
session.create_dir(
    id.parse().unwrap_or(0),
    path.to_owned(),
    is_remote.eq("true"),
)
> server side
# update_password
Config::set_password(value)
# chat_server_mode
connection_manager::send_chat(id as i32, text.to_owned())
# home_dir
*config::APP_HOME_DIR.write().unwrap() = value.to_owned()
#