import 'package:flutter/material.dart';
import 'package:flutter_userapp/controller/fda_controller.dart';
import 'package:flutter_userapp/domain/fda/fda.dart';
import 'package:get/get.dart';

class FdaDetail extends StatelessWidget {
  final FdaController u = Get.put(FdaController());

  @override
  Widget build(BuildContext context) {
    String fdaid = Get.arguments;

    print(fdaid);

    return Scaffold(
        appBar: AppBar(
          title: Text("Kiswire FDA 상세 정보"),
        ),
        body: FutureBuilder<Fda>(
          future: u.findById(fdaid), // findAll()을 호출하여 기다린다.
          builder: (context, snapshot) {
            // builder는 두번 호출된다.
            // snapshot => findAll()의 응답 값.
            if (snapshot.hasData) {
              return Column(
                children: [
                  _detailview("ID", "${snapshot.data!.id}"),
                  _detailview("Name", "${snapshot.data!.name}"),
                  _detailview("PLC", "${snapshot.data!.plcR0001}"),
                  _detailview("Date", "${snapshot.data!.plcR0001Timestamp}"),
                  _detailview("Qty", "${snapshot.data!.plcR0001Quality}"),
                  _detailview("PLC35", "${snapshot.data!.r0035}"),
                  _detailview("PLC36", "${snapshot.data!.r0036}"),
                  _detailview("PLC37", "${snapshot.data!.r0037}"),
                  _detailview("PLC38", "${snapshot.data!.r0038}"),
                  _detailview("PLC39", "${snapshot.data!.r0039}"),
                  _detailview("PLC40", "${snapshot.data!.r0040}"),
                  _detailview("PLC41", "${snapshot.data!.r0041}"),
                  _detailview("PLC42", "${snapshot.data!.r0042}"),
                  _detailview("PLC43", "${snapshot.data!.r0043}"),
                  _detailview("PLC44", "${snapshot.data!.r0044}"),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

Widget _detailview(String txtTitle, String txtValue) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Table(
      children: [
        TableRow(children: [
          Text(
            "$txtTitle",
            textScaleFactor: 1.5,
          ),
          Text(
            "$txtValue",
            textScaleFactor: 1.5,
          ),
        ]),
      ],
    ),
  );
}
