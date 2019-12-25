import 'package:cacart/common/http/http_utils.dart';

import 'index.dart';
// import '../bean/article_db_bean.dart';

abstract class SendRepository<T> extends Repositorys {
  /// it is a bug, but I cant solve
  final _sendProvider = EntityFactory.generateProvider<T>();

  Future send(T bean);
  Future clearCache(T bean);
  Future shareData(T bean);

  /// Hint: [query] is need to be immediate to use XXXProvider
}


/// [in case] for future ,some user would cache in 
class SendArticleRepositoryImpl extends SendRepository<PublishArticleDbBean>{
  @override
  Future send(bean) async{
    dynamic data = await HttpUtil.instance.formPost(
      ApiService.articlePublish,
      // PublishArticleDbBean.url
      params: bean.toMap()
    );
    
    return data['success'];
  }

  /// no await just for [performance]
  @override
  Future clearCache(PublishArticleDbBean bean) async{
    _sendProvider.delete(bean);
  }

  shareData(bean) => null;

}
