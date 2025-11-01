import 'package:flutter_task/data/models/product_model.dart' hide ProductModel;

import '../../data/models/product_model.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductModel> products;
  final List<String> categories;

  HomeLoaded({required this.products, required this.categories});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
