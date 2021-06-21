import 'package:flutter_userapp/domain/fda/fda.dart';
import 'package:flutter_userapp/domain/fda/fda_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class FdaRepository {
  FdaProvider fdaProvider = FdaProvider();

  Future<Fda> findById(String id) async {
    Response response = await fdaProvider.findById(id);
    Fda fda = Fda.fromJson(response.body);
    print(fda.name);
    return fda;
  }

  Future<List<Fda>> findAll() async {
    Response response = await fdaProvider.findAll();
    List<dynamic> responseFdas = response.body;
    List<Fda> fdas = responseFdas.map((fda) => Fda.fromJson(fda)).toList();
    return fdas;
  }
}
