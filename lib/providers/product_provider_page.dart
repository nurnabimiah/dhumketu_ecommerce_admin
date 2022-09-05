
import 'package:dhomketu_ecommerce_admin/db/firestore_helper.dart';
import 'package:dhomketu_ecommerce_admin/models/purchases_model.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier{
  List <String> categoryList = [];
  List <ProductModel> productList = [];


  init(){
    _getAllCategories();
   // _getAllProducts();
  }




  Future <bool> cheackAdmin(String email){
    return FirestoreHelper.checkAdmin(email);

  }


  void _getAllCategories(){
    FirestoreHelper.getCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length, (index) =>
      snapshot.docs[index].data()['name']);
      notifyListeners();

    });
  }


  // insert product in firebase

Future<void > insertNewProduct (ProductModel productModel,PurchaseModel purchaseModel){
    return FirestoreHelper.addNewProduct(productModel, purchaseModel);
}




}