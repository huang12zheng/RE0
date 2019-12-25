/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    publish_article_db_bean
 * 创建时间:  2019-08-03 on 14:12
 * 描述:
 *
 * @author   Dino
 */

import 'dart:convert';

import 'package:cacart/common/common_plugin.dart';
import 'package:cacart/db/provider/publish_article_db_provider.dart';
import 'package:cacart/sureshare/application/component/found/bean/article_list_bean.dart';
import 'package:cacart/sureshare/application/component/found/bean/recommend_home_bean.dart';

class PublishArticleDbBean {
  int reportId;
  String title;
  String orgContent;
  String content;
  int tagId;
  String tagName;
  int userId;
  int articleId;

  ///当前发布的文章类型
  int type;

  ///群id
  int groupId;

  ///鉴论的鉴定报告json
  Reports report;

  ///发表文章的封面图
  String coverImageUrl;

  ///发表文章的底图
  List<String> imageUrls;

  PublishArticleDbBean(
      {this.reportId,
      this.title,
      this.orgContent,
      this.content,
      this.tagId,
      this.tagName,
      this.userId,
      this.type,
      this.report,
      this.coverImageUrl,
      this.groupId,
      this.imageUrls,
      this.articleId});

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map[PublishArticleDbProvider.reportId] = reportId;
    map[PublishArticleDbProvider.title] = title;
    map[PublishArticleDbProvider.orgContent] = orgContent;
    map[PublishArticleDbProvider.content] = content;
    map[PublishArticleDbProvider.tagId] = tagId;
    map[PublishArticleDbProvider.tagName] = tagName;
    map[PublishArticleDbProvider.userId] = userId;
    map[PublishArticleDbProvider.type] = type;
    map[PublishArticleDbProvider.groupId] =
        ObjectUtil.isEmpty(groupId) ? -1 : groupId;
    map[PublishArticleDbProvider.reportJson] =
        ObjectUtil.isEmpty(report) ? '' : json.encode(report.toJson(report));
    map[PublishArticleDbProvider.coverImageUrl] = coverImageUrl;
    map[PublishArticleDbProvider.imageUrlsJson] =
        ObjectUtil.isEmpty(imageUrls) ? '' : json.encode(imageUrls);
    return map;
  }

  PublishArticleDbBean.fromJson(Map<String, dynamic> map) {
    reportId = map[PublishArticleDbProvider.reportId];
    title = map[PublishArticleDbProvider.title];
    orgContent = map[PublishArticleDbProvider.orgContent];
    content = map[PublishArticleDbProvider.content];
    tagId = map[PublishArticleDbProvider.tagId];
    tagName = map[PublishArticleDbProvider.tagName];
    userId = map[PublishArticleDbProvider.userId];
    groupId = map[PublishArticleDbProvider.groupId];
    type = map[PublishArticleDbProvider.type];
    report = !ObjectUtil.isEmptyString(map[PublishArticleDbProvider.reportJson])
        ? Reports.fromJson(
            json.decode(map[PublishArticleDbProvider.reportJson]))
        : null;
    coverImageUrl = map[PublishArticleDbProvider.coverImageUrl];
    imageUrls =
        ObjectUtil.isEmptyString(map[PublishArticleDbProvider.imageUrlsJson])
            ? []
            : List<String>.from(
                json.decode(map[PublishArticleDbProvider.imageUrlsJson]));
  }

  PublishArticleDbBean mergeData(
      PublishArticleDbBean currentData, PublishArticleDbBean selectData) {
    currentData.title = selectData.title;
    currentData.orgContent = selectData.orgContent;
    currentData.content = selectData.content;
    currentData.tagId = selectData.tagId;
    currentData.tagName = selectData.tagName;
    currentData.coverImageUrl = selectData.coverImageUrl;
    currentData.report = selectData.report;
    currentData.imageUrls = selectData.imageUrls;
    return currentData;
  }

  PublishArticleDbBean mergeContentData(
      PublishArticleDbBean currentData, PublishArticleDbBean selectData) {
    currentData.title = selectData.title;
    currentData.orgContent = selectData.orgContent;
    currentData.content = selectData.content;
    currentData.tagId = selectData.tagId;
    currentData.tagName = selectData.tagName;
    return currentData;
  }

  static ArticleListBean mergeArticleData(
      ArticleListBean currentData, PublishArticleDbBean selectData) {
    currentData.title = selectData.title;
    currentData.body = selectData.orgContent;
    currentData.tags = ObjectUtil.isEmpty(selectData.tagName)
        ? []
        : [
            ArticleTag(
                tagId: selectData.tagId,
                tagName: selectData.tagName,
                type: selectData.type)
          ];
    currentData.coverImageUrl = selectData.coverImageUrl;
    currentData.summary = selectData.content.length > 40
        ? selectData.content.substring(0, 39)
        : selectData.content;
    if (!ObjectUtil.isEmptyList(selectData.imageUrls)) {
      selectData.imageUrls
          .removeWhere((test) => ObjectUtil.isEmptyString(test));
    }

    currentData.imageUrls = selectData.imageUrls;
    return currentData;
  }
}

// extension ZxUrl on PublishArticleDbBean{
//   static final String articlePublish = '/api/v1/disc/article/pub';
// }