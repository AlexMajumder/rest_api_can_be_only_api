import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final TextEditingController _productNameTECController = TextEditingController();
  final TextEditingController _unitPriceTECController = TextEditingController();
  final TextEditingController _totalPriceTECController = TextEditingController();
  final TextEditingController _productImageTECController = TextEditingController();
  final TextEditingController _productCodeTECController = TextEditingController();
  final TextEditingController _productQuantityTECController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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

}
