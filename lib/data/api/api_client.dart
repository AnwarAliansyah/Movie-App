import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final String apiBaseUrl;

  ApiClient({required this.apiBaseUrl}) {
    baseUrl = apiBaseUrl;
    timeout = const Duration(seconds: 10);
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
