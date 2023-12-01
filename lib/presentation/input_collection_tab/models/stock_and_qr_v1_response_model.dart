class StockAndQrV1Response {
  List<Importers>? importers;
  num? quantityLimit;
  List<String>? usedQrCodes;

  StockAndQrV1Response({this.importers, this.quantityLimit, this.usedQrCodes});

  StockAndQrV1Response.fromJson(Map<String, dynamic> json) {
    if (json['importers'] != null) {
      importers = <Importers>[];
      json['importers'].forEach((v) {
        importers?.add(Importers.fromJson(v));
      });
    }
    quantityLimit = json['quantity_limit'];
    usedQrCodes = json['used_qr_codes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (importers != null) {
      data['importers'] = importers?.map((v) => v.toJson()).toList();
    }
    data['quantity_limit'] = quantityLimit;
    data['used_qr_codes'] = usedQrCodes;
    return data;
  }
}

class Importers {
  String? name;
  int? importerId;
  List<Warehouses>? warehouses;

  Importers({this.name, this.importerId, this.warehouses});

  Importers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    importerId = json['importer_id'];
    if (json['warehouses'] != null) {
      warehouses = <Warehouses>[];
      json['warehouses'].forEach((v) {
        warehouses?.add(Warehouses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['importer_id'] = importerId;
    if (warehouses != null) {
      data['warehouses'] = warehouses?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Warehouses {
  String? name;
  int? id;
  List<CurrentStock>? currentStock;

  Warehouses({this.name, this.id, this.currentStock});

  Warehouses.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['current_stock'] != null) {
      currentStock = <CurrentStock>[];
      json['current_stock'].forEach((v) {
        currentStock?.add(CurrentStock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    if (currentStock != null) {
      data['current_stock'] = currentStock?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentStock {
  String? importerName;
  num? parentEntityId;
  int? itemId;
  String? itemName;
  num? quantity;
  num? tonnage;
  num? transferedQuantity;
  num? transferedTonnage;
  num? soldQuantity;
  num? soldTonnage;
  num? unitOfMeasureId;
  String? unitOfMeasure;
  String? vat;
  String? type;
  num? stdUnitApp;
  num? pacakageWeight;
  num? price;
  num? subsidyPercentage;

  CurrentStock(
      {this.importerName,
      this.parentEntityId,
      this.itemId,
      this.itemName,
      this.quantity,
      this.tonnage,
      this.transferedQuantity,
      this.transferedTonnage,
      this.soldQuantity,
      this.soldTonnage,
      this.unitOfMeasureId,
      this.unitOfMeasure,
      this.vat,
      this.type,
      this.stdUnitApp,
      this.pacakageWeight,
      this.price,
      this.subsidyPercentage});

  CurrentStock.fromJson(Map<String, dynamic> json) {
    importerName = json['importer_name'];
    parentEntityId = json['parent_entity_id'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    quantity = json['quantity'];
    tonnage = json['tonnage'];
    transferedQuantity = json['transfered_quantity'];
    transferedTonnage = json['transfered_tonnage'];
    soldQuantity = json['sold_quantity'];
    soldTonnage = json['sold_tonnage'];
    unitOfMeasureId = json['unit_of_measure_id'];
    unitOfMeasure = json['unit_of_measure'];
    vat = json['vat'];
    type = json['type'];
    stdUnitApp = json['std_unit_app'];
    pacakageWeight = json['pacakage_weight'];
    price = json['price'];
    subsidyPercentage = json['subsidy_percentage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['importer_name'] = importerName;
    data['parent_entity_id'] = parentEntityId;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['quantity'] = quantity;
    data['tonnage'] = tonnage;
    data['transfered_quantity'] = transferedQuantity;
    data['transfered_tonnage'] = transferedTonnage;
    data['sold_quantity'] = soldQuantity;
    data['sold_tonnage'] = soldTonnage;
    data['unit_of_measure_id'] = unitOfMeasureId;
    data['unit_of_measure'] = unitOfMeasure;
    data['vat'] = vat;
    data['type'] = type;
    data['std_unit_app'] = stdUnitApp;
    data['pacakage_weight'] = pacakageWeight;
    data['price'] = price;
    data['subsidy_percentage'] = subsidyPercentage;
    return data;
  }
}
