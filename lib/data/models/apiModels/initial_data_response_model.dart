class InitialDataResponse {
  List<Crops>? crops;
  List<Crops>? villages;
  List<Crops>? regions;
  List<Crops>? questionnaires;
  List<Crops>? educationLevels;
  List<Crops>? businessType;
  List<Crops>? valueChainActivities;
  List<Crops>? difficulties;
  List<Crops>? marketInformation;
  List<Crops>? typeOfEquipment;
  List<Crops>? sourceInputs;

  InitialDataResponse(
      {this.crops,
      this.villages,
      this.regions,
      this.questionnaires,
      this.educationLevels,
      this.businessType,
      this.valueChainActivities,
      this.difficulties,
      this.marketInformation,
      this.typeOfEquipment,
      this.sourceInputs});

  InitialDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['crops'] != null) {
      crops = <Crops>[];
      json['crops'].forEach((v) {
        crops?.add(Crops.fromJson(v));
      });
    }
    if (json['villages'] != null) {
      villages = <Crops>[];
      json['villages'].forEach((v) {
        villages?.add(Crops.fromJson(v));
      });
    }
    if (json['regions'] != null) {
      regions = <Crops>[];
      json['regions'].forEach((v) {
        regions?.add(Crops.fromJson(v));
      });
    }
    if (json['questionnaires'] != null) {
      questionnaires = <Crops>[];
      json['questionnaires'].forEach((v) {
        questionnaires?.add(Crops.fromJson(v));
      });
    }
    if (json['educationLevels'] != null) {
      educationLevels = <Crops>[];
      json['educationLevels'].forEach((v) {
        educationLevels?.add(Crops.fromJson(v));
      });
    }
    if (json['businessType'] != null) {
      businessType = <Crops>[];
      json['businessType'].forEach((v) {
        businessType?.add(Crops.fromJson(v));
      });
    }
    if (json['valueChainActivities'] != null) {
      valueChainActivities = <Crops>[];
      json['valueChainActivities'].forEach((v) {
        valueChainActivities?.add(Crops.fromJson(v));
      });
    }
    if (json['difficulties'] != null) {
      difficulties = <Crops>[];
      json['difficulties'].forEach((v) {
        difficulties?.add(Crops.fromJson(v));
      });
    }
    if (json['marketInformation'] != null) {
      marketInformation = <Crops>[];
      json['marketInformation'].forEach((v) {
        marketInformation?.add(Crops.fromJson(v));
      });
    }
    if (json['typeOfEquipment'] != null) {
      typeOfEquipment = <Crops>[];
      json['typeOfEquipment'].forEach((v) {
        typeOfEquipment?.add(Crops.fromJson(v));
      });
    }
    if (json['sourceInputs'] != null) {
      sourceInputs = <Crops>[];
      json['sourceInputs'].forEach((v) {
        sourceInputs?.add(Crops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (crops != null) {
      data['crops'] = crops?.map((v) => v.toJson()).toList();
    }
    if (villages != null) {
      data['villages'] = villages?.map((v) => v.toJson()).toList();
    }
    if (regions != null) {
      data['regions'] = regions?.map((v) => v.toJson()).toList();
    }
    if (questionnaires != null) {
      data['questionnaires'] = questionnaires?.map((v) => v.toJson()).toList();
    }
    if (educationLevels != null) {
      data['educationLevels'] =
          educationLevels?.map((v) => v.toJson()).toList();
    }
    if (businessType != null) {
      data['businessType'] = businessType?.map((v) => v.toJson()).toList();
    }
    if (valueChainActivities != null) {
      data['valueChainActivities'] =
          valueChainActivities?.map((v) => v.toJson()).toList();
    }
    if (difficulties != null) {
      data['difficulties'] = difficulties?.map((v) => v.toJson()).toList();
    }
    if (marketInformation != null) {
      data['marketInformation'] =
          marketInformation?.map((v) => v.toJson()).toList();
    }
    if (typeOfEquipment != null) {
      data['typeOfEquipment'] =
          typeOfEquipment?.map((v) => v.toJson()).toList();
    }
    if (sourceInputs != null) {
      data['sourceInputs'] = sourceInputs?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Crops {
  String? name;
  int? id;

  Crops({this.name, this.id});

  Crops.fromJson(Map<String, dynamic> json) {
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
