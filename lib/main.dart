import 'package:ecommerce_admin/screens/admin.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin/providers/app_states.dart';
import 'package:ecommerce_admin/providers/products_provider.dart';
import 'package:ecommerce_admin/screens/dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AppState()),
      ChangeNotifierProvider.value(value: ProductProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Admin(),
    ),
  ));
}
