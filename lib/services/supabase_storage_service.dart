// import 'package:flutter/foundation.dart';
// import 'package:fruit_hub_dashboard/services/firestore_service.dart';
// import 'package:fruit_hub_dashboard/services/storage_service.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:path/path.dart' as b;

// import 'dart:io';

// import '../keys.dart';

// class SupabaseStoargeService implements StorageService {
//   static late Supabase supabase;

//   static initSupabase() async {
//     supabase = await Supabase.initialize(
//       url: Keys.supabaseUrl,
//       anonKey: Keys.supabaseServiceKey,
//     );
//   }

//   @override
//   Future<String> upLoadFile(File file, String path) async {
//     var imageName = b.basename(file.path);
//     var imageExt = b.extension(file.path);

//     var fullPath = await supabase.client.storage
//         .from('fruits')
//         .upload('$path/$imageName', file);

//     final url =
//         supabase.client.storage.from('fruits').getPublicUrl('$path/$imageName');

//     return fullPath;
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/keys.dart';
import 'package:fruit_hub_dashboard/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;
import 'package:crypto/crypto.dart';
import '../widgets/build_error_bar.dart';

class SupabaseStoargeService implements StorageService {
  static late Supabase _supabase;

  // static createBuckets(String bucketName) async {
  //   var buckets = await _supabase.client.storage.listBuckets();

  //   bool isBucketExits = false;

  //   for (var buckte in buckets) {
  //     if (buckte.id == bucketName) {
  //       isBucketExits = true;
  //       break;
  //     }
  //   }
  //   if (!isBucketExits) {
  //     await _supabase.client.storage.createBucket(bucketName);
  //   }
  // }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: Keys.supabaseUrl,
      anonKey: Keys.supabaseServiceKey,
    );
  }

  Future<bool> isDuplicateFile(File file, String bucketName) async {
    // Generate hash of the file
    var bytes = await file.readAsBytes();
    var fileHash = sha256.convert(bytes).toString();

    // List existing files in the bucket
    var files = await _supabase.client.storage.from(bucketName).list();

    // Compare hashes
    for (var fileItem in files) {
      // Get the file details
      var existingFile = await _supabase.client.storage
          .from(bucketName)
          .download(fileItem.name);
      var existingFileHash = sha256.convert(existingFile).toString();

      if (fileHash == existingFileHash) {
        return true; // Duplicate file found
      }
    }

    return false; // No duplicate found
  }

  @override
  Future<String?> upLoadFile(
      File file, String path, BuildContext context) async {
    final String url;
    String fileName = b.basename(file.path);
   
    try {
      var bucket = await _supabase.client.storage
          .from('fruits')
          .upload('$path/$fileName', file);

      url = _supabase.client.storage
          .from('fruits')
          .getPublicUrl('$path/$fileName');
      return url;
    } catch (e) {
      print(e.toString());
    }
  }
}
