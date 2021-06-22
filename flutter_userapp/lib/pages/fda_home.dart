import 'package:flutter/material.dart';
import 'package:flutter_userapp/controller/fda_controller.dart';
import 'package:flutter_userapp/domain/fda/fda.dart';
import 'package:flutter_userapp/pages/fda_detail.dart';
import 'package:get/get.dart';

class FdaHome extends StatelessWidget {
  final FdaController u = Get.put(FdaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kiswire FDA 정보"),
        ),
        body: FutureBuilder<List<Fda>>(
          future: u.findAll(), // findAll()을 호출하여 기다린다.
          builder: (context, snapshot) {
            // builder는 두번 호출된다.
            // snapshot => findAll()의 응답 값.
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  print(
                      "ID : ${snapshot.data![index].id}, Name : ${snapshot.data![index].name}, PLC : ${snapshot.data![index].plcR0001}");
                  return Card(
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: [
                                Text("ID : ${snapshot.data![index].id}"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Name : ${snapshot.data![index].name}"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("PLC : ${snapshot.data![index].plcR0001}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () => {
                        print("클릭됨 ${snapshot.data![index].fdaid}"),
                        Get.to(FdaDetail(),
                            arguments: snapshot.data![index].fdaid),
                      },
                    ),
                  );

                  // return ListTile(
                  //   title: Text("${snapshot.data![index].id}"),
                  //   subtitle: Text("${snapshot.data![index].name}"),
                  //   onTap: () {
                  //     print("클릭됨 ");
                  //     //Get.to(FdaDetail(), arguments: snapshot.data![index]._id);
                  //   },
                  //   //leading: Icon(Icons.person),
                  // );
                },
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
