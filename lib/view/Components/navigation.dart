import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/bottomnavigation_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomnavigationController controller =
        Get.put(BottomnavigationController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Container(
        height: 45,
        decoration: BoxDecoration(

            // color: Theme.of(context).colorScheme.surface,
            color: const Color.fromARGB(255, 60, 185, 65),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                controller.index.value = 0;
              },
              child: Obx(() => Icon(
                    Icons.home,
                    color: Colors.white,
                    size: controller.index.value == 0 ? 25 : 18,
                  )),
            ),
            InkWell(
              onTap: () {
                controller.index.value = 1;
              },
              child: Obx(() => Icon(
                    Icons.book,
                    color: Colors.white,
                    size: controller.index.value == 1 ? 25 : 18,
                  )),
            ),
            InkWell(
              onTap: () {
                controller.index.value = 2;
              },
              child: Obx(() => Icon(
                    Icons.person,
                    color: Colors.white,
                    size: controller.index.value == 2 ? 25 : 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
