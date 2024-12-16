
import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/add_product/domain/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../core/repos/images_repo/images_repo.dart';
import '../../services/backendpoints.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productRepo})
      : super(AddProductInitial());

  ImagesRepo imagesRepo;
  ProductRepo productRepo;
  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.upLoadImages(addProductInputEntity.image,Backendpoints.storageFileSupabase);
    result.fold(
      (l) {
        emit(AddProductFailure(l.message));
      },
      (url) async {
        addProductInputEntity.url = url;

        var result = 
        
        await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (l) {
            emit(AddProductFailure(l.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
