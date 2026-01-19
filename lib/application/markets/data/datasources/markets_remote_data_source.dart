import 'package:test_task_project/application/markets/data/models/market_model.dart';
import 'package:dio/dio.dart';
import 'package:test_task_project/core/error/app_exceptions.dart';
import 'package:test_task_project/core/helpers/app_helper.dart';

abstract class MarketsRemoteDataSource {
  Future<MarketModel> getMarketsAsync({
    required int limit,
    required int offset,
  });
}

class MarketsRemoteDataSourceImpl implements MarketsRemoteDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rest.coincap.io/v3/',
      headers: {'Authorization': 'Bearer ${AppHelper.API_KEY}'},
    ),
  );

  @override
  Future<MarketModel> getMarketsAsync({
    required int limit,
    required int offset,
  }) async {
    final response = await dio.get('markets?limit=$limit&offset=$offset');
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return MarketModel.fromJson(data);
    } else {
      throw ServerException(message: 'Could not fetch data!');
    }
  }
}
