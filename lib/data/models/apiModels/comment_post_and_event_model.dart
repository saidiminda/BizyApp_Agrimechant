class CommentPostAndEvent {
  int? postId;
  String? descriptions;
  int? userId;

  CommentPostAndEvent({this.postId, this.descriptions, this.userId});

  CommentPostAndEvent.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    descriptions = json['descriptions'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['post_id'] = postId;
    data['descriptions'] = descriptions;
    data['user_id'] = userId;
    return data;
  }
}
