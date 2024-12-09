import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class Api {
  Dio getClient() => GetIt.I.get<Dio>();

  Api() {
    getClient().interceptors.add(TalkerDioLogger(
        talker: GetIt.I.get(),
        settings: const TalkerDioLoggerSettings(printResponseMessage: false)));
  }
}
