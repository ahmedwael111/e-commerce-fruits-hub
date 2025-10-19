import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(Productsloading());
    var result = await productsRepo.getProducts();
    result.fold(
      (l) => emit(Productsfailure(l.errMessage)),
      (r) => emit(ProductsSuccess(r)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(Productsloading());
    var result = await productsRepo.getPestSellingProducts();
    result.fold(
      (l) => emit(Productsfailure(l.errMessage)),
      (r) => emit(ProductsSuccess(r)),
    );
  }
}
