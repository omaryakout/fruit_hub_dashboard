import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart' as fire;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/add_product/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/add_product/domain/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/add_product/domain/review_entity.dart';
import 'package:fruit_hub_dashboard/add_product/domain/review_json.dart';

import 'package:fruit_hub_dashboard/services/firestore_database.dart';
import 'package:fruit_hub_dashboard/widgets/build_error_bar.dart';
import 'package:fruit_hub_dashboard/widgets/custom_text_form_Field.dart';
import 'package:fruit_hub_dashboard/widgets/featured_button.dart';
import 'package:fruit_hub_dashboard/widgets/pick_image.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../core/repos/product_repo/product_repo.dart';
import '../../core/repos/product_repo/product_repo_impl.dart';
import '../../services/database_service.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_is_featured_box.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  static const routeName = 'product page';
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  late bool isFeatured = false, isOrganic = false;
  late String name, description, code;
  late String url;
  late num price, avgRating, ratingCount ;
  late int expirationMonths, numberOfCalories, unitAmount;

  File? image;
  DataBaseService dataBaseService = FireStoreDataBase();
  ProductRepo? productRepo = ProductRepoImpl(FireStoreDataBase());
  fire.FirebaseFirestore firestore = fire.FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductLoading) {
          isLoading = true;
        }
        if (state is AddProductSuccess) {
          isLoading = false;
          buildError(context, 'product added successfully');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('add products'),
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _globalKey,
                    autovalidateMode: _autovalidateMode,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          onSaved: (input) {
                            name = input!;
                          },
                          keyBoardType: TextInputType.text,
                          label: const Text('Product name'),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTextFormField(
                          onSaved: (input) {
                            price = num.parse(input!);
                          },
                          keyBoardType: TextInputType.text,
                          label: const Text('Product price'),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTextFormField(
                          onSaved: (input) {
                            code = input!.toLowerCase();
                          },
                          keyBoardType: TextInputType.text,
                          label: const Text('Product code'),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTextFormField(
                          onSaved: (input) {
                            description = input!;
                          },
                          keyBoardType: TextInputType.text,
                          label: const Text('description'),
                          maxLines: 5,
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTextFormField(
                          onSaved: (input) {
                            expirationMonths = int.parse(input!);
                          },
                          keyBoardType: TextInputType.number,
                          label: const Text('expiration months'),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTextFormField(
                          onSaved: (input) {
                            numberOfCalories = int.parse(input!);
                          },
                          keyBoardType: TextInputType.number,
                          label: const Text('number of calories'),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTextFormField(
                          onSaved: (input) {
                            unitAmount = int.parse(input!);
                          },
                          keyBoardType: TextInputType.number,
                          label: const Text('unitAmount'),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomFeaturedBox(
                              isFeatured: isFeatured,
                              passData: (val) {
                                setState(() {
                                  isFeatured = val;
                                });
                              },
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'is featured?',
                                      style: AppTextStyle.semiBold13
                                          .copyWith(color: const Color(0xff949D9E))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomCheckBox(
                              isChecked: isOrganic,
                              passData: (val) {
                                setState(() {
                                  isOrganic = val;
                                });
                              },
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'is organic?',
                                      style: AppTextStyle.semiBold13
                                          .copyWith(color: const Color(0xff949D9E))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        PickImage(
                          onValueChanged: (value) {
                            image = value;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            FeaturedButton(
                              text: 'add data ',
                              onPressed: () {
                                if (image != null) {
                                  if (_globalKey.currentState!.validate()) {
                                    _globalKey.currentState!.save();
                                    AddProductInputEntity input =
                                        AddProductInputEntity(
                                          reviews: [
                                            ReviewEntity(date: DateTime.now().toString(),
                                            image: 'ff',
                                            name: 'omar',
                                            ratting: 10,
                                            reviewDescription: 'nicee')
                                          ],
                                      expirationDate: expirationMonths,
                                      isOrganic: isOrganic,
                                      numberOfCalories: numberOfCalories,
                                      unitAmount:unitAmount,
                                      name: name,
                                      description: description,
                                      price: price,
                                      code: code,
                                      image: image!,
                                      isFeatured: isFeatured,
                                    );

                                    context
                                        .read<AddProductCubit>()
                                        .addProduct(input);
                                  } else {
                                    _autovalidateMode = AutovalidateMode.always;
                                    setState(() {});
                                  }
                                } else {
                                  buildError(context, 'please pick image');
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
