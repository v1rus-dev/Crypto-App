import 'package:crypto_currency/features/search_coin/domain/bloc/search_coin_bloc.dart';
import 'package:flutter/material.dart';

class SearchState extends InheritedWidget {
  final SearchCoinState state;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String)? onTap;

  const SearchState(
      {super.key,
      required super.child,
      required this.state,
      required this.textEditingController,
      required this.focusNode,
      required this.onTap});

  static SearchState? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SearchState>();
  }

  static SearchState of(BuildContext context) {
    final SearchState? result = maybeOf(context);
    assert(result != null, 'No SearchInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant SearchState oldWidget) =>
      state != oldWidget.state;
}
