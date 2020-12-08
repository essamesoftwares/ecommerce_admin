import 'package:ecommerce_admin/services/category_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List catList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await CategoryService().getCategoriesList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        catList = resultant;
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
                itemCount: catList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(catList[index]['category']),
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
