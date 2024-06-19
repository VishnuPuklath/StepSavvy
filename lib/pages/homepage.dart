import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepsavvy_admin/pages/add_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepSavvy Admin'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 13,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('Hello'),
            subtitle: const Text('Price : 100'),
            trailing:
                IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProduct());
          },
          child: const Icon(Icons.add)),
    );
  }
}
