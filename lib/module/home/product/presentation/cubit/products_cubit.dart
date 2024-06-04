import 'package:bloc/bloc.dart';
import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:dokan_app/module/home/product/domain/usecases/load_products.dart';
import 'package:dokan_app/module/home/product/presentation/widgets/product_filter.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._loadProductsUsecase) : super(ProductsInitial()) {
    loadProducts();
  }

  final LoadProductsUsecase _loadProductsUsecase;

  Future<void> loadProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _loadProductsUsecase.call();
      emit(ProductsLoaded(products: products));
    } on Exception catch (e) {
      emit(ProductsError(message: 'Failed to load products'));
    }
  }

  Future<void> filterProducts(List<ProductFilterOption> options) async {
    final backupProducts = state as ProductsLoaded;
    final products = backupProducts.products;
    emit(ProductsLoading());
    // filters
    try {
      options.forEach((option) {
        // by date
        if (option.type == ProductFilterEnums.newest) {
          products.sort((a, b) => b.createdDate!.compareTo(a.createdDate!));
        }
        if (option.type == ProductFilterEnums.oldest) {
          products.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
        }
        // by price
        if (option.type == ProductFilterEnums.priceLow) {
          products.sort((a, b) =>
              int.parse(a.price ?? '0').compareTo(int.parse(b.price ?? '0')));
        }
        if (option.type == ProductFilterEnums.priceHigh) {
          products.sort((a, b) =>
              int.parse(b.price ?? '0').compareTo(int.parse(a.price ?? '0')));
        }
        // by sales
        if (option.type == ProductFilterEnums.bestSales) {
          products.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
        }
      });
      emit(ProductsLoaded(products: products));
    } on Exception catch (e) {
      emit(backupProducts);
    }
  }
}
