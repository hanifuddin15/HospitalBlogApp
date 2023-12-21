import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'controllers/blog_list_controller.dart';
import 'core/local_data/local_data.dart';
import 'screens/blog_list_screen.dart';
import 'screens/login_screen.dart';

checkLocal()async{
  LocalData localData = LocalData();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
await localStorage.clear();
  String? username = localStorage.getString(LocalData.uname);
  String? password = localStorage.getString(LocalData.pwd);
  int? userId = localStorage.getInt(LocalData.Id);
  String? token = localStorage.getString(LocalData.tkn);
  bool? isLoggedIn = localStorage.getBool(LocalData.ild);

  print(token);
  if(username!=null&&password!=null&&userId!=null&&token!=null&&isLoggedIn!=null){
    localData.id = userId;
    localData.username = username;
    localData.password = password;
    localData.token = token;
    localData.isLoggedIn = isLoggedIn;
  }

  Get.put(localData);


}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //WidgetsFlutterBinding.ensureInitialized(); // uncomment if needed for resource initialization
  //GlobalBindings().dependencies();
  await checkLocal();
  //HiveManager hiveManager = HiveManager();
  //await hiveManager.setupHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalData localData =  Get.find<LocalData>();
     
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: UpgradeAlert(
          child: localData.isLoggedIn?BlogListScreen():Login()
      ),
       initialBinding: BindingsBuilder(() {
        Get.put(BlogListController());
      }),

    );
  }
  
}

