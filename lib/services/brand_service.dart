import 'package:cloud_firestore/cloud_firestore.dart';

class BrandService {
  final CollectionReference brandsList =
      Firestore.instance.collection('brands');

  Future<void> createUserData(String brand, String uid) async {
    return await brandsList.document(uid).setData({
      'brand': brand,
    });
  }

  Future updateBrandList(String brand, String uid) async {
    return await brandsList.document(uid).updateData({'brand': brand});
  }

  Future getBrandsList() async {
    List itemsList = [];

    try {
      await brandsList.getDocuments().then((querySnapshot) {
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
