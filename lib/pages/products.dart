import 'package:ecommerce_admin/services/product_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List prodList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchProdInfo();
    fetchDatabaseList();
  }

  fetchProdInfo() async {
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await ProductService().getProductsList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        prodList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: false,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: prodList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(prodList[index]['name']),
                      subtitle: Text('₹${prodList[index]['price'].toString()}'),
                      // leading: CircleAvatar(
                      //   child: Image(
                      //     image: AssetImage('assets/Profile_Image.png'),
                      //   ),
                      // ),
                    ),
                  );
                })));
  }
}
