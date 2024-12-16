import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/services/storage_service.dart';
import 'package:path/path.dart' as b;


class FirestoreService implements StorageService {
Future<String> upLoadFile(File image, String path  ) async {
    var imagePath = b.basename(image.path);
    var imageExt = b.extension(image.path);
    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child("$path/$imagePath$imageExt");
    await imagesRef.putFile(image);
    var url = await imagesRef.getDownloadURL();
    return url;
  }
}