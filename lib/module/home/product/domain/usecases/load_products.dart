import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:dokan_app/module/home/product/domain/repos/products_repo.dart';

class LoadProductsUsecase {
  final ProductsRepo _productsRepo;

  LoadProductsUsecase(this._productsRepo);

  Future<List<ProductEntity>> call() async {
    return _productsRepo.loadProducts();
  }
}
