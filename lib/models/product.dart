class Product {
  final String isim;
  final String fiyat;
  final String resim;

  Product({
    required this.isim,
    required this.fiyat,
    required this.resim,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      isim: json["isim"],
      fiyat: json["fiyat"],
      resim: json["resim"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "isim": isim,
      "fiyat": fiyat,
      "resim": resim,
    };
  }
}