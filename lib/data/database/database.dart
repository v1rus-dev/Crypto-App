import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class Database<T> {
  Box<T> get box => GetIt.I.get<Box<T>>();

  bool get isEmpty => box.isEmpty;
}

class DatabaseConstants {
  static String cryptoCoinLocalDTOName = 'all_coins_list_box';
}
