import 'package:bloc/bloc.dart';
import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:dokan_app/module/home/product/domain/usecases/load_products.dart';
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
}
