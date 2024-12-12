import 'package:crypto_currency/common/presentation/light_day_theme.dart';

abstract class SettingsEvents {}

class UpdateThemeSettingsEvent extends SettingsEvents {
  final LightDayTheme lightDayTheme;

  UpdateThemeSettingsEvent({required this.lightDayTheme});
}
