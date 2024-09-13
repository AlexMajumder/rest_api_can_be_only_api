import 'package:flutter/material.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),

      ),
      body: ListView.separated(
    itemCount: 20,
    itemBuilder: (context, index) {
      return
     const ProductItem();
      },
    separatorBuilder: (context, index) {
      return SizedBox(height: 4);
    },
    )
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
              TextButton.icon(onPressed: (){},icon: Icon(Icons.edit), label: Text('Edit')),
              TextButton.icon(onPressed: (){},icon: Icon(Icons.delete), label: Text('Delete',style: TextStyle(color: Colors.red),))
            ],
          )
        ],
      ),
    );
  }
}
