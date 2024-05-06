class CreatePostAndEventsRequest {
  String? imeiNumber;
  String? appVersionName;
  String? date;
  String? time;
  int? lastPostIndex;
  List<Posts>? posts;

  CreatePostAndEventsRequest(
      {this.imeiNumber,
      this.appVersionName,
      this.date,
      this.time,
      this.lastPostIndex,
      this.posts});

  CreatePostAndEventsRequest.fromJson(Map<String, dynamic> json) {
    imeiNumber = json['imei_number'];
    appVersionName = json['app_version_name'];
    date = json['date'];
    time = json['time'];
    lastPostIndex = json['last_post_index'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imei_number'] = imeiNumber;
    data['app_version_name'] = appVersionName;
    data['date'] = date;
    data['time'] = time;
    data['last_post_index'] = lastPostIndex;
    if (posts != null) {
      data['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  int? localId;
  int? unpublished;
  Coordinate? coordinate;
  List<int>? tagId;
  List<int>? categoryId;
  List<Comments>? comments;
  int? farmerId;
  String? farmerName;
  String? descriptions;
  int? userId;
  String? photo;
  String? video;
  String? audio;
  bool? isAudioPlay;
  bool? isVideoPlay;
  bool? isMageViewed;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<String>? tags;
  List<String>? categories;
  String? photoUrl;
  String? videoUrl;
  String? audioUrl;

  Posts(
      {this.id,
      this.localId,
      this.unpublished,
      this.coordinate,
      this.tagId,
      this.categoryId,
      this.comments,
      this.farmerId,
      this.farmerName,
      this.descriptions,
      this.userId,
      this.photo,
      this.video,
      this.audio,
      this.isAudioPlay,
      this.isVideoPlay,
      this.isMageViewed,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.tags,
      this.categories,
      this.photoUrl,
      this.videoUrl,
      this.audioUrl});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    localId = json['local_id'];
    unpublished = json['unpublished'];
    coordinate = json['coordinate'] != null
        ? Coordinate?.fromJson(json['coordinate'])
        : null;
    tagId = (json['tag_id'] ?? []).cast<int>();
    categoryId = (json['category_id'] ?? []).cast<int>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments?.add(Comments.fromJson(v));
      });
    }
    farmerId = int.tryParse(json['farmer_id'].toString());
    farmerName = json['farmer_name'];
    descriptions = json['descriptions'];
    userId = int.tryParse(json['user_id'].toString());
    photo = json['photo'];
    video = json['video'];
    audio = json['audio'];
    isAudioPlay = json['is_audio_play'];
    isVideoPlay = json['is_video_play'];
    isMageViewed = json['is_mage_viewed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    tags = (json['tags'] ?? []).cast<String>();
    categories = (json['categories'] ?? []).cast<String>();
    photoUrl = json['photo_url'];
    videoUrl = json['video_url'];
    audioUrl = json['audio_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['local_id'] = localId;
    data['unpublished'] = unpublished;
    if (coordinate != null) {
      data['coordinate'] = coordinate?.toJson();
    }
    data['tag_id'] = tagId;
    data['category_id'] = categoryId;
    if (comments != null) {
      data['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    data['farmer_id'] = farmerId;
    data['farmer_name'] = farmerName;
    data['descriptions'] = descriptions;
    data['user_id'] = userId;
    data['photo'] = photo;
    data['video'] = video;
    data['audio'] = audio;
    data['is_audio_play'] = isAudioPlay;
    data['is_video_play'] = isVideoPlay;
    data['is_mage_viewed'] = isMageViewed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['tags'] = tags;
    data['categories'] = categories;
    data['photo_url'] = photoUrl;
    data['video_url'] = videoUrl;
    data['audio_url'] = audioUrl;
    return data;
  }
}

class Coordinate {
  String? latitude;
  String? longitude;

  Coordinate({this.latitude, this.longitude});

  Coordinate.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Comments {
  int? id;
  int? postId;
  String? descriptions;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  UserPost? user;

  Comments(
      {this.id,
      this.postId,
      this.descriptions,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = int.tryParse(json['post_id'].toString());
    descriptions = json['descriptions'];
    userId = int.tryParse(json['user_id'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    user = json['user'] != null ? UserPost?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['descriptions'] = descriptions;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}

class UserPost {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phoneNumber;
  int? farmerId;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserPost(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.phoneNumber,
      this.farmerId,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  UserPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    farmerId = int.tryParse(json['farmer_id'].toString());
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['phone_number'] = phoneNumber;
    data['farmer_id'] = farmerId;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
