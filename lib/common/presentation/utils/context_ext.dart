import 'package:crypto_currency/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {

  S get lang => S.current;

  ThemeData get theme => Theme.of(this);
}