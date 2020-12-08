import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference productList =
      Firestore.instance.collection('products');

  Future<void> createUserData(String name, String price, String uid) async {
    return await productList
        .document(uid)
        .setData({'name': name, 'price': price});
  }

  Future updateUserList(String name, String price, String uid) async {
    return await productList
        .document(uid)
        .setData({'name': name, 'price': price});
  }

  Future getProductsList() async {
    List itemsList = [];

    try {
      await productList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
