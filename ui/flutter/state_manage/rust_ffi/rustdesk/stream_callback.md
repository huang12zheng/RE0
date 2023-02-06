# push_event
Session.push_event
```rs
fn push_event(&self, name: &str, event: Vec<(&str, &str)>) {
        let mut h: HashMap<&str, &str> = event.iter().cloned().collect();
        assert!(h.get("name").is_none());
        h.insert("name", name);

        if let Some(s) = EVENT_STREAM.read().unwrap().as_ref() {
            s.add(serde_json::ser::to_string(&h).unwrap_or("".to_owned()));
        };
    }
```

```dart
void updateEventListener(String peerId) {
    final void Function(Map<String, dynamic>) cb = (evt) {
      var name = evt['name'];
      if (name == 'msgbox') {
        handleMsgBox(evt, peerId);
      } else if (name == 'peer_info') {
        handlePeerInfo(evt);
      } else if (name == 'connection_ready') {
        FFI.ffiModel.setConnectionType
      } else if (name == 'on_client_remove') {
        FFI.serverModel.onClientRemove(evt);
      }
    PlatformFFI.setEventCallback(cb);  // _eventCallback = fun; //cb
```
where call updateEventListener
```dart
ServerModel.startService() async{}
FileManagerPage.initState()
RemotePage.initState()
```