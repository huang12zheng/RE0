import 'package:cacart/domain/index.dart';

class GroupMember extends Who {
  String userId;
  String groupId;
  get id => userId;
}