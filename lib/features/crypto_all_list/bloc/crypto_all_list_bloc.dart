import 'package:bloc/bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:meta/meta.dart';

part 'crypto_all_list_event.dart';
part 'crypto_all_list_state.dart';

class CryptoAllListBloc extends Bloc<CryptoAllListEvent, CryptoAllListState> {
  final AbstractCryptoCompareRepository cryptoCompareRepository;
  CryptoAllListBloc({required this.cryptoCompareRepository}) : super(CryptoAllListInitial()) {
    on<CryptoAllListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
