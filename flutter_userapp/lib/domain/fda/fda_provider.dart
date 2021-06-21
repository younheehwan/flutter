import 'package:get/get.dart';

String host = "http://10.11.21.29:8080";

class FdaProvider extends GetConnect {
  // Get request
  Future<Response> findById(String id) => get('$host/fda/$id');

  // Get request
  Future<Response> findAll() => get('$host/fda');
}
