import 'package:ecommerce_admin/services/brand_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  List brandList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchBrandInfo();
    fetchDatabaseList();
  }

  fetchBrandInfo() async {
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await BrandService().getBrandsList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        brandList = resultant;
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
                itemCount: brandList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(brandList[index]['brand']),
                      // subtitle: Text(brandList[index]['email']),
                      leading: CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/Profile_Image.png'),
                        ),
                      ),
                    ),
                  );
                })));
  }
}
