class OperationModel {
  String status;
  List<Datum> data;

  OperationModel({
    required this.status,
    required this.data,
  });

  factory OperationModel.fromJson(Map<String, dynamic> json) => OperationModel(
        status: json["status"] ?? "", // مقدار پیش‌فرض خالی
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : [], // مقدار پیش‌فرض لیست خالی
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int userId;
  int dateTime;
  String? deviceToken;
  String? categoryTitle;
  CompanyTitle? companyTitle;
  int? numCount;
  int? inventory;
  int? serialCount;
  DateTime? printDate;
  int? userPrice;
  int? agentPrice;
  int? parentAgentPrice;
  int? categoryPrice;
  String? name; // نام کاربر یا عملیات
  int? deposit; // مبلغ واریزی

  Datum({
    required this.id,
    required this.userId,
    required this.dateTime,
    this.deviceToken,
    this.categoryTitle,
    this.companyTitle,
    this.numCount,
    this.inventory,
    this.serialCount,
    this.printDate,
    this.userPrice,
    this.agentPrice,
    this.parentAgentPrice,
    this.categoryPrice,
    this.name,
    this.deposit,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        dateTime: json["date_time"] ?? 0,
        deviceToken: json["device_token"] ?? "",
        categoryTitle: json["category_title"] ?? "",
        companyTitle: json["company_title"] != null
            ? companyTitleValues.map[json["company_title"]]
            : null,
        numCount: json["num_count"],
        inventory: json["inventory"] ?? 0,
        serialCount: json["serial_count"] ?? 0,
        printDate: json["print_date"] != null
            ? DateTime.tryParse(json["print_date"])
            : null,
        userPrice: json["user_price"],
        agentPrice: json["agent_price"],
        parentAgentPrice: json["parent_agent_price"],
        categoryPrice: json["category_price"],
        name: json["name"] ?? "",
        deposit: json["deposit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "date_time": dateTime,
        "device_token": deviceToken ?? "",
        "category_title": categoryTitle ?? "",
        "company_title": companyTitle != null
            ? companyTitleValues.reverse[companyTitle]
            : "",
        "num_count": numCount,
        "inventory": inventory ?? 0,
        "serial_count": serialCount ?? 0,
        "print_date": printDate?.toIso8601String() ?? "",
        "user_price": userPrice,
        "agent_price": agentPrice,
        "parent_agent_price": parentAgentPrice,
        "category_price": categoryPrice,
        "name": name ?? "",
        "deposit": deposit,
      };
}

enum CompanyTitle { ASIACELL, NETFLIX, VISA, ZAIN }

final companyTitleValues = EnumValues({
  "Asiacell": CompanyTitle.ASIACELL,
  "Netflix": CompanyTitle.NETFLIX,
  "VISA": CompanyTitle.VISA,
  "Zain": CompanyTitle.ZAIN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
