

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhomketu_ecommerce_admin/models/product_model.dart';
import 'package:dhomketu_ecommerce_admin/models/purchases_model.dart';

class FirestoreHelper{
  static const String _collectionAdmin = 'Admins';
  static const String _collectionProduct = 'Products';
  static const String _collectionPurchase = 'Purchases';
  static const String _collectionCategory ='Categories';

  static FirebaseFirestore _db = FirebaseFirestore.instance;
//admin cheack
  static Future <bool> checkAdmin (String email) async{
    final snapshot = await _db.collection(_collectionAdmin)
        .where('email',isEqualTo: email)
        .get();
    return snapshot.docs.isNotEmpty; // return krbe true
  }

  // categoiries

  static Stream<QuerySnapshot<Map<String,dynamic>>> getCategories() => _db.collection(_collectionCategory).snapshots();
// database batch operation
  static Future<void> addNewProduct(ProductModel productModel,PurchaseModel purchaseModel){
    final wb = _db.batch();
    final productDocRef = _db.collection(_collectionProduct).doc();
    final purchaseDocRef = _db.collection(_collectionPurchase).doc();
    productModel.id = productDocRef.id;
    purchaseModel.productId = productDocRef.id;
    wb.set(productDocRef, productModel.toMap());
    wb.set(purchaseDocRef,purchaseModel.toMap());
    return wb.commit();
  }


}