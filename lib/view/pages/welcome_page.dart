import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/bottomnavigation_controller.dart';
import 'package:news/view/Components/navigation.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BottomnavigationController controller =
        Get.put(BottomnavigationController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
