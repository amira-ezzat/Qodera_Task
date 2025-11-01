import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../data/repositories/retrofit_client.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({required this.apiService}) : super(HomeLoading()) {
    on<FetchHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        final products = await apiService.getProducts();
        final categories = await apiService.getCategories();
        emit(HomeLoaded(products: products, categories: categories));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });
  }
}
