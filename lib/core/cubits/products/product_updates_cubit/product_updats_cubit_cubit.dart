import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_updats_cubit_state.dart';

class ProductUpdatsCubitCubit extends Cubit<ProductUpdatsCubitState> {
  ProductUpdatsCubitCubit(this.productsRepo)
    : super(ProductUpdatsCubitInitial());
  final ProductsRepo productsRepo;
  Future<ProductEntity> updateProduct(ProductEntity productEntity) async {
    emit(ProductUpdatsCubitLoading());
    var result = await productsRepo.updateProduct(productEntity);
    return result.fold(
      (l) {
        emit(ProductUpdatsCubitFailure(l.errMessage));
        throw Exception(l.errMessage);
      },
      (r) {
        emit(ProductUpdatsCubitSuccess());
        return r;
      },
    );
  }
}
