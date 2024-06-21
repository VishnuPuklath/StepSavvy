import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepsavvy_admin/controller/home_controller.dart';
import 'package:stepsavvy_admin/pages/add_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('StepSavvy Admin'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: ctrl.products.length,
          itemBuilder: (context, index) {
            final product = ctrl.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.price.toString()),
              trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ctrl.deleteProduct(product.id);
                    ctrl.update();
                  }),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddProduct());
            },
            child: const Icon(Icons.add)),
      );
    });
  }
}
