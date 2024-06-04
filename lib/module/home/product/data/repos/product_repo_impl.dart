import 'package:dokan_app/module/home/product/data/datasouces/product_local_datasource.dart';
import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:dokan_app/module/home/product/domain/repos/products_repo.dart';

class ProductRepoImpl implements ProductsRepo {
  final ProductLocalDataSource _productLocalDataSource;

  ProductRepoImpl(this._productLocalDataSource);

  @override
  Future<List<ProductEntity>> loadProducts() async {
    final products = await _productLocalDataSource.getProducts();

    return products
        .map((product) => ProductEntity(
              id: product.id,
              name: product.name,
              images: product.images
                  ?.map((image) => ProductImagesEntity(
                      id: image.id, src: image.src, name: image.name))
                  .toList(),
              description: product.description,
              totalSales: product.total_sales,
              price: product.price,
              regularPrice: product.regular_price,
              salePrice: product.sale_price,
              createdDate: product.createdDate,
            ))
        .toList();
  }
}
