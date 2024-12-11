import 'package:hive_flutter/hive_flutter.dart';

class LocalDatasource<BoxType> {
  final Box<BoxType> dataBox;

  LocalDatasource({required this.dataBox});
}