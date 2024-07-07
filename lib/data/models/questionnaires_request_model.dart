class QuestionnairesRequest {
  String? imeiNumber;
  String? appVersionName;
  String? date;
  String? time;
  int? lastQuestionnaireIndex;
  List<QuestionnaireResponse>? questionnaireResponse;

  QuestionnairesRequest(
      {this.imeiNumber,
      this.appVersionName,
      this.date,
      this.time,
      this.lastQuestionnaireIndex,
      this.questionnaireResponse});

  QuestionnairesRequest.fromJson(Map<String, dynamic> json) {
    imeiNumber = json['imei_number'];
    appVersionName = json['app_version_name'];
    date = json['date'];
    time = json['time'];
    lastQuestionnaireIndex = json['last_questionnaire_index'];
    if (json['questionnaire_response'] != null) {
      questionnaireResponse = <QuestionnaireResponse>[];
      json['questionnaire_response'].forEach((v) {
        questionnaireResponse?.add(QuestionnaireResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imei_number'] = imeiNumber;
    data['app_version_name'] = appVersionName;
    data['date'] = date;
    data['time'] = time;
    data['last_questionnaire_index'] = lastQuestionnaireIndex;
    if (questionnaireResponse != null) {
      data['questionnaire_response'] =
          questionnaireResponse?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionnaireResponse {
  int? id;
  int? editingStatus;
  String? registrationStatus;
  int? questionnaireCategoryId;
  BasicInformation? basicInformation;
  SocioEconomic? socioEconomic;
  CoreBusinesses? coreBusinesses;

  QuestionnaireResponse(
      {this.id,
      this.editingStatus,
      this.registrationStatus,
      this.questionnaireCategoryId,
      this.basicInformation,
      this.socioEconomic,
      this.coreBusinesses});

  QuestionnaireResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    editingStatus = json['editing_status'];
    registrationStatus = json['registration_status'];
    questionnaireCategoryId = json['questionnaire_category_id'];
    basicInformation = json['basic_information'] != null
        ? BasicInformation?.fromJson(json['basic_information'])
        : null;
    socioEconomic = json['socio_economic'] != null
        ? SocioEconomic?.fromJson(json['socio_economic'])
        : null;
    coreBusinesses = json['core_businesses'] != null
        ? CoreBusinesses?.fromJson(json['core_businesses'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['editing_status'] = editingStatus;
    data['registration_status'] = registrationStatus;
    data['questionnaire_category_id'] = questionnaireCategoryId;
    if (basicInformation != null) {
      data['basic_information'] = basicInformation?.toJson();
    }
    if (socioEconomic != null) {
      data['socio_economic'] = socioEconomic?.toJson();
    }
    if (coreBusinesses != null) {
      data['core_businesses'] = coreBusinesses?.toJson();
    }
    return data;
  }
}

class BasicInformation {
  int? id;
  int? cropId;
  int? villageId;
  String? type;
  String? nameOfEntity;
  ContactPerson? contactPerson;
  String? age;
  int? educationLevelId;

  BasicInformation(
      {this.id,
      this.cropId,
      this.villageId,
      this.type,
      this.nameOfEntity,
      this.contactPerson,
      this.age,
      this.educationLevelId});

  BasicInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cropId = json['crop_id'];
    villageId = json['village_id'];
    type = json['type'];
    nameOfEntity = json['name_of_entity'];
    contactPerson = json['contact_person'] != null
        ? ContactPerson?.fromJson(json['contact_person'])
        : null;
    age = json['age'];
    educationLevelId = json['education_level_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['crop_id'] = cropId;
    data['village_id'] = villageId;
    data['type'] = type;
    data['name_of_entity'] = nameOfEntity;
    if (contactPerson != null) {
      data['contact_person'] = contactPerson?.toJson();
    }
    data['age'] = age;
    data['education_level_id'] = educationLevelId;
    return data;
  }
}

class ContactPerson {
  int? id;
  String? name;
  String? phoneNo;
  String? designation;
  String? gender;
  String? emailAddress;

  ContactPerson(
      {this.id,
      this.name,
      this.phoneNo,
      this.designation,
      this.gender,
      this.emailAddress});

  ContactPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNo = json['phone_no'];
    designation = json['designation'];
    gender = json['gender'];
    emailAddress = json['email_address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_no'] = phoneNo;
    data['designation'] = designation;
    data['gender'] = gender;
    data['email_address'] = emailAddress;
    return data;
  }
}

class SocioEconomic {
  int? id;
  int? businessRegistrationTypeId;
  List<int>? valueChainActivities;
  String? licensedEntity;
  String? otherValueChains;
  List<String>? competitors;
  List<AnnualSales>? annualSales;
  List<AnnualCost>? annualCost;
  List<NumberOfEmployees>? numberOfEmployees;
  List<String>? entityPromote;
  List<Buyers>? buyers;
  List<int>? difficulties;
  List<String>? otherDifficulties;
  List<int>? marketInformations;
  ValueChainOrganization? valueChainOrganization;
  List<FinanceUsed>? financeUsed;
  FormalRecord? formalRecord;
  List<String>? problemsRelatedPolicy;
  List<SignificantChallenges>? significantChallenges;
  String? sourceClients;

  SocioEconomic(
      {this.id,
      this.businessRegistrationTypeId,
      this.valueChainActivities,
      this.licensedEntity,
      this.otherValueChains,
      this.competitors,
      this.annualSales,
      this.annualCost,
      this.numberOfEmployees,
      this.entityPromote,
      this.buyers,
      this.difficulties,
      this.otherDifficulties,
      this.marketInformations,
      this.valueChainOrganization,
      this.financeUsed,
      this.formalRecord,
      this.problemsRelatedPolicy,
      this.significantChallenges,
      this.sourceClients});

  SocioEconomic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessRegistrationTypeId = json['business_registration_type_id'];
    valueChainActivities = json['value_chain_activities'] != null
        ? json['value_chain_activities'].cast<int>()
        : null;
    licensedEntity = json['licensed_entity'];
    otherValueChains = json['other_value_chains'];
    competitors =
        json['competitors'] != null ? json['competitors'].cast<String>() : null;
    if (json['annual_sales'] != null) {
      annualSales = <AnnualSales>[];
      json['annual_sales'].forEach((v) {
        annualSales?.add(AnnualSales.fromJson(v));
      });
    }
    if (json['annual_cost'] != null) {
      annualCost = <AnnualCost>[];
      json['annual_cost'].forEach((v) {
        annualCost?.add(AnnualCost.fromJson(v));
      });
    }
    if (json['number_of_employees'] != null) {
      numberOfEmployees = <NumberOfEmployees>[];
      json['number_of_employees'].forEach((v) {
        numberOfEmployees?.add(NumberOfEmployees.fromJson(v));
      });
    }
    entityPromote = json['entity_promote'] != null
        ? json['entity_promote'].cast<String>()
        : null;
    if (json['buyers'] != null) {
      buyers = <Buyers>[];
      json['buyers'].forEach((v) {
        buyers?.add(Buyers.fromJson(v));
      });
    }
    difficulties =
        json['difficulties'] != null ? json['difficulties'].cast<int>() : null;
    otherDifficulties = json['other_difficulties'] != null
        ? json['other_difficulties'].cast<String>()
        : null;
    marketInformations = json['market_informations'] != null
        ? json['market_informations'].cast<int>()
        : null;
    valueChainOrganization = json['value_chain_organization'] != null
        ? ValueChainOrganization?.fromJson(json['value_chain_organization'])
        : null;
    if (json['finance_used'] != null) {
      financeUsed = <FinanceUsed>[];
      json['finance_used'].forEach((v) {
        financeUsed?.add(FinanceUsed.fromJson(v));
      });
    }
    formalRecord = json['formal_record'] != null
        ? FormalRecord?.fromJson(json['formal_record'])
        : null;
    problemsRelatedPolicy = json['problems_related_policy'] != null
        ? json['problems_related_policy'].cast<String>()
        : null;
    if (json['significant_challenges'] != null) {
      significantChallenges = <SignificantChallenges>[];
      json['significant_challenges'].forEach((v) {
        significantChallenges?.add(SignificantChallenges.fromJson(v));
      });
    }
    sourceClients = json['source_clients'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['business_registration_type_id'] = businessRegistrationTypeId;
    data['value_chain_activities'] = valueChainActivities;
    data['licensed_entity'] = licensedEntity;
    data['other_value_chains'] = otherValueChains;
    data['competitors'] = competitors;
    if (annualSales != null) {
      data['annual_sales'] = annualSales?.map((v) => v.toJson()).toList();
    }
    if (annualCost != null) {
      data['annual_cost'] = annualCost?.map((v) => v.toJson()).toList();
    }
    if (numberOfEmployees != null) {
      data['number_of_employees'] =
          numberOfEmployees?.map((v) => v.toJson()).toList();
    }
    data['entity_promote'] = entityPromote;
    if (buyers != null) {
      data['buyers'] = buyers?.map((v) => v.toJson()).toList();
    }
    data['difficulties'] = difficulties;
    data['other_difficulties'] = otherDifficulties;
    data['market_informations'] = marketInformations;
    if (valueChainOrganization != null) {
      data['value_chain_organization'] = valueChainOrganization?.toJson();
    }
    if (financeUsed != null) {
      data['finance_used'] = financeUsed?.map((v) => v.toJson()).toList();
    }
    if (formalRecord != null) {
      data['formal_record'] = formalRecord?.toJson();
    }
    data['problems_related_policy'] = problemsRelatedPolicy;
    if (significantChallenges != null) {
      data['significant_challenges'] =
          significantChallenges?.map((v) => v.toJson()).toList();
    }
    data['source_clients'] = sourceClients;
    return data;
  }
}

class AnnualSales {
  int? year;
  int? sales;

  AnnualSales({this.year, this.sales});

  AnnualSales.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    sales = json['sales'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['year'] = year;
    data['sales'] = sales;
    return data;
  }
}

class AnnualCost {
  int? generalExpenses;
  int? laborCost;
  int? operationCosts;

  AnnualCost({this.generalExpenses, this.laborCost, this.operationCosts});

  AnnualCost.fromJson(Map<String, dynamic> json) {
    generalExpenses = json['general_expenses'];
    laborCost = json['labor_cost'];
    operationCosts = json['operation_costs'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['general_expenses'] = generalExpenses;
    data['labor_cost'] = laborCost;
    data['operation_costs'] = operationCosts;
    return data;
  }
}

class NumberOfEmployees {
  String? title;
  String? type;
  int? male;
  int? female;

  NumberOfEmployees({this.title, this.type, this.male, this.female});

  NumberOfEmployees.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    male = json['male'];
    female = json['female'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['male'] = male;
    data['female'] = female;
    return data;
  }
}

class Buyers {
  int? id;
  String? name;
  int? region;
  String? measure;
  num? volume;

  Buyers({this.id, this.name, this.region, this.measure, this.volume});

  Buyers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    measure = json['measure'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['region'] = region;
    data['measure'] = measure;
    data['volume'] = volume;
    return data;
  }
}

class ValueChainOrganization {
  String? isYes;
  List<String>? valueChains;

  ValueChainOrganization({this.isYes, this.valueChains});

  ValueChainOrganization.fromJson(Map<String, dynamic> json) {
    isYes = json['isYes'];
    valueChains = json['value_chains'] != null
        ? json['value_chains'].cast<String>()
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isYes'] = isYes;
    data['value_chains'] = valueChains;
    return data;
  }
}

class FinanceUsed {
  String? title;
  String? name;
  int? amount;

  FinanceUsed({this.title, this.name, this.amount});

  FinanceUsed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }
}

class FormalRecord {
  String? haveRecord;
  String? aPlatform;
  String? isSoftwared;
  String? aSoftware;
  String? dataSaving;

  FormalRecord(
      {this.haveRecord,
      this.aPlatform,
      this.isSoftwared,
      this.aSoftware,
      this.dataSaving});

  FormalRecord.fromJson(Map<String, dynamic> json) {
    haveRecord = json['haveRecord'];
    aPlatform = json['aPlatform'];
    isSoftwared = json['isSoftwared'];
    aSoftware = json['aSoftware'];
    dataSaving = json['dataSaving'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['haveRecord'] = haveRecord;
    data['aPlatform'] = aPlatform;
    data['isSoftwared'] = isSoftwared;
    data['aSoftware'] = aSoftware;
    data['dataSaving'] = dataSaving;
    return data;
  }
}

class SignificantChallenges {
  String? challenge;
  String? solution;
  List<String>? stakeholderRoles;

  SignificantChallenges({this.challenge, this.solution, this.stakeholderRoles});

  SignificantChallenges.fromJson(Map<String, dynamic> json) {
    challenge = json['challenge'];
    solution = json['solution'];
    stakeholderRoles = json['stakeholder_roles'] != null
        ? json['stakeholder_roles'].cast<String>()
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['challenge'] = challenge;
    data['solution'] = solution;
    data['stakeholder_roles'] = stakeholderRoles;
    return data;
  }
}

class CoreBusinesses {
  int? id;
  String? equipmentValueChain;
  List<int>? typeOfEquipment;
  List<int>? sourceOfInputs;
  List<AnnualTradingVolumes>? annualTradingVolumes;
  InputsStorageFacility? inputsStorageFacility;
  InputsStorageFacility? technicalAdviceToProducers;
  TrainingRegulation? trainingRegulation;
  String? trainingYouNeed;
  String? qualityOfInputsSuppliers;
  String? qualityOfInputsClients;
  Certifications? certifications;
  PlanToApplyCertification? planToApplyCertification;
  String? sustainability;
  String? climateChangeAffects;
  String? mitigateBusiness;
  String? warehouseExpenditure;
  String? warehouseSourceEnergy;
  ProductionAggregation? productionAggregation;
  List<CropProductionAggregation>? cropProductionAggregation;
  List<SourceProductionInputs>? sourceProductionInputs;
  List<LogisticsActivities>? logisticsActivities;
  List<LogisticsCrops>? logisticsCrops;
  String? monitorLogisticActivities;
  TrainingRegulation? standardsCertificationLogistics;

  CoreBusinesses(
      {this.id,
      this.equipmentValueChain,
      this.typeOfEquipment,
      this.sourceOfInputs,
      this.annualTradingVolumes,
      this.inputsStorageFacility,
      this.technicalAdviceToProducers,
      this.trainingRegulation,
      this.trainingYouNeed,
      this.qualityOfInputsSuppliers,
      this.qualityOfInputsClients,
      this.certifications,
      this.planToApplyCertification,
      this.sustainability,
      this.climateChangeAffects,
      this.mitigateBusiness,
      this.warehouseExpenditure,
      this.warehouseSourceEnergy,
      this.productionAggregation,
      this.cropProductionAggregation,
      this.sourceProductionInputs,
      this.logisticsActivities,
      this.logisticsCrops,
      this.monitorLogisticActivities,
      this.standardsCertificationLogistics});

  CoreBusinesses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    equipmentValueChain = json['equipment_value_chain'];
    typeOfEquipment = json['type_of_equipment'] != null
        ? json['type_of_equipment'].cast<int>()
        : null;
    sourceOfInputs = json['source_of_inputs'] != null
        ? json['source_of_inputs'].cast<int>()
        : null;
    if (json['annual_trading_volumes'] != null) {
      annualTradingVolumes = <AnnualTradingVolumes>[];
      json['annual_trading_volumes'].forEach((v) {
        annualTradingVolumes?.add(AnnualTradingVolumes.fromJson(v));
      });
    }
    inputsStorageFacility = json['inputs_storage_facility'] != null
        ? InputsStorageFacility?.fromJson(json['inputs_storage_facility'])
        : null;
    technicalAdviceToProducers = json['technical_advice_to_producers'] != null
        ? InputsStorageFacility?.fromJson(json['technical_advice_to_producers'])
        : null;
    trainingRegulation = json['training_regulation'] != null
        ? TrainingRegulation?.fromJson(json['training_regulation'])
        : null;
    trainingYouNeed = json['training_you_need'];
    qualityOfInputsSuppliers = json['quality_of_inputs_suppliers'];
    qualityOfInputsClients = json['quality_of_inputs_clients'];
    certifications = json['certifications'] != null
        ? Certifications?.fromJson(json['certifications'])
        : null;
    planToApplyCertification = json['plan_to_apply_certification'] != null
        ? PlanToApplyCertification?.fromJson(
            json['plan_to_apply_certification'])
        : null;
    sustainability = json['sustainability'];
    climateChangeAffects = json['climate_change_affects'];
    mitigateBusiness = json['mitigate_business'];
    warehouseExpenditure = json['warehouse_expenditure'];
    warehouseSourceEnergy = json['warehouse_source_energy'];
    productionAggregation = json['production_aggregation'] != null
        ? ProductionAggregation?.fromJson(json['production_aggregation'])
        : null;
    if (json['crop_production_aggregation'] != null) {
      cropProductionAggregation = <CropProductionAggregation>[];
      json['crop_production_aggregation'].forEach((v) {
        cropProductionAggregation?.add(CropProductionAggregation.fromJson(v));
      });
    }
    if (json['source_production_inputs'] != null) {
      sourceProductionInputs = <SourceProductionInputs>[];
      json['source_production_inputs'].forEach((v) {
        sourceProductionInputs?.add(SourceProductionInputs.fromJson(v));
      });
    }
    if (json['logistics_activities'] != null) {
      logisticsActivities = <LogisticsActivities>[];
      json['logistics_activities'].forEach((v) {
        logisticsActivities?.add(LogisticsActivities.fromJson(v));
      });
    }
    if (json['logistics_crops'] != null) {
      logisticsCrops = <LogisticsCrops>[];
      json['logistics_crops'].forEach((v) {
        logisticsCrops?.add(LogisticsCrops.fromJson(v));
      });
    }
    monitorLogisticActivities = json['monitor_logistic_activities'];
    standardsCertificationLogistics =
        json['standards_certification_logistics'] != null
            ? TrainingRegulation?.fromJson(
                json['standards_certification_logistics'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['equipment_value_chain'] = equipmentValueChain;
    data['type_of_equipment'] = typeOfEquipment;
    data['source_of_inputs'] = sourceOfInputs;
    if (annualTradingVolumes != null) {
      data['annual_trading_volumes'] =
          annualTradingVolumes?.map((v) => v.toJson()).toList();
    }
    if (inputsStorageFacility != null) {
      data['inputs_storage_facility'] = inputsStorageFacility?.toJson();
    }
    if (technicalAdviceToProducers != null) {
      data['technical_advice_to_producers'] =
          technicalAdviceToProducers?.toJson();
    }
    if (trainingRegulation != null) {
      data['training_regulation'] = trainingRegulation?.toJson();
    }
    data['training_you_need'] = trainingYouNeed;
    data['quality_of_inputs_suppliers'] = qualityOfInputsSuppliers;
    data['quality_of_inputs_clients'] = qualityOfInputsClients;
    if (certifications != null) {
      data['certifications'] = certifications?.toJson();
    }
    if (planToApplyCertification != null) {
      data['plan_to_apply_certification'] = planToApplyCertification?.toJson();
    }
    data['sustainability'] = sustainability;
    data['climate_change_affects'] = climateChangeAffects;
    data['mitigate_business'] = mitigateBusiness;
    data['warehouse_expenditure'] = warehouseExpenditure;
    data['warehouse_source_energy'] = warehouseSourceEnergy;
    if (productionAggregation != null) {
      data['production_aggregation'] = productionAggregation?.toJson();
    }
    if (cropProductionAggregation != null) {
      data['crop_production_aggregation'] =
          cropProductionAggregation?.map((v) => v.toJson()).toList();
    }
    if (sourceProductionInputs != null) {
      data['source_production_inputs'] =
          sourceProductionInputs?.map((v) => v.toJson()).toList();
    }
    if (logisticsActivities != null) {
      data['logistics_activities'] =
          logisticsActivities?.map((v) => v.toJson()).toList();
    }
    if (logisticsCrops != null) {
      data['logistics_crops'] = logisticsCrops?.map((v) => v.toJson()).toList();
    }
    data['monitor_logistic_activities'] = monitorLogisticActivities;
    if (standardsCertificationLogistics != null) {
      data['standards_certification_logistics'] =
          standardsCertificationLogistics?.toJson();
    }
    return data;
  }
}

class AnnualTradingVolumes {
  int? year;
  String? measure;
  num? volumes;

  AnnualTradingVolumes({this.year, this.measure, this.volumes});

  AnnualTradingVolumes.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    measure = json['measure'];
    volumes = json['volumes'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['year'] = year;
    data['measure'] = measure;
    data['volumes'] = volumes;
    return data;
  }
}

class InputsStorageFacility {
  String? isYes;
  List<String>? size;

  InputsStorageFacility({this.isYes, this.size});

  InputsStorageFacility.fromJson(Map<String, dynamic> json) {
    isYes = json['isYes'];
    size = json['size'] != null ? json['size'].cast<String>() : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isYes'] = isYes;
    data['size'] = size;
    return data;
  }
}

class TrainingRegulation {
  String? isYes;
  String? details;

  TrainingRegulation({this.isYes, this.details});

  TrainingRegulation.fromJson(Map<String, dynamic> json) {
    isYes = json['isYes'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isYes'] = isYes;
    data['details'] = details;
    return data;
  }
}

class Certifications {
  String? iSO9000;
  String? iSO1400;

  Certifications({this.iSO9000, this.iSO1400});

  Certifications.fromJson(Map<String, dynamic> json) {
    iSO9000 = json['ISO-9000'];
    iSO1400 = json['ISO-1400'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ISO-9000'] = iSO9000;
    data['ISO-1400'] = iSO1400;
    return data;
  }
}

class PlanToApplyCertification {
  String? isYes;
  List<String>? mention;

  PlanToApplyCertification({this.isYes, this.mention});

  PlanToApplyCertification.fromJson(Map<String, dynamic> json) {
    isYes = json['isYes'];
    mention = json['mention'] != null ? json['mention'].cast<String>() : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isYes'] = isYes;
    data['mention'] = mention;
    return data;
  }
}

class ProductionAggregation {
  List<Production>? production;
  List<Production>? aggregation;

  ProductionAggregation({this.production, this.aggregation});

  ProductionAggregation.fromJson(Map<String, dynamic> json) {
    if (json['production'] != null) {
      production = <Production>[];
      json['production'].forEach((v) {
        production?.add(Production.fromJson(v));
      });
    }
    if (json['aggregation'] != null) {
      aggregation = <Production>[];
      json['aggregation'].forEach((v) {
        aggregation?.add(Production.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (production != null) {
      data['production'] = production?.map((v) => v.toJson()).toList();
    }
    if (aggregation != null) {
      data['aggregation'] = aggregation?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Production {
  int? year;
  String? cultivationArea;
  String? measure;
  num? volumes;

  Production({this.year, this.cultivationArea, this.measure, this.volumes});

  Production.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    cultivationArea = json['cultivation_area'];
    measure = json['measure'];
    volumes = json['volumes'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['year'] = year;
    data['cultivation_area'] = cultivationArea;
    data['measure'] = measure;
    data['volumes'] = volumes;
    return data;
  }
}

class CropProductionAggregation {
  int? year;
  List<String>? crops;
  int? production;
  num? aggregation;

  CropProductionAggregation(
      {this.year, this.crops, this.production, this.aggregation});

  CropProductionAggregation.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    crops = json['crops'] != null ? json['crops'].cast<String>() : null;
    production = json['production'];
    aggregation = json['aggregation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['year'] = year;
    data['crops'] = crops;
    data['production'] = production;
    data['aggregation'] = aggregation;
    return data;
  }
}

class SourceProductionInputs {
  String? source;
  int? volume;
  int? amount;

  SourceProductionInputs({this.source, this.volume, this.amount});

  SourceProductionInputs.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    volume = json['volume'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['source'] = source;
    data['volume'] = volume;
    data['amount'] = amount;
    return data;
  }
}

class LogisticsActivities {
  String? title;
  String? activity;
  num? capacity;
  num? volumes;

  LogisticsActivities({this.title, this.activity, this.capacity, this.volumes});

  LogisticsActivities.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    activity = json['activity'];
    capacity = json['capacity'];
    volumes = json['volumes'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['activity'] = activity;
    data['capacity'] = capacity;
    data['volumes'] = volumes;
    return data;
  }
}

class LogisticsCrops {
  String? name;
  num? transportation;
  num? warehousing;
  num? materialHandling;
  num? others;

  LogisticsCrops(
      {this.name,
      this.transportation,
      this.warehousing,
      this.materialHandling,
      this.others});

  LogisticsCrops.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    transportation = json['transportation'];
    warehousing = json['warehousing'];
    materialHandling = json['material_handling'];
    others = json['others'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['transportation'] = transportation;
    data['warehousing'] = warehousing;
    data['material_handling'] = materialHandling;
    data['others'] = others;
    return data;
  }
}
