import 'package:flutter/material.dart';
import 'package:u_l_flutter_getx_sqflite/controller/controller.dart';

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
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
          
            Expanded(
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(child: Text(controller.list[index].title)),
                  Expanded(
                      child: Text(
                          controller.list[index].time.toString())),
                ],
              ),
            ),
            // const SizedBox(height: 20.0,),
            // Text(controller.list[index].description),
            Expanded(child:  Text(controller.list[index].description),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller.deleteData();
                    // controller.deleteData(id: controller.list[index].id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.updateData();
                    // controller.updateTaskData = true;
                    // Get.to(()=> EditScreen(id: controller.list[index].id,));
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
