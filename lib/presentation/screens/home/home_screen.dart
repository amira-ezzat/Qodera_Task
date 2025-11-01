import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/presentation/widgets/product_list.dart';
import '../../../logic/home/home_bloc.dart';
import '../../../logic/home/home_state.dart';
import 'widgets/banner_slider.dart';
import 'widgets/categories_list.dart';
import 'widgets/product_grid.dart';
import '../../../core/components/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory = 'All';
  bool isSearching = false;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products',
        showSearch: true,
        isSearching: isSearching,
        searchController: searchController,
        onSearchToggle: () {
          setState(() {
            isSearching = !isSearching;
            if (!isSearching) {
              searchController.clear();
            }
          });
        },
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) return const Center(child: CircularProgressIndicator());
          if (state is HomeError) return Center(child: Text(state.message));
          if (state is HomeLoaded) {
            final filtered = state.products.where((p) {
              final matchesCat = selectedCategory == 'All' || p.category == selectedCategory;
              final matchesSearch = p.title.toLowerCase().startsWith(searchController.text.toLowerCase());
              return matchesCat && matchesSearch;
            }).toList();

            final categories = ['All', ...state.categories];

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const BannerSlider(),
                  const SizedBox(height: 15),
                  CategoriesList(
                    categories: categories,
                    selectedCategory: selectedCategory ?? 'All',
                    onCategorySelected: (cat) {
                      setState(() => selectedCategory = cat);
                    },
                  ),
                  const SizedBox(height: 15),
                  ProductList(products: filtered),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
