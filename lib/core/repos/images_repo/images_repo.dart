import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../errors/failures.dart';




abstract class ImagesRepo {
  
  Future<Either<Failures,String>> upLoadImages(File image,String path);
}