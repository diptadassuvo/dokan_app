class ProductEntity {
  final int? id;
  final String? name;
  final List<ProductImagesEntity>? images;
  final String? description;
  final int? totalSales;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final DateTime? createdDate;

  ProductEntity({
    required this.id,
    required this.name,
    required this.images,
    required this.description,
    required this.totalSales,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.createdDate,
  });
}

class ProductImagesEntity {
  final int? id;
  final String? src;
  final String? name;

  ProductImagesEntity({
    required this.id,
    required this.src,
    required this.name,
  });
}
