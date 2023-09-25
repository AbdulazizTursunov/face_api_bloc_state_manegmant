import 'package:face_api_for_practics/bloc/bloc_car_id/car_id_bloc.dart';
import 'package:face_api_for_practics/data/api_service/api_service/api_service.dart';
import 'package:face_api_for_practics/repository/reposiyory.dart';
import 'package:face_api_for_practics/ui/car_scree.dart';
import 'package:face_api_for_practics/utils/constnt/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_car/car_bloc.dart';

void main() {
  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.apiService,
  });

  final ApiService apiService;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) => ApiRepository(apiService: apiService))
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CarIdBloc(
                apiRepository: context.read<ApiRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  CarBloc(apiRepository: context.read<ApiRepository>())
                    ..add(
                      GetAllCarEvent(),
                    ),
            ),
            BlocProvider(
                create: (context) =>
                    CarIdBloc(apiRepository: context.read<ApiRepository>())),
          ],
          child: const MyApp(),
        ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home:  const CarInfoScreen(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
