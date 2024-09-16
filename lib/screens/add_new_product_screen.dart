import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTECController =
      TextEditingController();
  final TextEditingController _unitPriceTECController = TextEditingController();
  final TextEditingController _totalPriceTECController =
      TextEditingController();
  final TextEditingController _productImageTECController =
      TextEditingController();
  final TextEditingController _productCodeTECController =
      TextEditingController();
  final TextEditingController _productQuantityTECController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _productNameTECController,
                  decoration: const InputDecoration(
                      hintText: 'Name', labelText: 'Product Name'),
                  validator: (String? value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter a valid Value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _unitPriceTECController,
                  decoration: const InputDecoration(
                      hintText: 'Unit Price', labelText: 'Unit Price'),
                  validator: (String? value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter a valid Value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _totalPriceTECController,
                  decoration: const InputDecoration(
                      hintText: 'Total Price', labelText: 'Total Price'),
                  validator: (String? value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter a valid Value';
                    }
                    return null;
                  },
                ), //jjdj
                TextFormField(
                  controller: _productImageTECController,
                  decoration: const InputDecoration(
                      hintText: 'image uplode', labelText: 'Product Image'),
                  validator: (String? value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter a valid Value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _productCodeTECController,
                  decoration: const InputDecoration(
                      hintText: 'Code', labelText: 'Product Code'),
                  validator: (String? value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter a valid Value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _productQuantityTECController,
                  decoration: const InputDecoration(
                      hintText: 'Quantity', labelText: 'Quantity'),
                  validator: (String? value) {
                    if (value == null || value!.isEmpty) {
                      return 'Enter a valid Value';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _inProgress
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size.fromWidth(MediaQuery.of(context).size.width),
                        ),
                        onPressed: _ontabAddProduct,
                        child: Text('Add Product')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _ontabAddProduct() {
    if (_formKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  void clearTextField() {
    _productNameTECController.clear();
    _unitPriceTECController.clear();
    _totalPriceTECController.clear();
    _productImageTECController.clear();
    _productCodeTECController.clear();
    _productQuantityTECController.clear();
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTECController.text,
      "ProductCode": _productCodeTECController.text,
      "Img": _productImageTECController.text,
      "UnitPrice": _productImageTECController.text,
      "Qty": _productQuantityTECController.text,
      "TotalPrice": _totalPriceTECController.text,
    };
    Response response = await post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      clearTextField();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product Added Successfully')));
    }
    _inProgress = false;
    setState(() {});
  }

  @override
  void dispose() {
    _productNameTECController.dispose();
    _unitPriceTECController.dispose();
    _totalPriceTECController.dispose();
    _productImageTECController.dispose();
    _productCodeTECController.dispose();
    _productQuantityTECController.dispose();
    super.dispose();
  }
}
