
import 'package:dhomketu_ecommerce_admin/auth/firebase_auth_service.dart';
import 'package:dhomketu_ecommerce_admin/custom_widgets/dashboard_button.dart';
import 'package:dhomketu_ecommerce_admin/pages/login_page.dart';
import 'package:dhomketu_ecommerce_admin/pages/product_list_page.dart';
import 'package:dhomketu_ecommerce_admin/providers/product_provider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_product_page.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late ProductProvider _productProvider;
  @override
  void didChangeDependencies() {
    _productProvider = Provider.of<ProductProvider>(context,listen:false);
    _productProvider.init();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard Page'),
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuthService.logOutAdmin().then((value) => Navigator.pushReplacementNamed(context, LoginPage.routeName));
              },
              icon: Icon(Icons.logout) )
        ],
      ),

      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
         children: [
           DashboardButton(
             label: 'Add Product',
             onPressed: () => Navigator.pushNamed(context, NewProductPage.routeName),
           ),
           DashboardButton(
             label: 'View Product',
             onPressed: () => Navigator.pushNamed(context, ProductListPage.routeName),
           ),
           DashboardButton(
             label: 'View Product',
             onPressed: () => Navigator.pushNamed(context, ProductListPage.routeName),
           ),
           DashboardButton(
             label: 'View Product',
             onPressed: () => Navigator.pushNamed(context, ProductListPage.routeName),
           ),
           DashboardButton(
             label: 'View Product',
             onPressed: () => Navigator.pushNamed(context, ProductListPage.routeName),
           ),
           DashboardButton(
             label: 'View Product',
             onPressed: () => Navigator.pushNamed(context, ProductListPage.routeName),
           ),
           DashboardButton(
             label: 'View Product',
             onPressed: () => Navigator.pushNamed(context, ProductListPage.routeName),
           ),

         ],
      ),



    );
  }
}
