
import 'package:flutter/material.dart';
import 'package:flutter_application_sample_login/db/sign_in_db.dart';
import 'package:flutter_application_sample_login/pages/login_page.dart';
import 'package:flutter_application_sample_login/pages/signup_page.dart';
import 'package:flutter_application_sample_login/pages/welcome_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'model/sign_in_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(signInModelAdapter().typeId)){
    Hive.registerAdapter(signInModelAdapter());
    }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    signInDb.instance.refreshUI();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: Colors.transparent
      ),
      home: loginPage(),
     getPages: [
        GetPage(name: '/welcome', page: (() => const welcomePage())),
        GetPage(name:'/login',page: () => const loginPage(),),
         GetPage(name:'/signup',page: () => const signupPage(),)
       
     ],
    );

  }
}
