import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_l_flutter_getx_sqflite/controller/controller.dart';
import '../screens/edit_screen.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.controller, required this.index});
  final SQLController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(
              children: [
                const Spacer(),
                Expanded(child: Text(controller.list[index].title)),
                Expanded(
                    child: Text(
                        controller.list[index].time.toString())),
              ],
            ),
            const SizedBox(height: 20.0,),
            // Text(controller.list[index].description),
            Text(controller.list[index].description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller.deleteData(id:controller.list[index].id);
                    // controller.deleteData(id: controller.list[index].id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.updateTaskData =true;

                    // controller.updateTaskData = true;
                    Get.to(()=> EditScreen(id: controller.list[index].id,));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
