import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_api_for_practics/bloc/bloc_car_id/car_id_bloc.dart';
import 'package:face_api_for_practics/utils/constnt/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarInfoScreenId extends StatelessWidget {
  const CarInfoScreenId({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<CarIdBloc, CarModelByIdState>(
        listenWhen: (previous, current) =>
            previous.status != current.status && current.errorText.isNotEmpty,
        listener: (context, state) {
          if (state.status == IdStatus.failure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorText)));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('car')),
          body: const CarIdWidget(),
        ),
      );
}

class CarIdWidget extends StatelessWidget {
  const CarIdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CarIdBloc>().state;
    switch (state.status) {
      case IdStatus.initial:
      case IdStatus.failure:
      case IdStatus.success:
        return ListView(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(height: height / 5),
              items: state.carModelById.carPics
                  .map(
                    (i) => Builder(
                      builder: (context) => Container(
                        width: width,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: i.isEmpty
                            ? Image.network(
                                'https://w.forfun.com/fetch/dc/dcff25729bdd958c78eb8abefb526d75.jpeg')
                            : SizedBox(
                          height: height/3,
                              child: Image.network(
                                  i,
                                  height: height / 3,
                                ),
                            ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: height / 2,
              width: width / 1.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.teal)),
              child: Image.network(state.carModelById.logo),
            ),
          ],
        );
      case IdStatus.loading:
        return const Center(child: Text('data not found'));
    }
  }
}
