import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'crypto_all_list_event.dart';
part 'crypto_all_list_state.dart';

class CryptoAllListBloc extends Bloc<CryptoAllListEvent, CryptoAllListState> {
  CryptoAllListBloc() : super(CryptoAllListInitial()) {
    on<CryptoAllListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
