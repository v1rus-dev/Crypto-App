import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(ConverterInitial()) {
    on<ConverterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
