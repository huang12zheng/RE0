/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    publish_article_db_provider
 * 创建时间:  2019-08-03 on 14:09
 * 描述:
 *
 * @author   Dino
 */

import 'dart:async';

import 'package:cacart/common/common_plugin.dart';
import 'package:cacart/features/base/index.dart';
import 'package:sqflite/sqflite.dart';

import 'index.dart';
class PublishArticleDbProvider extends DBProvider<PublishArticleDbBean> with DbProviderMixin {
  String _tableName = 'PublishArticle';
  static String id = 'id';

  ///鉴定报告id
  static String reportId = 'reportId';

  ///标题
  static String title = 'title';

  ///提交给后台的富文本文字
  static String orgContent = 'orgContent';

  ///去除富文本文字
  static String content = 'content';

  ///话题id
  static String tagId = 'tagId';

  ///话题名称
  static String tagName = 'tagName';

  ///用户id
  static String userId = 'userId';

  ///当前发布的文章类型
  static String type = 'type';

  ///鉴论的鉴定报告json
  static String reportJson = 'reportJson';

  ///发表文章的封面图
  static String coverImageUrl = 'coverImageUrl';

  ///发表文章的底图
  static String imageUrlsJson = 'imageUrlsJson';

  ///群id
  static String groupId = 'groupId';

  @override
  tableName() {
    return _tableName;
  }
  @override
  insert(bean) async {
    Database db = await getDataBase();
    var provider = await _getProvider(db, bean);
    if (provider > 0) {
      await delete(bean);
    }
    return await db.insert(_tableName, bean.toMap());
  }

  Future _getProvider(
    Database db,
     bean,
  ) async {
    if(bean.userId==null)bean.userId=UserCenter.instance.userId();
    List<Map<String, dynamic>> maps = await db.query(_tableName,
        where: "$type = ? and $userId = ? and $groupId = ?",
        whereArgs: [
          bean.type,
          bean.userId,
          ObjectUtil.isEmpty(bean.groupId) ? -1 : bean.groupId
        ]);
    return maps.length;
  }

  @override
  createTableSqlString() {
    return createTable(
        _tableName,
        reportId,
        title,
        orgContent,
        content,
        tagId,
        tagName,
        userId,
        type,
        reportJson,
        coverImageUrl,
        imageUrlsJson,
        groupId);
  }

  createTable(
    String tableName,
    String reportId,
    String title,
    String orgContent,
    String content,
    String tagId,
    String tagName,
    String userId,
    String type,
    String reportJson,
    String coverImageUrl,
    String imageUrlsJson,
    String groupId,
  ) {
    return 'CREATE TABLE $_tableName ($id INTEGER PRIMARY KEY, '
        '$title TEXT, '
        '$orgContent TEXT,'
        '$reportId INTEGER,'
        '$content TEXT,'
        '$tagId INTEGER, '
        '$tagName TEXT,'
        '$userId INTEGER,'
        '$type INTEGER,'
        '$groupId INTEGER,'
        '$reportJson TEXT,'
        '$coverImageUrl TEXT,'
        '$imageUrlsJson TEXT)';
  }

  Future<PublishArticleDbBean> getData(PublishArticleDbBean bean) async {
    Database db = await getDataBase();
    if(bean.userId==null)bean.userId=UserCenter.instance.userId();
    List<Map<String, dynamic>> maps = await db.query(_tableName,
        where: "$type = ? and $userId = ? and $groupId = ?",
        whereArgs: [
          bean.type,
          bean.userId,
          ObjectUtil.isEmpty(bean.groupId) ? -1 : bean.groupId
        ]);
    if (ObjectUtil.isEmptyList(maps)) {
      return null;
    } else {
      return PublishArticleDbBean.fromJson(maps[0]);
    }
  }

  Future delete(bean) async {
    Database db = await getDataBase();
    if(bean.userId==null) bean.userId=UserCenter.instance.userId();
    await db.delete(_tableName,
        where: "$type = ? and $userId = ? and $groupId = ?",
        whereArgs: [bean.type, bean.userId, ObjectUtil.isEmpty(bean.groupId) ? -1 : bean.groupId]);
  }
}
