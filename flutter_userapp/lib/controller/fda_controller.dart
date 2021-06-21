import 'package:flutter_userapp/domain/fda/fda.dart';
import 'package:flutter_userapp/domain/fda/fda_repository.dart';
import 'package:get/get.dart';

class FdaController extends GetxController {
  FdaRepository fdaRepository = FdaRepository();

  Future<Fda> findById(String id) {
    return fdaRepository.findById(id);
  }

  Future<List<Fda>> findAll() {
    return fdaRepository.findAll();
  }
}
