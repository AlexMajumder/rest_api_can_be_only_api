import 'package:flutter/material.dart';
import 'package:rest_api_can_be_only_api/models/product.dart';
import 'package:rest_api_can_be_only_api/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      tileColor: Colors.white,
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Product Price: \$${product.unitPrice}'),
          Text('Product Quantity: ${product.quantity}'),
          Text('Total Price: \$${product.totalPrice}'),
          Divider(),
          ButtonBar(
            children: [
              TextButton.icon(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UpdateProductScreen();
                }),
                );
              },icon: Icon(Icons.edit), label: Text('Edit')),
              TextButton.icon(onPressed: (){},icon: Icon(Icons.delete), label: Text('Delete',style: TextStyle(color: Colors.red),))
            ],
          )
        ],
      ),
    );
  }
}