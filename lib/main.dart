import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/presentation/screens/home/home_screen.dart';
import 'presentation/screens/main_screen.dart';
import 'logic/home/home_bloc.dart';
import 'logic/home/home_event.dart';
import 'data/repositories/retrofit_client.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => MyApp(apiService: apiService),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(apiService: apiService)
            ..add(FetchHomeData()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home:  HomeScreen(),
      ),
    );
  }
}
