class CommentsResponse {
  int? id;
  int? userId;
  String? message;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? name;
  String? username;
  String? phoneNumber;
  List<CommentReplies>? commentReplies;

  CommentsResponse(
      {this.id,
      this.userId,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.username,
      this.phoneNumber,
      this.commentReplies});

  CommentsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = int.tryParse(json['user_id'].toString());
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    if (json['comment_replies'] != null) {
      commentReplies = <CommentReplies>[];
      json['comment_replies'].forEach((v) {
        commentReplies?.add(CommentReplies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    data['username'] = username;
    data['phone_number'] = phoneNumber;
    if (commentReplies != null) {
      data['comment_replies'] = commentReplies?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommentReplies {
  int? id;
  int? userId;
  String? message;
  int? commentId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? name;

  CommentReplies(
      {this.id,
      this.userId,
      this.message,
      this.commentId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name});

  CommentReplies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = int.tryParse(json['user_id'].toString());
    message = json['message'];
    commentId = int.tryParse(json['comment_id'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['message'] = message;
    data['comment_id'] = commentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    return data;
  }
}
