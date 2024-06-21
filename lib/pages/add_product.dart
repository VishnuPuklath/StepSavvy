import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:stepsavvy_admin/controller/home_controller.dart';
import 'package:stepsavvy_admin/widgets/addproductdropdown.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  bool? offer;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product '),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: ctrl.nameController,
                decoration: InputDecoration(
                    hintText: 'Enter Your Product Name',
                    label: const Text('Product name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: ctrl.descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter Your Product Description',
                  label: const Text('Description'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: ctrl.imageUrl,
                decoration: InputDecoration(
                    hintText: 'Enter Your ImageUrl',
                    label: const Text('Image Url'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: ctrl.priceController,
                decoration: InputDecoration(
                    hintText: 'Enter Product Price',
                    label: const Text('Price'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        child: AddProductDropDown(
                      onSelected: (selectedValue) {
                        ctrl.selectedCategory = selectedValue!;
                        ctrl.update();
                      },
                      items: ['Boots', 'Shoe', 'Beach shoes', 'High heels'],
                      hint: ctrl.selectedCategory,
                    )),
                    Expanded(
                      child: AddProductDropDown(
                        onSelected: (selecedValue) {
                          ctrl.selectedBrand = selecedValue!;
                          ctrl.update();
                        },
                        items: ['NIKE', 'PUMA', 'ABBIBAS', 'Sketchers'],
                        hint: ctrl.selectedBrand,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Offer Product?'),
              AddProductDropDown(
                onSelected: (selectedValue) {
                  offer = bool.parse(selectedValue!);
                  ctrl.update();
                },
                items: ['true', 'false'],
                hint: offer.toString(),
              ),
              const SizedBox(
                height: 10,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        ctrl.addProduct(
                            offer: offer!,
                            name: ctrl.nameController.text,
                            category: ctrl.selectedCategory,
                            price: double.parse(ctrl.priceController.text),
                            imageUrl: ctrl.imageUrl.text,
                            brand: ctrl.selectedBrand);
                        ctrl.setDefault();
                      },
                      child: Text('Add Product'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          foregroundColor: Colors.white),
                    )
            ],
          ),
        )),
      );
    });
  }
}
