我们有两个入口`async_event` `sync_event`, 它们都会走到[async_send_with_callback](#async_send_with_callback)
```rs
#[no_mangle]
pub extern "C" fn async_event(port: i64, input: *const u8, len: usize) {
    let request: ModuleRequest = FFIRequest::from_u8_pointer(input, len).into();
    log::trace!(
        "[FFI]: {} Async Event: {:?} with {} port",
        &request.id,
        &request.event,
        port
    );

    let dispatcher = match FLOWY_SDK.get() {
        None => {
            log::error!("sdk not init yet.");
            return;
        }
        Some(e) => e.dispatcher.clone(),
    };
    let _ = EventDispatcher::async_send_with_callback(dispatcher, request, move |resp: EventResponse| { ////<<<<<<<<<<<<>>>>>>>>>>>>
        log::trace!("[FFI]: Post data to dart through {} port", port);
        Box::pin(post_to_flutter(resp, port))
    });
}
```
<span id="async_send_with_callback"></span>
* async_send_with_callback

```rs
EventDispatcher::async_send_with_callback(dispatcher, request,callback)
join_handle = dispatch.runtime.spawn(async move {
    service
        .call(service_ctx)
        .await
Box::pin(async move {
        join_handle.await
```
>>>>  可以发现要关注的是 **service.call(service_ctx)**  或者  Box::new(`DispatchService` { module_map }); 
> 简单来说, service is `DispatchService{ module_map }`
> ModuleMap is as_module_map(module_factory())
> 然后是 as_module_map(Vec<Module>), 请 List 中每个元素 inflat化, [{1.1,1.2},{2}]-> ,{1.1,1.2,1.3}
> module_factory 又是什么?  Vec<Module>  就是下面的`mk_modules`以及展开的好多东西. 主要是: [Module::new()这里](#module)
```rust
let dispatcher = Arc::new(EventDispatcher::construct(runtime, || {
    mk_modules(
        &ws_conn,           /// mk_user_module(user_session.clone());       //参数:/// ws_conn) = mk_local_server(&config.server_config);
        &folder_manager,    /// mk_folder_module(folder_manager.clone());   //参数:/// FolderDepsResolver::resolve(
        &grid_manager,      /// mk_network_module(ws_conn.clone());         //参数:/// GridDepsResolver::resolve(ws_conn.clone(), user_session.clone());
        &user_session,      /// mk_grid_module(grid_manager.clone());       //参数:/// user_session = mk_user_session(&config, &local_server, &config.server_config);
        &text_block_manager,/// mk_text_block_module(text_block_manager.clone()); //参数:/// text_block_manager = TextBlockDepsResolver::resolve(
        //// vec![...]
    )
}));
```
<span id="module">跳转到的地方</span>

```rs
flowy_user::event_map::create(user_session)[#module]
    Module::new()
        .name("Flowy-User")
        .data(user_session)
        .event(UserEvent::SignIn, sign_in)      // let user_profile = session.sign_in(params).await?;
            ```rust
                let resp = self.cloud_service.sign_in(params).await?;
                let session: Session = resp.clone().into();
                let _ = self.set_session(Some(session))?;
                let user_table = self.save_user(resp.into()).await?;
                let user_profile: UserProfile = user_table.into();
                self.notifier.notify_login(&user_profile.token, &user_profile.id);
                Ok(user_profile)
            ```
        .event(UserEvent::SignUp, sign_up)
        .event(UserEvent::InitUser, init_user_handler)
flowy_folder::event_map::create(folder_manager)

```

简单来说, 就是通过event来给map添加 {event, wrap(handler) }

```rs
event(e,handler){//validate
    insert(event, factory(HandlerService::new(handler)));`  /// wrap(`handler`)
}
```
* sync_send
...

----


不理解为什么要这么复杂, 直接用web框架不可以吗?