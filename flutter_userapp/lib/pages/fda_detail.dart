import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FdaDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var id = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Kiswire FDA 정보 상세보기"),
      ),
      body: Center(
        child: Text("Detail Page $id"),
      ),
    );
  }
}
