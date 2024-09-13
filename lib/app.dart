import 'package:flutter/material.dart';
import 'package:rest_api_can_be_only_api/screens/product_list_screen.dart';
class ApiApp extends StatelessWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductListScreen(),
    );
  }
}
