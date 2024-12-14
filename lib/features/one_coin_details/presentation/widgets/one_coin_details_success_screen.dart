import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneCoinDetailsSuccessScreen extends StatefulWidget {
  const OneCoinDetailsSuccessScreen({super.key});

  @override
  State<OneCoinDetailsSuccessScreen> createState() =>
      OneCoinDetailsSuccessScreenState();
}

class OneCoinDetailsSuccessScreenState
    extends State<OneCoinDetailsSuccessScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OneCoinDetailsBloc, OneCoinDetailsState>(
          builder: (context, state) {
        return Scaffold(
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            children: const [
              // OneCoinDetailsTopPart(state: ,)
            ],
          ),
        );
      });
}
