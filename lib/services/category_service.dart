import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryService {
  final CollectionReference categoryList =
      Firestore.instance.collection('categories');

  Future<void> createUserData(String category, String uid) async {
    return await categoryList.document(uid).setData({
      'category': category,
    });
  }

  Future updateUserList(String name, String uid) async {
    return await categoryList.document(uid).updateData({'name': name});
  }

  Future getCategoriesList() async {
    List itemsList = [];

    try {
      await categoryList.getDocuments().then((querySnapshot) {
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
