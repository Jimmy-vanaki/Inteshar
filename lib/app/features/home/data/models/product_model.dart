class ProductModel {
  final int id;
  final String title;
  final String photoUrl;
  final String companyTitle;
  final double? price;

  ProductModel({
    required this.id,
    required this.title,
    required this.photoUrl,
    required this.companyTitle,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      photoUrl: json['photo_url'] as String,
      companyTitle: json['company_title'] as String,
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'photo_url': photoUrl,
      'company_title': companyTitle,
      'price': price,
    };
  }
}
