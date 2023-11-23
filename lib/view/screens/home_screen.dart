import 'package:flutter/material.dart';
import 'package:u_l_flutter_getx_sqflite/controller/controller.dart';
import 'package:get/get.dart';
import 'package:u_l_flutter_getx_sqflite/view/screens/edit_screen.dart';
import 'package:u_l_flutter_getx_sqflite/view/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final control = Get.put(SQLController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todo app'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         control.insertData();
        //       },
        //       icon: Icon(Icons.add))
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => EditScreen(),transition: Transition.downToUp);
        },
      ),
      body: GetBuilder<SQLController>(
          builder: (controller) => ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) =>
                    TodoItem(controller: controller, index: index),
              )),
    );
  }
}
