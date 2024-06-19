import 'package:flutter/material.dart';
import 'package:stepsavvy_admin/widgets/addproductdropdown.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                  hintText: 'Enter Product Price',
                  label: const Text('Price'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: AddProductDropDown(
                    items: ['CAT1', 'CAT2', 'CAT3'],
                    hint: 'Select Category',
                  )),
                  Expanded(
                      child: AddProductDropDown(
                    items: ['BRAND1', 'BRAND2', 'BRAND3'],
                    hint: 'Select Brand',
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Offer Product?'),
          ],
        ),
      )),
    );
  }
}
