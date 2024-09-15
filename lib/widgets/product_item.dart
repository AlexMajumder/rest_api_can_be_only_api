import 'package:flutter/material.dart';
import 'package:rest_api_can_be_only_api/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      tileColor: Colors.white,
      title: Text('Samsung Galaxy S24'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: code'),
          Text('Product Price: \$200'),
          Text('Product Quantity: 2'),
          Text('Total Price: \$400'),
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