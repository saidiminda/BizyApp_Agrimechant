class DropdownsResponse {
  List<OnlineItem>? importers;
  List<OnlineItem>? items;
  List<OnlineItem>? warehouses;
  List<Region>? regions;

  DropdownsResponse(
      {this.importers, this.items, this.warehouses, this.regions});

  DropdownsResponse.fromJson(Map<String, dynamic> json) {
    if (json['importers'] != null) {
      importers = <OnlineItem>[];
      json['importers'].forEach((v) {
        importers?.add(OnlineItem.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <OnlineItem>[];
      json['items'].forEach((v) {
        items?.add(OnlineItem.fromJson(v));
      });
    }
    if (json['warehouses'] != null) {
      warehouses = <OnlineItem>[];
      json['warehouses'].forEach((v) {
        warehouses?.add(OnlineItem.fromJson(v));
      });
    }
    if (json['regions'] != null) {
      regions = <Region>[];
      json['regions'].forEach((v) {
        regions?.add(Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (importers != null) {
      data['importers'] = importers?.map((v) => v.toJson()).toList();
    }
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    if (warehouses != null) {
      data['warehouses'] = warehouses?.map((v) => v.toJson()).toList();
    }
    if (regions != null) {
      data['regions'] = regions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlineItem {
  int? id;
  String? name;
  num? quantity = 0;

  OnlineItem({this.id, this.name, this.quantity});

  OnlineItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['quantity'] = quantity;
    return data;
  }
}

class Region {
  int? id;
  String? name;
  String? code;
  List<District>? districts;

  Region({this.id, this.name, this.code, this.districts});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    if (json['districts'] != null) {
      districts = <District>[];
      json['districts'].forEach((v) {
        districts?.add(District.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    if (districts != null) {
      data['districts'] = districts?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class District {
  int? id;
  String? name;
  int? code;
  List<Ward>? wards;

  District({this.id, this.name, this.code, this.wards});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    if (json['wards'] != null) {
      wards = <Ward>[];
      json['wards'].forEach((v) {
        wards?.add(Ward.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    if (wards != null) {
      data['wards'] = wards?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Ward {
  int? id;
  String? name;
  dynamic code;
  List<OnlineItem>? salePoints;
  List<OnlineItem>? villages;

  Ward({this.id, this.name, this.code, this.salePoints});

  Ward.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];

    if (json['sale_points'] != null) {
      salePoints = <OnlineItem>[];
      json['sale_points'].forEach((v) {
        salePoints?.add(OnlineItem.fromJson(v));
      });
    }
    if (json['villages'] != null) {
      villages = <OnlineItem>[];
      json['villages'].forEach((v) {
        villages?.add(OnlineItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    if (salePoints != null) {
      data['sale_points'] = salePoints?.map((v) => v.toJson()).toList();
    }
    if (villages != null) {
      data['villages'] = villages?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
