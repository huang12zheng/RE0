    pub fn module_data<T: 'static>(&self) -> Option<&T>
EventRequest.module_data<T> => self.module_data.get::<T>()


* async_send_with_callback
* DispatchService
```rs
fn call(&self, ctx: DispatchContext) -> Self::Future {
    let module_map = self.module_map.clone();
    let (request, callback) = ctx.into_parts();

    Box::pin(async move {
        let result = {
            // print_module_map_info(&module_map);
            match module_map.get(&request.event) {
                Some(module) => {
                    tracing::trace!("Handle event: {:?} by {:?}", &request.event, module.name);
                    let fut = module.new_service(());
                    let service_fut = fut.await?.call(request);
                    service_fut.await
                }
                None => {
                    let msg = format!("Can not find the event handler. {:?}", request);
                    tracing::error!("{}", msg);
                    Err(InternalError::HandleNotFound(msg).into())
                }
            }
        };

        let response = result.unwrap_or_else(|e| e.into());
        tracing::trace!("Dispatch result: {:?}", response);
        if let Some(callback) = callback {
            callback(response.clone()).await;
        }

        Ok(response)
    })
}
```


let request = ModuleRequest::new(SignUp).payload(payload);
callback:
async_event

    ```rs
    log::trace!("[FFI]: Post data to dart through {} port", port);
    Box::pin(post_to_flutter(resp, port))
    ```


```rs
#[inline(always)]
async fn post_to_flutter(response: EventResponse, port: i64) {
    let isolate = allo_isolate::Isolate::new(port);
    match isolate
        .catch_unwind(async {
            let ffi_resp = FFIResponse::from(response);
            ffi_resp.into_bytes().unwrap().to_vec()
        })
        .await
    {
        Ok(_success) => {
            log::trace!("[FFI]: Post data to dart success");
        }
        Err(e) => {
            if let Some(msg) = e.downcast_ref::<&str>() {
                log::error!("[FFI]: {:?}", msg);
            } else {
                log::error!("[FFI]: allo_isolate post panic");
            }
        }
    }
}
```
forget_rust// flutter端好像只用到了async_event
forget_rust 忘记指针,但值不清空,,等于将资源给dartvm
mem::forget 可能和..一致: CString::from_vec_unchecked()

```rs
pub const fn forget<T>(t: T) {
    let _ = ManuallyDrop::new(t);
}
```

```rs
pub unsafe fn from_vec_unchecked(mut v: Vec<u8>) -> CString {
        v.reserve_exact(1);
        v.push(0);
        CString { inner: v.into_boxed_slice() }
    }
```

```rs
pub fn into_boxed_slice(mut self) -> Box<[T], A> {
        unsafe {
            self.shrink_to_fit();
            let me = ManuallyDrop::new(self);
            let buf = ptr::read(&me.buf);
            let len = me.len();
            buf.into_box(len).assume_init()
        }
    }
```