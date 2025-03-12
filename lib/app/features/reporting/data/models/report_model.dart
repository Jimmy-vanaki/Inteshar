class ReportModel {
  String status;
  List<SerialModel> serials;

  ReportModel({
    required this.status,
    required this.serials,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      status: json['status'],
      serials: List<SerialModel>.from(
          json['serials'].map((serial) => SerialModel.fromJson(serial))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'serials': serials.map((serial) => serial.toJson()).toList(),
    };
  }
}

class SerialModel {
  int id;
  int rePrint;
  String? serial;
  String? code;
  String? expiredDate; // New field
  String? code1;
  String? code2;
  String? code3;
  String? code4;
  int dateTime;
  String sellType;
  String title;
  int cardId;
  String photo;
  String companyTitle;
  String photoUrl;
  String printDate;
  int? cardPrice;
  int? userPrice; // New field
  int? agentPrice; // New field
  int? parentAgentPrice; // New field
  int? categoryPrice; // New field

  SerialModel({
    required this.id,
    required this.rePrint,
    this.serial,
    this.code,
    this.expiredDate, // Added in constructor
    this.code1,
    this.code2,
    this.code3,
    this.code4,
    this.cardPrice,
    required this.dateTime,
    required this.sellType,
    required this.title,
    required this.cardId,
    required this.photo,
    required this.companyTitle,
    required this.photoUrl,
    required this.printDate,
    this.userPrice, // Added in constructor
    this.agentPrice, // Added in constructor
    this.parentAgentPrice, // Added in constructor
    this.categoryPrice, // Added in constructor
  });

  factory SerialModel.fromJson(Map<String, dynamic> json) {
    return SerialModel(
      id: json['id'],
      rePrint: json['re_print'],
      serial: json['serial'],
      code: json['code'],
      expiredDate: json['expired_date'], // Mapping new field
      code1: json['code1'],
      code2: json['code2'],
      code3: json['code3'],
      code4: json['code4'],
      dateTime: json['date_time'],
      sellType: json['sell_type'],
      title: json['title'],
      cardId: json['card_id'],
      photo: json['photo'],
      companyTitle: json['company_title'],
      photoUrl: json['photo_url'],
      printDate: json['print_date'],
      cardPrice: json['card_price'],
      userPrice: json['user_price'], // Mapping new field
      agentPrice: json['agent_price'], // Mapping new field
      parentAgentPrice: json['parent_agent_price'], // Mapping new field
      categoryPrice: json['category_price'], // Mapping new field
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      're_print': rePrint,
      'serial': serial,
      'code': code,
      'expired_date': expiredDate, // Adding new field
      'code1': code1,
      'code2': code2,
      'code3': code3,
      'code4': code4,
      'date_time': dateTime,
      'sell_type': sellType,
      'title': title,
      'card_id': cardId,
      'photo': photo,
      'company_title': companyTitle,
      'photo_url': photoUrl,
      'print_date': printDate,
      'card_price': cardPrice,
      'user_price': userPrice, // Adding new field
      'agent_price': agentPrice, // Adding new field
      'parent_agent_price': parentAgentPrice, // Adding new field
      'category_price': categoryPrice, // Adding new field
    };
  }
}
