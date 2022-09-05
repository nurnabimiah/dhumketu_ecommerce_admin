
import 'package:dhomketu_ecommerce_admin/auth/firebase_auth_service.dart';
import 'package:dhomketu_ecommerce_admin/pages/dashboard_page.dart';
import 'package:dhomketu_ecommerce_admin/pages/login_page.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher_page';

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState()  {
    Future.delayed(Duration.zero,(){
      if(FirebaseAuthService.currentUser!=null){
        Navigator.pushReplacementNamed(context, DashboardPage.routeName);
      }
      else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }

    });

   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Launcher Page'),),
    );
  }


}
