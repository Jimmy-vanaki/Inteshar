class TopupReportModel {
  String status;
  List<Transaction> transactions;

  TopupReportModel({
    required this.status,
    required this.transactions,
  });

  factory TopupReportModel.fromJson(Map<String, dynamic> json) =>
      TopupReportModel(
        status: json["status"] ?? "unknown",
        transactions: json["transactions"] != null
            ? List<Transaction>.from(
                json["transactions"].map((x) => Transaction.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class Transaction {
  int id;
  int userId;
  String transactionType;
  String? transactionId;
  int asiacellProductId;
  String asiacellProductTitle;
  int price;
  String mobile;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String? createdAtFormatted;

  Transaction({
    required this.id,
    required this.userId,
    required this.transactionType,
    this.transactionId,
    required this.asiacellProductId,
    required this.asiacellProductTitle,
    required this.price,
    required this.mobile,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.createdAtFormatted,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        transactionType: json["transaction_type"] ?? "unknown",
        transactionId: json["transaction_id"], // Nullable
        asiacellProductId: json["asiacell_product_id"] ?? 0,
        asiacellProductTitle: json["asiacell_product_title"] ?? "No Title",
        price: json["price"] ?? 0,
        mobile: json["mobile"] ?? "Unknown",
        status: json["status"] ?? "pending",
        createdAtFormatted: json["created_at_formatted"], // Nullable
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"]) ?? DateTime(2000, 1, 1)
            : DateTime(2000, 1, 1),
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"]) ?? DateTime(2000, 1, 1)
            : DateTime(2000, 1, 1),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "transaction_type": transactionType,
        "transaction_id": transactionId ?? "", // Handle null
        "asiacell_product_id": asiacellProductId,
        "asiacell_product_title": asiacellProductTitle,
        "price": price,
        "mobile": mobile,
        "status": status,
        "created_at_formatted": createdAtFormatted ?? "",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
