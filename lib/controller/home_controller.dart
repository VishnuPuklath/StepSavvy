import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepsavvy_admin/model/product.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController imageUrl = TextEditingController();

  String selectedCategory = 'General';

  String selectedBrand = 'Unbranded';
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchProducts();
  }

  List<Product> products = [];
  void addProduct(
      {required String name,
      required String category,
      required double price,
      required String imageUrl,
      required bool offer,
      required String brand}) {
    try {
      var id = Uuid().v1();
      Product product = Product(
          id: id,
          name: name,
          category: category,
          price: price,
          imageUrl: imageUrl,
          offer: offer,
          brand: brand);
      _firestore.collection('products').doc(id).set(product.toMap());
      fetchProducts();
      Get.snackbar('Success', 'Product added successfully',
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('products').get();
      List<Product> retrivedProducts = snapshot.docs
          .map((e) => Product.fromMap(e.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrivedProducts);
      update();
    } on Exception catch (e) {
      Get.snackbar('Error fetch', e.toString());
    }
  }

  deleteProduct(String id) async {
    try {
      await _firestore.collection('products').doc(id).delete();
      Get.snackbar('Deleted', 'Product is successfully deleted');
      fetchProducts();
    } on Exception catch (e) {
      Get.snackbar('Deletion Error', e.toString());
    } finally {
      update();
    }
  }

  setDefault() {
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    imageUrl.clear();
    selectedBrand = 'Unbranded';
    selectedCategory = 'general';
    update();
  }
}
