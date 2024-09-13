import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {

  final TextEditingController _productNameTECController = TextEditingController();
  final TextEditingController _unitPriceTECController = TextEditingController();
  final TextEditingController _totalPriceTECController = TextEditingController();
  final TextEditingController _productImageTECController = TextEditingController();
  final TextEditingController _productCodeTECController = TextEditingController();
  final TextEditingController _productQuantityTECController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
            ],
          ),
        ),
      ),
    );
  }
}
