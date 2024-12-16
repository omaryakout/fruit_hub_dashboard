import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/services/database_service.dart';

class FireStoreDataBase implements DataBaseService {
  @override
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({required String path, String? documentId}) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      var data = await firestore.collection(path).get();
      return data.docs
          .map(
            (e) => e.data(),
          )
          .toList();
    }
  }

  @override
  Future<bool> isUserSigned(
      {required String path, required String documentId}) async {
    var data = await firestore.collection('users').doc(documentId).get();
    return data.exists;
  }
}
