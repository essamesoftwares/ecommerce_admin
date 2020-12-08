import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final CollectionReference ordersList =
      Firestore.instance.collection('orders');

  Future<void> createUserData(
      String status, String total, String userId, String uid) async {
    return await ordersList.document(uid).setData({
      'status': status,
      'total': total,
      'userId': userId,
    });
  }

  Future updateUserList(
      String status, String total, String userId, String uid) async {
    return await ordersList.document(uid).setData({
      'status': status,
      'total': total,
      'userId': userId,
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await ordersList.getDocuments().then((querySnapshot) {
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
