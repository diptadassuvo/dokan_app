import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<List<ProductEntity>> loadProducts();
}
