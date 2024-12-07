import 'package:hive_flutter/hive_flutter.dart';

class LocalDatasource<BoxType> {
  final Box<BoxType> box;

  LocalDatasource({required this.box});
}
