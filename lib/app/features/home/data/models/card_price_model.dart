class CardPriceModel {
  String? status;
  int? cardPrice;
  String? cardType;

  CardPriceModel({
    this.status,
    this.cardPrice,
    this.cardType,
  });

  factory CardPriceModel.fromJson(Map<String, dynamic> json) => CardPriceModel(
        status: json["status"] as String?,
        cardPrice: json["card_price"] as int?,
        cardType: json["card_type"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "card_price": cardPrice,
        "card_type": cardType,
      };
}
