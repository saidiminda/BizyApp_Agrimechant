class InitialDataResponse {
  List<Villages>? villages;
  List<Villages>? crops;
  List<Villages>? groups;
  List<CommunitySeedBanks>? communitySeedBanks;
  List<Categories>? categories;
  List<Identity>? identity;

  InitialDataResponse(
      {this.villages,
      this.crops,
      this.groups,
      this.communitySeedBanks,
      this.categories,
      this.identity});

  InitialDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['villages'] != null) {
      villages = <Villages>[];
      json['villages'].forEach((v) {
        villages?.add(Villages.fromJson(v));
      });
    }
    if (json['crops'] != null) {
      crops = <Villages>[];
      json['crops'].forEach((v) {
        crops?.add(Villages.fromJson(v));
      });
    }
    if (json['groups'] != null) {
      groups = <Villages>[];
      json['groups'].forEach((v) {
        groups?.add(Villages.fromJson(v));
      });
    }
    if (json['community_seed_banks'] != null) {
      communitySeedBanks = <CommunitySeedBanks>[];
      json['community_seed_banks'].forEach((v) {
        communitySeedBanks?.add(CommunitySeedBanks.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['identity'] != null) {
      identity = <Identity>[];
      json['identity'].forEach((v) {
        identity?.add(Identity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (villages != null) {
      data['villages'] = villages?.map((v) => v.toJson()).toList();
    }
    if (crops != null) {
      data['crops'] = crops?.map((v) => v.toJson()).toList();
    }
    if (groups != null) {
      data['groups'] = groups?.map((v) => v.toJson()).toList();
    }
    if (communitySeedBanks != null) {
      data['community_seed_banks'] =
          communitySeedBanks?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (identity != null) {
      data['identity'] = identity?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Villages {
  String? name;
  int? id;

  Villages({this.name, this.id});

  Villages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class CommunitySeedBanks {
  int? id;
  String? name;
  int? villageId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  CommunitySeedBanks(
      {this.id,
      this.name,
      this.villageId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  CommunitySeedBanks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    villageId = json['village_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['village_id'] = villageId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Categories {
  String? name;
  int? id;
  List<Tags>? tags;

  Categories({this.name, this.id, this.tags});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags?.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    if (tags != null) {
      data['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Tags(
      {this.id,
      this.name,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Identity {
  int? id;
  String? name;
  String? validation;

  Identity({this.id, this.name, this.validation});

  Identity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    validation = json['validation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['validation'] = validation;
    return data;
  }
}
