import 'package:crypto_currency/features/converter/data/datasource/converter_network_datasource.dart';
import 'package:crypto_currency/features/converter/data/mappers/coin_price_mapper.dart';
import 'package:crypto_currency/features/converter/domain/entities/coin_price.dart';
import 'package:crypto_currency/features/converter/domain/repositories/converter_repository.dart';
import 'package:flutter/material.dart';

class ConverterRepositoryImpl extends ConverterRepository {
  final ConverterNetworkDatasource networkDatasource;

  ConverterRepositoryImpl({required this.networkDatasource});

  @override
  Future<List<CoinPrice>> fetchPrices(List<String> coinNames) async {
    final response = await networkDatasource.fetchPrices(coinNames);
    debugPrint('Response: $response');
    return response.map(CoinPriceMapper.mapFromNetwork).toList();
  }
}
