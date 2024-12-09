import 'package:crypto_currency/features/crypto_all_list/domain/bloc/crypto_all_list_bloc.dart';
import 'package:crypto_currency/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllListToolbar extends StatefulWidget {
  const AllListToolbar({super.key});

  @override
  State<AllListToolbar> createState() => _AllListToolbarState();
}

class _AllListToolbarState extends State<AllListToolbar> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CryptoAllListBloc, CryptoAllListState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchTextField(
              hintText: 'Search Token',
              onChanged: (value) {
                BlocProvider.of<CryptoAllListBloc>(context)
                    .add(CryptoAllListUpdateSearchEvent(search: value));
              },
            ),
          );
        },
      );
}
