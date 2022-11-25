import 'package:http/http.dart';

abstract class HTTPService<T> {
  Future<T> getData(String url,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? header});
}

class NetworkService implements HTTPService {
  NetworkService({required this.client});

  String token = '';
  final Client client;

  @override
  Future getData(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? header}) async {
    final response = await client.get(
      Uri.parse(url),
    );
    return response;
  }
}
