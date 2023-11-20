import 'package:flutter/material.dart';
import 'package:u_l_flutter_getx_sqflite/controller/controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final control  = Get.put(SQLController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('todo app'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              control.insertData();
            }, icon:Icon(Icons.add))
          ],
        ),
        body: GetBuilder<SQLController>(
          builder: (controller)=>ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(controller.list[index].title)),
                            Expanded(child: Text(controller.list[index].description)),
                            Expanded(child: Text(controller.list[index].time.toString())),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }
}
