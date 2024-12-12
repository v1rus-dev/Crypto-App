import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/all_list_coins/domain/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'all_list_coins_event.dart';
part 'all_list_coins_state.dart';

class AllListCoinsBloc extends Bloc<AllListCoinsEvent, AllListCoinsState> {
  AllListCoinsBloc({required this.repository}) : super(AllListCoinsInitial()) {
    on<AllListCoinsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final AllListRepository repository;
}
