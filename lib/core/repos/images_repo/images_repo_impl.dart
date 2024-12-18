import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/services/storage_service.dart';
import 'package:fruit_hub_dashboard/errors/failures.dart';

class ImagesRepoImpl extends ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl({required this.storageService});
  

  @override
  Future<Either<Failures, String?>> upLoadImages(File image ,String path,BuildContext context) async {
    try {

      String? url = await storageService.upLoadFile(image,path,context);
      
      return right(url);
    } catch (e) {
      return left(ServerFailure('failed to upload'));
    }
  }
}