import 'dart:convert';

import 'package:dokan_app/module/home/product/data/datasouces/product_local_datasource.dart';
import 'package:dokan_app/module/home/product/data/models/product_model.dart';
import 'package:flutter/services.dart';

class ProductsLocalDatasourceImpl implements ProductLocalDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    //load the local json response
    final data = await rootBundle.loadString('assets/json/response.json');
    final list = json.decode(data) as List;
    // return list of product model
    return list.map((e) => ProductModel.fromJson(e)).toList();
  }
}
