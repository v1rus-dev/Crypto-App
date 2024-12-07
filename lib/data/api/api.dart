import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class Api {
  Dio getClient() => GetIt.I.get<Dio>();
}
