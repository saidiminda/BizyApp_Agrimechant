class GetFarmerResponse {
  num? memberId;
  String? farmerOrganisation;
  String? name;
  String? phoneNumber;
  String? villageName;
  num? villageId;
  num? farmSize;
  num? trees;
  num? stdUnitApp=0;
  String? wallet;
  dynamic fingerPrintData;
  List<ReceivedItems>? receivedItems;

  GetFarmerResponse(
      {this.memberId,
      this.farmerOrganisation,
      this.name,
      this.phoneNumber,
      this.villageName,
      this.villageId,
      this.farmSize,
      this.trees,
      this.stdUnitApp,
      this.wallet,
      this.fingerPrintData,
      this.receivedItems});

  GetFarmerResponse.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    farmerOrganisation = json['farmer_organisation'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    villageName = json['village_name'];
    villageId = json['village_id'];
    farmSize = json['farm_size'];
    trees = json['trees'];
    stdUnitApp = json['std_unit_app'];
    wallet = json['wallet'];
    fingerPrintData = json['fingerPrintData'];
    if (json['received_items'] != null) {
      receivedItems = <ReceivedItems>[];
      json['received_items'].forEach((v) {
        receivedItems?.add(ReceivedItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['farmer_organisation'] = farmerOrganisation;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['village_name'] = villageName;
    data['village_id'] = villageId;
    data['farm_size'] = farmSize;
    data['trees'] = trees;
    data['std_unit_app'] = stdUnitApp;
    data['wallet'] = wallet;
    data['fingerPrintData'] = fingerPrintData;
    if (receivedItems != null) {
      data['received_items'] = receivedItems?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReceivedItems {
  num? stockEntryId;
  num? stockEntryItemId;
  String? date;
  String? transactionId;
  String? agrodelaer;
  num? itemId;
  String? itemName;
  num? stdUnitApp =0;
  String? type;
  num? pacakageWeight;
  num? quantity;
  List<String>? qrCode;

  ReceivedItems(
      {this.stockEntryId,
      this.stockEntryItemId,
      this.date,
      this.transactionId,
      this.agrodelaer,
      this.itemId,
      this.itemName,
      this.stdUnitApp,
      this.type,
      this.pacakageWeight,
      this.quantity,
      this.qrCode});

  ReceivedItems.fromJson(Map<String, dynamic> json) {
    stockEntryId = json['stock_entry_id'];
    stockEntryItemId = json['stock_entry_item_id'];
    date = json['date'];
    transactionId = json['transaction_id'];
    agrodelaer = json['agrodelaer'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    stdUnitApp = json['std_unit_app'];
    type = json['type'];
    pacakageWeight = json['pacakage_weight'];
    quantity = json['quantity'];
    qrCode = json['qr_code'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['stock_entry_id'] = stockEntryId;
    data['stock_entry_item_id'] = stockEntryItemId;
    data['date'] = date;
    data['transaction_id'] = transactionId;
    data['agrodelaer'] = agrodelaer;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['std_unit_app'] = stdUnitApp;
    data['type'] = type;
    data['pacakage_weight'] = pacakageWeight;
    data['quantity'] = quantity;
    data['qr_code'] = qrCode;
    return data;
  }
}
