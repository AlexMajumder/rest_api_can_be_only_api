import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rest_api_can_be_only_api/screens/add_new_product_screen.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];

  bool _inProgress = false;

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
        actions: [
          IconButton(
              onPressed: () {
                getProductList();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: _inProgress
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddNewProductScreen();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      productList.clear();

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      for (var item in jsonResponse['data']) {
        Product product = Product(
          id: item['_id'] ?? 'def',
          productName: item['ProductName'] ?? 'def',
          productCode: item['ProductCode'] ?? 'def',
          productImage: item['Img'] ?? 'def',
          unitPrice: item['UnitPrice'] ?? 'def',
          quantity: item['Qty'] ?? 'def',
          totalPrice: item['TotalPrice'] ?? 'def',
          createdAt: item['CreatedDate'] ?? 'def',
        );
        productList.add(product);
      }
    }

    _inProgress = false;

    setState(() {});
  }

  ////////////////////////////////*************************//////////////////////////////////////

  Future<void> deleteApiFetching(String id) async {
    final uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id');
    Response response = await get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        getProductList();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product deleted successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product deletion failed'),
        ),
      );
    }
  }

//   Future<void> deleteProduct(String id) as {
//
//     final Response response = await get(
//       Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Seccessfylly Deleted')));
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Faild to Deleted')));
//     }
//   }
}
