import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_api_for_practics/bloc/bloc_car/car_bloc.dart';
import 'package:face_api_for_practics/bloc/bloc_car_id/car_id_bloc.dart';
import 'package:face_api_for_practics/utils/constnt/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/model_car/model_car.dart';
import 'car_id_screen.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  @override
  Widget build(BuildContext context) => BlocListener<CarBloc, CarState>(
        listenWhen: (previous, current) =>
            previous.status != current.status && current.errorText.isNotEmpty,
        listener: (context, state) {
          if (state.status == CarStatus.failure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorText)));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('car')),
          body: const CarWidget(),
        ),
      );
}

class CarWidget extends StatelessWidget {
  const CarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CarBloc>().state;
    switch (state.status) {
      case CarStatus.failure:
      case CarStatus.initial:
      case CarStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case CarStatus.success:
        return ListView(
          children: [
            ...List.generate(state.carModel.length, (index) {
              final CarModel carModel = state.carModel[index];
              return ListTile(
                onTap: () {
                  context
                      .read<CarIdBloc>()
                      .add(GetInfoCarByIdEvent(id: carModel.id));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarInfoScreenId(),
                      ));
                },
                leading: CachedNetworkImage(
                  height: height / 10,
                  width: width / 7,
                  imageUrl: carModel.logo,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.image),
                ),
                title: Text(
                  carModel.carModel,
                  style: const TextStyle(fontSize: 22, color: Colors.black),
                ),
                subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  Text(
                    'year: ${carModel.establishedYear.toString()}',
                    style: const TextStyle(fontSize: 20, color: Colors.teal),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'price: ${carModel.averagePrice.toString()}',
                    style: const TextStyle(fontSize: 20, color: Colors.teal),
                  ),
                ]),
                trailing: Text(
                  carModel.id.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              );
            })
          ],
        );
    }
  }
}
