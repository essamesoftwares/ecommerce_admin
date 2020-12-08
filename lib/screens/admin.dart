import 'package:ecommerce_admin/pages/brands.dart';
import 'package:ecommerce_admin/pages/categories.dart';
import 'package:ecommerce_admin/pages/orders.dart';
import 'package:ecommerce_admin/pages/products.dart';
import 'package:ecommerce_admin/pages/users.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin/screens/add_product.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../db/category.dart';
import '../db/brand.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  BrandService _brandService = BrandService();
  CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),
                      label: Text('Dashboard'))),
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                            _selectedPage == Page.manage ? active : notActive,
                      ),
                      label: Text('Manage'))),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              tileColor: Colors.amberAccent,
              title: Text(
                'Shopping App',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                'Admin',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.lightGreenAccent,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Users()));
                        },
                        child: Container(
                          //margin: EdgeInsets.only(bottom: 350),
                          height: 150,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Icon(
                                        Icons.people_outline,
                                        color: Colors.pinkAccent,
                                      )),
                                  color: Colors.blue,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black26,
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Users",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categories()));
                        },
                        child: Container(
                          //margin: EdgeInsets.only(bottom: 350),
                          height: 150,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Icon(
                                        Icons.category,
                                        color: Colors.pinkAccent,
                                      )),
                                  color: Colors.blue,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black26,
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Categories",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Products()));
                        },
                        child: Container(
                          //margin: EdgeInsets.only(bottom: 350),
                          height: 150,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Icon(
                                        Icons.track_changes,
                                        color: Colors.pinkAccent,
                                      )),
                                  color: Colors.blue,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black26,
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Products",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Orders()));
                        },
                        child: Container(
                          //margin: EdgeInsets.only(bottom: 350),
                          height: 150,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.pinkAccent,
                                      )),
                                  color: Colors.blue,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black26,
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Orders",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // child: GridView(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2),
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(18.0),
              //       child: Card(
              //         child: ListTile(
              //             title: FlatButton.icon(
              //                 onPressed: () {
              //                   Navigator.push(context,
              //                       MaterialPageRoute(builder: (_) => Users()));
              //                 },
              //                 icon: Icon(Icons.people_outline),
              //                 label: Flexible(child: Text("Users"))),
              //             subtitle: Text(
              //               '7',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(color: active, fontSize: 60.0),
              //             )),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(18.0),
              //       child: Card(
              //         child: ListTile(
              //             title: FlatButton.icon(
              //                 onPressed: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (_) => Categories()));
              //                 },
              //                 icon: Icon(Icons.category),
              //                 label: Flexible(child: Text("Categories"))),
              //             subtitle: Text(
              //               '23',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(color: active, fontSize: 60.0),
              //             )),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(22.0),
              //       child: Card(
              //         child: ListTile(
              //             title: FlatButton.icon(
              //                 onPressed: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (_) => Products()));
              //                 },
              //                 icon: Icon(Icons.track_changes),
              //                 label: Flexible(child: Text("Products"))),
              //             subtitle: Text(
              //               '120',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(color: active, fontSize: 60.0),
              //             )),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(22.0),
              //       child: Card(
              //         child: ListTile(
              //             title: FlatButton.icon(
              //                 onPressed: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (_) => Orders()));
              //                 },
              //                 icon: Icon(Icons.shopping_cart),
              //                 label: Flexible(child: Text("Orders"))),
              //             subtitle: Text(
              //               '5',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(color: active, fontSize: 60.0),
              //             )),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add product"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddProduct()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products list"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Products()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("Add category"),
              onTap: () {
                _categoryAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category list"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Categories()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Add brand"),
              onTap: () {
                _brandAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("brand list"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Brands()));
              },
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value.isEmpty) {
              return 'category cannot be empty';
            }
            return null;
          },
          decoration: InputDecoration(hintText: "add category"),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              if (categoryController.text.isNotEmpty) {
                _categoryService.createCategory(categoryController.text);
                Fluttertoast.showToast(msg: 'category created');
                categoryController.text = "";
              } else {
                Fluttertoast.showToast(msg: 'category cannot be empty');
              }
            },
            child: Text('ADD')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          validator: (value) {
            if (value.isEmpty) {
              return 'brand cannot be empty';
            }
            return null;
          },
          decoration: InputDecoration(hintText: "add brand"),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              if (brandController.text.isNotEmpty) {
                _brandService.createBrand(brandController.text);
                Fluttertoast.showToast(msg: 'brand added');
                brandController.text = "";
              } else {
                Fluttertoast.showToast(msg: 'brand cannot be empty');
              }
            },
            child: Text('ADD')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}
