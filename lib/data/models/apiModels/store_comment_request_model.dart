class StoreCommentRequest {
  int? userId;
  String? message;
  int? commentId;

  StoreCommentRequest({this.userId, this.message, this.commentId});

  StoreCommentRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    message = json['message'];
    commentId = json['comment_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['message'] = message;
    data['comment_id'] = commentId;
    return data;
  }
}
