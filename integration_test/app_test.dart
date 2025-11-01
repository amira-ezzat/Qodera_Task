import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_task/main.dart';
import 'package:flutter_task/data/models/product_model.dart';
import 'package:flutter_task/data/repositories/retrofit_client.dart';

///  Mock ApiService
class MockApiService implements ApiService {
  @override
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      ProductModel(
        id: 1,
        title: 'Test Product 1',
        price: 100.0,
        description: 'Description 1',
        category: 'electronics',
        image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        rating: Rating(rate: 4.5, count: 120),
      ),
      ProductModel(
        id: 2,
        title: 'Test Product 2',
        price: 250.0,
        description: 'Description 2',
        category: 'jewelery',
        image: 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
        rating: Rating(rate: 4.8, count: 250),
      ),
    ];
  }

  @override
  Future<List<String>> getCategories() async {
    return ['electronics', 'jewelery'];
  }

  Future<ProductModel> getProduct(int id) async {
    return ProductModel(
      id: id,
      title: 'Mock Product',
      price: 99.9,
      description: 'Mock desc',
      category: 'mock',
      image: '',
      rating: Rating(rate: 5.0, count: 1),
    );
  }
}

Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
      Duration timeout = const Duration(seconds: 30),
      Duration step = const Duration(milliseconds: 500),
    }) async {
  final endTime = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(endTime)) {
    await tester.pumpAndSettle(step);
    if (finder.evaluate().isNotEmpty) return;
  }
  throw Exception('Widget not found within $timeout');
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App full flow using MockApiService', (tester) async {
    final mockApi = MockApiService();
    await tester.pumpWidget(MyApp(apiService: mockApi));
    await tester.pumpAndSettle();
    await pumpUntilFound(tester, find.text('Products'));

    // listView
    expect(find.byKey(const Key('product_list')), findsOneWidget);

    // pressed on product
    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();

    expect(find.byType(Image), findsWidgets);
  });
}
