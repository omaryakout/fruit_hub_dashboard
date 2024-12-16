import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

abstract class StorageService {
Future<String> upLoadFile(File image , String path );
  }

