import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioService {
  Dio get client => GetIt.I.get<Dio>();

  DioService() {
    client.interceptors.add(
      TalkerDioLogger(
        talker: GetIt.I.get(),
        settings: const TalkerDioLoggerSettings(
          printResponseMessage: false,
          printResponseData: false,
          printResponseHeaders: false,
        ),
      ),
    );
  }

  
}
