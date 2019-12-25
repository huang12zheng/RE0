import 'package:cacart/domain/index.dart';
// abstract 
abstract class Tag extends What{
  @override
  String get desc => tagName;
  String get id;
  int get count;
  String tagName;
}
/// VO
class ArticleTag extends Tag{
	int tagId;
	String imageUrl;
	int articleCount;
	int type;
	String tagName;

	ArticleTag({this.tagId, this.imageUrl, this.articleCount, this.type, this.tagName});

	ArticleTag.fromJson(Map<String, dynamic> json) {
		tagId = json['tagId'];
		imageUrl = json['imageUrl'];
		articleCount = json['articleCount'];
		type = json['type'];
		tagName = json['tagName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['tagId'] = this.tagId;
		data['imageUrl'] = this.imageUrl;
		data['articleCount'] = this.articleCount;
		data['type'] = this.type;
		data['tagName'] = this.tagName;
		return data;
	}

  @override
  int get count => articleCount;

  @override
  String get id => tagId.toString();
}
