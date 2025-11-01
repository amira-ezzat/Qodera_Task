import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/product_model.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("products")
  Future<List<ProductModel>> getProducts();

  @GET("products/categories")
  Future<List<String>> getCategories();
}
