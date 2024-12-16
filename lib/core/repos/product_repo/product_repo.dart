import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/add_product/domain/add_product_input_entity.dart';

import '../../../errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures, void>> addProduct(
      AddProductInputEntity addProductEntity);


}
