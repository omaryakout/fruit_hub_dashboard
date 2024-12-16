import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/add_product/domain/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/add_product/domain/add_product_json.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/services/database_service.dart';
import 'package:fruit_hub_dashboard/services/backendpoints.dart';
import 'package:fruit_hub_dashboard/errors/failures.dart';

class ProductRepoImpl implements ProductRepo {
  DataBaseService dataBaseService;
  ProductRepoImpl(this.dataBaseService);

  @override
  Future<Either<Failures, void>> addProduct(
      AddProductInputEntity addProductEntity) async {
    try {
      await dataBaseService.addData(
          path: Backendpoints.addProductCollection,
          data: AddProductJson.fromEntity(addProductEntity).toJson());
      return right(null);
    } catch (e) {
      return left(ServerFailure('Failed to add product'));
    }
  }


}
