import 'package:cacart/domain/uml/index.dart';

// class Querier<T extends Who> extends Who {
//   final T querier;
//   Querier(this.querier);
//   @override
//   String toId() => querier.toId();
// }

mixin QuerierMixin<O extends Who,H extends How,T extends What> {
   O     get who   => null;
   H     get how   => JsonHttp;
   T     get what  => null;
}