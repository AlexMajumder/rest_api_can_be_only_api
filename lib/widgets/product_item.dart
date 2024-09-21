import 'package:flutter/material.dart';
import 'package:rest_api_can_be_only_api/models/product.dart';
import 'package:rest_api_can_be_only_api/screens/update_product_screen.dart';
import 'package:rest_api_can_be_only_api/screens/product_list_screen.dart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return UpdateProductScreen(product.id,product.productImage,product.productName,product.productCode,product.unitPrice,product.totalPrice);
                      }),
                    );
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit')),
              TextButton.icon(
                  onPressed: () {
                    MyAlartDialog(context);
                  },
                  icon: Icon(Icons.delete,color: Colors.red,),
                  label: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          )
        ],
      ),
    );
  }

  MyAlartDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: Text('Confurm!'),
            content: Text('Do you really want to Delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    deleteApiFetching(product.id);//delete product
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'yes',
                    style: TextStyle(color: Colors.green),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          ));
        });
  }

  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }







}
