import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rest_api_can_be_only_api/screens/add_new_product_screen.dart';

import '../widgets/product_item.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
        return const ProductItem();
        },
            separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
            },
            ),
      ),
      floatingActionButton: FloatingActionButton
        (
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddNewProductScreen();
          }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
  }

}


