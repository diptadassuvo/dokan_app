import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    int? id,
    String? name,
    List<ProductImages>? images,
    String? description,
    int? total_sales,
    String? price,
    String? regular_price,
    String? sale_price,
    DateTime? createdDate,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ProductImages with _$ProductImages {
  const factory ProductImages({
    int? id,
    String? src,
    String? name,
  }) = _ProductImages;

  factory ProductImages.fromJson(Map<String, dynamic> json) =>
      _$ProductImagesFromJson(json);
}
