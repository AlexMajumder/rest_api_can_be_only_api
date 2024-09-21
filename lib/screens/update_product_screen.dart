import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/product.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    super.key,
  required this.product});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {

  final TextEditingController _productNameTECController = TextEditingController();
  final TextEditingController _unitPriceTECController = TextEditingController();
  final TextEditingController _totalPriceTECController = TextEditingController();
  final TextEditingController _productImageTECController = TextEditingController();
  final TextEditingController _productCodeTECController = TextEditingController();
  final TextEditingController _productQuantityTECController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inprogress = false;

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productNameTECController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  labelText: 'Product Name'
                ),
              ),
              TextFormField(
                controller: _unitPriceTECController,
                decoration: const InputDecoration(
                    hintText: 'Unit Price',
                    labelText: 'Unit Price'
                ),
              ),
              TextFormField(
                controller: _totalPriceTECController,
                decoration: const InputDecoration(
                    hintText: 'Total Price',
                    labelText: 'Total Price'
                ),
              ),//jjdj
              TextFormField(
                controller: _productImageTECController,
                decoration: const InputDecoration(
                    hintText: 'image uplode',
                    labelText: 'Product Image'
                ),
              ),
              TextFormField(
                controller: _productCodeTECController,
                decoration: const InputDecoration(
                    hintText: 'Code',
                    labelText: 'Product Code'
                ),
              ),
              TextFormField(
                controller: _productQuantityTECController,
                decoration: const InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity'
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                ),
                  onPressed: _ontabAddProduct , child: Text('Update Product')),
            ],
          ),
        ),
      ),
    );
  }

  void _ontabAddProduct (){

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



  Future<void> updateProduct() async {
    setState(() {
      _inprogress = true;
    });

    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/UpdateProduct/${product.id}');

    Map<String, dynamic> requestBody = {
      "Img": _productImageTECController.text,
      "ProductCode": _productCodeTECController.text,
      "ProductName": _productNameTECController.text,
      "Qty": _productQuantityTECController.text,
      "TotalPrice": _totalPriceTECController.text,
      "UnitPrice": _unitPriceTECController.text,
    };

    try {
      Response response = await put(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product Updated Successfully'),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update product: ${response.statusCode} - ${response.body}'),
          ),
        );
      }
    } catch (e) {
      print('An error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    } finally {
      setState(() {
        _inprogress = false;
      });
    }
  }


}
