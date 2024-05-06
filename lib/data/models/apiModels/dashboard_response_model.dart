class DashboardResponse {
  List<InputTypeCategories>? inputTypeCategories;
  List<ServiceProviders>? serviceProviders;
  List<Warehouses>? warehouses;
  List<Seasons>? seasons;
  List<UnitOfMeasures>? unitOfMeasures;
  List<Identity>? identity;
  List<int>? ward;
  List<NormalItem>? groups;
  List<NormalItem>? crops;
  List<NormalItem>? villages;
  List<InputCategories>? inputCategories;
  List<NormalItem>? unionAttachments;
  List<NormalItem>? signatoryAttachments;

  DashboardResponse(
      {this.inputTypeCategories,
      this.serviceProviders,
      this.warehouses,
      this.seasons,
      this.unitOfMeasures,
      this.identity,
      this.ward,
      this.groups,
      this.crops,
      this.villages,
      this.inputCategories,
      this.unionAttachments,
      this.signatoryAttachments});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    if (json['input_type_categories'] != null) {
      inputTypeCategories = <InputTypeCategories>[];
      json['input_type_categories'].forEach((v) {
        inputTypeCategories?.add(InputTypeCategories.fromJson(v));
      });
    }
    if (json['service_providers'] != null) {
      serviceProviders = <ServiceProviders>[];
      json['service_providers'].forEach((v) {
        serviceProviders?.add(ServiceProviders.fromJson(v));
      });
    }
    if (json['warehouses'] != null) {
      warehouses = <Warehouses>[];
      json['warehouses'].forEach((v) {
        warehouses?.add(Warehouses.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons?.add(Seasons.fromJson(v));
      });
    }
    if (json['unit_of_measures'] != null) {
      unitOfMeasures = <UnitOfMeasures>[];
      json['unit_of_measures'].forEach((v) {
        unitOfMeasures?.add(UnitOfMeasures.fromJson(v));
      });
    }
    if (json['identity'] != null) {
      identity = <Identity>[];
      json['identity'].forEach((v) {
        identity?.add(Identity.fromJson(v));
      });
    }
    ward = (json['ward'] ?? []).cast<int>();
    if (json['groups'] != null) {
      groups = <NormalItem>[];
      json['groups'].forEach((v) {
        groups?.add(NormalItem.fromJson(v));
      });
    }
    if (json['crops'] != null) {
      crops = <NormalItem>[];
      json['crops'].forEach((v) {
        crops?.add(NormalItem.fromJson(v));
      });
    }
    if (json['villages'] != null) {
      villages = <NormalItem>[];
      json['villages'].forEach((v) {
        villages?.add(NormalItem.fromJson(v));
      });
    }
    if (json['input_categories'] != null) {
      inputCategories = <InputCategories>[];
      json['input_categories'].forEach((v) {
        inputCategories?.add(InputCategories.fromJson(v));
      });
    }
    if (json['union_attachments'] != null) {
      unionAttachments = <NormalItem>[];
      json['union_attachments'].forEach((v) {
        unionAttachments?.add(NormalItem.fromJson(v));
      });
    }
    if (json['signatory_attachments'] != null) {
      signatoryAttachments = <NormalItem>[];
      json['signatory_attachments'].forEach((v) {
        signatoryAttachments?.add(NormalItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (inputTypeCategories != null) {
      data['input_type_categories'] =
          inputTypeCategories?.map((v) => v.toJson()).toList();
    }
    if (serviceProviders != null) {
      data['service_providers'] =
          serviceProviders?.map((v) => v.toJson()).toList();
    }
    if (warehouses != null) {
      data['warehouses'] = warehouses?.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      data['seasons'] = seasons?.map((v) => v.toJson()).toList();
    }
    if (unitOfMeasures != null) {
      data['unit_of_measures'] =
          unitOfMeasures?.map((v) => v.toJson()).toList();
    }
    if (identity != null) {
      data['identity'] = identity?.map((v) => v.toJson()).toList();
    }
    data['ward'] = ward;
    if (groups != null) {
      data['groups'] = groups?.map((v) => v.toJson()).toList();
    }
    if (crops != null) {
      data['crops'] = crops?.map((v) => v.toJson()).toList();
    }
    if (villages != null) {
      data['villages'] = villages?.map((v) => v.toJson()).toList();
    }
    if (inputCategories != null) {
      data['input_categories'] =
          inputCategories?.map((v) => v.toJson()).toList();
    }
    if (unionAttachments != null) {
      data['union_attachments'] =
          unionAttachments?.map((v) => v.toJson()).toList();
    }
    if (signatoryAttachments != null) {
      data['signatory_attachments'] =
          signatoryAttachments?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InputTypeCategories {
  int? id;
  String? name;
  List<Purposes>? purposes;

  InputTypeCategories({this.id, this.name, this.purposes});

  InputTypeCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['purposes'] != null) {
      purposes = <Purposes>[];
      json['purposes'].forEach((v) {
        purposes?.add(Purposes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    if (purposes != null) {
      data['purposes'] = purposes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Purposes {
  int? id;
  String? name;
  List<int>? items;

  Purposes({this.id, this.name, this.items});

  Purposes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    items = json['items'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['items'] = items;
    return data;
  }
}

class ServiceProviders {
  int? id;
  String? name;
  List<SubCategories>? subCategories;
  List<NormalItem>? items;
  List<NormalItem>? attachments;

  ServiceProviders(
      {this.id, this.name, this.subCategories, this.items, this.attachments});

  ServiceProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories?.add(SubCategories.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <NormalItem>[];
      json['items'].forEach((v) {
        items?.add(NormalItem.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = <NormalItem>[];
      json['attachments'].forEach((v) {
        attachments?.add(NormalItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (subCategories != null) {
      data['sub_categories'] = subCategories?.map((v) => v.toJson()).toList();
    }
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    if (attachments != null) {
      data['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  List<NormalItem>? children;

  SubCategories({this.id, this.name, this.children});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['children'] != null) {
      children = <NormalItem>[];
      json['children'].forEach((v) {
        children?.add(NormalItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (children != null) {
      data['children'] = children?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NormalItem {
  int? id;
  String? name;

  NormalItem({this.id, this.name});

  NormalItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Warehouses {
  String? warehouseName;
  int? warehouseId;

  Warehouses({this.warehouseName, this.warehouseId});

  Warehouses.fromJson(Map<String, dynamic> json) {
    warehouseName = json['warehouse_name'];
    warehouseId = json['warehouse_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['warehouse_name'] = warehouseName;
    data['warehouse_id'] = warehouseId;
    return data;
  }
}

class Seasons {
  int? id;
  String? name;
  List<int>? groups;

  Seasons({this.id, this.name, this.groups});

  Seasons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    groups = json['groups'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['groups'] = groups;
    return data;
  }
}

class UnitOfMeasures {
  int? id;
  String? name;
  String? abbreviation;

  UnitOfMeasures({this.id, this.name, this.abbreviation});

  UnitOfMeasures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abbreviation'] = abbreviation;
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

class InputCategories {
  int? id;
  dynamic accountId;
  int? itemGroupId;
  String? name;
  dynamic code;

  InputCategories(
      {this.id, this.accountId, this.itemGroupId, this.name, this.code});

  InputCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['account_id'];
    itemGroupId = json['item_group_id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['account_id'] = accountId;
    data['item_group_id'] = itemGroupId;
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
