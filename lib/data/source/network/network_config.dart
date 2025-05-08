import 'package:dio/dio.dart' as dio;
import 'package:jikan_anime/data/source/network/constant.dart';

late dio.Dio network;

Future<void> initNetwork() async {
  final String baseUrl = Stringer.API_URL;

  dio.BaseOptions options = dio.BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: Duration(milliseconds: 0),
    receiveTimeout: Duration(milliseconds: 0),
  );

  network = dio.Dio(options);

}

class NetworkRequestConfig {
  Future<dio.Response> doGet(String endpoint, {Map<String, dynamic> query = const {}}) async {
    var response = await network.get(endpoint, queryParameters: query);
    return response;
  }
}