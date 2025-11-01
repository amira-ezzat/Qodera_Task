import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task/core/components/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  testWidgets('CustomAppBar search works correctly', (tester) async {
    final controller = TextEditingController();
    bool isSearching = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(
            title: 'Shop',
            showSearch: true,
            isSearching: isSearching,
            searchController: controller,
            onSearchToggle: () {
              isSearching = !isSearching;
            },
          ),
        ),
      ),
    );

    // Verify title
    expect(find.text('Shop'), findsOneWidget);

    // Tap search icon
    await tester.tap(find.byType(SvgPicture));
    await tester.pump();

    // Toggle state
    expect(isSearching, isTrue);
  });
}
