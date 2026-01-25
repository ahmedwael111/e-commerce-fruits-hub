import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit(this.productsRepo) : super(SearchProductInitial());
  final ProductsRepo productsRepo;
  int prodcutsLength = 0;
  List<ProductEntity> allProducts = [];
  String? currentSort;
  Future<void> searchProducts(String searchValue) async {
    emit(SearchProductLoading());
    final result = await productsRepo.getDataWithSearch(
      searchValue: searchValue,
    );
    result.fold((l) => emit(SearchProductFailure(l.errMessage)), (r) {
      allProducts = r;
      prodcutsLength = r.length;
      emit(SearchProductSuccess(r));
    });
  }

  void changeSort(String sortType) {
    currentSort = sortType;

    final List<ProductEntity> sorted = List<ProductEntity>.from(allProducts);

    if (sortType == 'high_to_low') {
      sorted.sort((a, b) => b.price.compareTo(a.price));
    } else if (sortType == 'low_to_high') {
      sorted.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortType == 'a_to_z') {
      sorted.sort((a, b) => a.name.compareTo(b.name));
    }

    emit(SearchProductSuccess(sorted));
  }
}
