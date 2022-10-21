import 'package:flutter/material.dart';
import 'package:flutter_application_sample_login/db/sign_in_db.dart';
import 'package:get/get.dart';

import '../model/sign_in_model.dart';
import 'login_page.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ValueListenableBuilder(valueListenable:signInListNotifier,
     builder: (BuildContext context, List<signInModel>newList, Widget?_){
      return Card(
         child: ListView.separated(itemBuilder:((context, index) {
          final category=newList[index];
           return  ListTile(
              title: Text(category.name),
              subtitle: Text(category.email),
               leading:const Text('Welcome',
               style: TextStyle(
                fontWeight: FontWeight.bold
               ),
               ),
              trailing:  ElevatedButton.icon(onPressed: (){
               signInDb.instance.deleteCategories(category.id);
                Get.toNamed('/login', arguments: loginPage());
              }, icon: Icon(Icons.logout_outlined,),
              label: Text('Logout'),
              ),
             );
          }), 
          separatorBuilder:( context,  index) {
          return  Divider();
          }, 
          itemCount: newList.length),
       );
     }),
     
 
    );

    
  }
}
     