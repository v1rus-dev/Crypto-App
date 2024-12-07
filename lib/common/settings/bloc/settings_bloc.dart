import 'package:crypto_currency/common/settings/bloc/settings_events.dart';
import 'package:crypto_currency/common/settings/bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<UpdateThemeSettingsEvent>(_updateTheme);
    debugPrint("Create setting bloc");
  }

  _updateTheme(SettingsEvents event, Emitter<SettingsState> emitterState) {}
}
