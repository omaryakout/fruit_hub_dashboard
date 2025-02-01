import 'package:cloud_firestore/cloud_firestore.dart';



abstract class DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 
Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
       String? documentId});

 
  // Future<List<Map<String,dynamic>>> getData(
  //     {required String path, String? documentId});
      
  Future<bool> isUserSigned({required String path, required String documentId});
}
