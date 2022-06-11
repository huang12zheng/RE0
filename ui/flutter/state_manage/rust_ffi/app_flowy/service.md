# where use Service trait
* impl<H, T, R> Service<ServiceRequest> for HandlerService<H, T, R>
* impl Service<ModuleRequest> for ModuleService {
* impl Service<DispatchContext> for DispatchService {
* impl ServiceFactory<ModuleRequest> for Module {
  * type Service = BoxService<ModuleRequest, Self::Response, Self::Error>;
* impl<S, Req, Res, Err> Service<Req> for ServiceWrapper<S>
* impl<H, T, R> Service<ServiceRequest> for HandlerService<H, T, R>


# Handler
* impl<F, T, R> ServiceFactory<ServiceRequest> for HandlerService<F, T, R>
  ready(Ok(self.clone()))