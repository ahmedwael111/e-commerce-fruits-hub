import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int allproductsLength = 0;
  int bestProductsLength = 0;
  List<ProductEntity> allProducts = [];
  List<ProductEntity> bestSellingProducts = [];

  String? currentSort;

  // StreamSubscription?
  // streamSubscription1; // to cancel the stream when not needed to avoid memory leak its name 'reference'
  // StreamSubscription?
  // streamSubscription2; // to cancel the stream when not needed to avoid memory leak its name 'reference'
  Future<void> getProducts() async {
    emit(Productsloading());
    final result = await productsRepo.getProducts();
    result.fold((l) => emit(Productsfailure(l.errMessage)), (r) {
      allProducts = r;
      allproductsLength = r.length;
      emit(ProductsSuccess(r));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(Productsloading());
    final result = await productsRepo.getPestSellingProducts();
    result.fold((l) => emit(Productsfailure(l.errMessage)), (r) {
      bestSellingProducts = r;
      bestProductsLength = r.length;
      emit(ProductsSuccess(r));
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

    emit(ProductsSuccess(sorted));
  }

  void changeBestSellingSort(String sortType) {
    final List<ProductEntity> bestSellingSorted = List<ProductEntity>.from(
      allProducts,
    );

    if (sortType == 'high_to_low') {
      bestSellingSorted.sort((a, b) => b.price.compareTo(a.price));
    } else if (sortType == 'low_to_high') {
      bestSellingSorted.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortType == 'a_to_z') {
      bestSellingSorted.sort((a, b) => a.name.compareTo(b.name));
    }
    emit(ProductsSuccess(bestSellingSorted));
  }

  // @override
  // Future<void> close() {
  //   streamSubscription1
  //       ?.cancel(); // to cancel the stream when not needed to avoid memory leak
  //   streamSubscription2
  //       ?.cancel(); // to cancel the stream when not needed to avoid memory leak
  //   return super.close();
  // }
}
