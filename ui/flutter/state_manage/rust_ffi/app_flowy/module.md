# ModuleDataMap
ModuleDataMap is map: HashMap<TypeId, Box<dyn Any + Sync + Send>>
> just HashMap
> trait would have new, insert, remove, get_mut, contains, extend
> then,we are instest in where these methond would call
* insert
Arc::get_mut(&mut self.module_data).unwrap().insert(AppData::new(data));
> call in `Module`
* remove,get_mut,contain,extend no be called
* get
if let Some(data) = self.module_data.get::<T>() {
> call in `EventRequest`

# EventRequest
* module_data
from_request=> req.module_data::<AppData<T>>())
> in FromRequest for `AppData`
> 将之前的Appdata数据取出来.  好奇有关 Appdata 以及 EventRequest被在哪里调用了.

* reference of EventRequest
1. FromRequest for Data<T>
unexpected_none_payload(req)
2. Responder for Data<T>
no use

3.  Service<ModuleRequest> for ModuleService
let request = EventRequest::new(id, event, module_data);
 match self.service_map.get(&request.event) {
4.  HandlerServiceFuture
5.  ServiceRequest

# ServiceResponse
request: EventRequest,
response: EventResponse,

# pub trait Service<Request>