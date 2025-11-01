import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/data/repositories/retrofit_client.dart';
import 'package:flutter_task/data/models/product_model.dart';

void main() {
  late ApiService apiService;

  setUp(() {
    final dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));
    apiService = ApiService(dio);
  });

  test('fetchProducts', () async {
    final products = await apiService.getProducts();
    expect(products, isA<List<ProductModel>>());
    expect(products.isNotEmpty, true);
  });

  test('fetchCategories', () async {
    final categories = await apiService.getCategories();
    expect(categories, isA<List<String>>());
    expect(categories.isNotEmpty, true);
  });
}
