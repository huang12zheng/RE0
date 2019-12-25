import 'package:cacart/domain/index.dart';

class GroupMember extends Who{
  String id;
  String groupId;

  GroupMember({this.id, this.groupId});

  GroupMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    return data;
  }
}