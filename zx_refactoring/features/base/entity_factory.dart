import 'package:cacart/db/bean/publish_article_db_bean.dart';
import 'package:cacart/features/module/send/domain/send_provider.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (T.toString() == "PublishArticleDbBean") return PublishArticleDbBean.fromJson(json) as T;
    return null;
  }

  static generateProvider<T>() {
    if (T.toString() == "PublishArticleDbBean") return PublishArticleDbProvider();
    return null;
  }
}