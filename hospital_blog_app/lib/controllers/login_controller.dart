import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hospital_blog_app/core/urls/urls.dart';
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/local_data/local_data.dart';
import '../models/login_model.dart';
import '../screens/blog_list_screen.dart';




class LoginController extends GetxController{
   final obscureText = true.obs;
  var isLoading = false;
  var userController = TextEditingController();
  var passwordController = TextEditingController();

  String user = "";
  String password = "";
 void toggleObscureText() {
    obscureText.toggle();
  }
  String? validationUser(String? value){
    if(value == null || value.isEmpty){
      return "Enter User";
    } else {
      return null;
    }
  }

  String? validationPassword(String? value){
    if(value == null || value.isEmpty){
      return "Enter Password";
    } else if(value.length < 5){
      return "Password too short";
    } else {
      return null;
    }
  }

@override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    
   // update();
  }

   @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }



login() async {
  user = userController.text.trim();
  password = passwordController.text.trim();

  isLoading = true;
  update();

  Uri url = Uri.parse(Urls.baseUrl + Urls.login);



try {
  var response = await post(
    url,
    body: {
      'email': user,
      'password': password,
    },
    headers: {
      'Accept': 'application/json',
    },
  );

  var responseBody = jsonDecode(response.body);
  print('Response: $responseBody');

  if (response.statusCode == 200) {
    
      try {
        LoginResult loginResult = LoginResult.fromJson(responseBody);
        if (loginResult.data != null ) {
          
  
          await setLocalData(loginResult);
          User userProfile = loginResult.data!.user!;
        Get.put(userProfile); //y hanif

          isLoading = false;
          update();
          Get.offAll(() => BlogListScreen());
        } else {
          isLoading = false;
          update();
          Get.snackbar('Login', 'Invalid user type');
        }
      } catch (e) {
        isLoading = false;
        update();
        Get.snackbar('Login', 'Invalid Credentials');
        print(e);
      }
   
  } else {
    isLoading = false;
    update();
    Get.snackbar('Login', 'Server Error');
  }
} catch (e) {
  isLoading = false;
  update();
  Get.snackbar('Login', 'Error: $e');
  print(e);
}
}



setLocalData(LoginResult logininfo) async {
  LocalData localData = Get.find<LocalData>();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  
  if (logininfo != null) {
   
    await localStorage.setString(LocalData.uname, userController.value.text.trim());
    await localStorage.setString(LocalData.pwd, passwordController.value.text.trim());
    await localStorage.setInt(LocalData.uid, logininfo.data!.user!.id!);
    await localStorage.setString(LocalData.tkn, logininfo.data!.token!);
    await localStorage.setBool(LocalData.ild, true);

    localData.userId = logininfo.data!.user!.id!;
    localData.username = userController.value.text.trim();
    localData.password = passwordController.value.text.trim();
    localData.token = logininfo.data!.token!;
    localData.isLoggedIn = true;
  } else {
  
    await localStorage.clear();
    localData.isLoggedIn = false;
  }

  Get.put(localData);
  update(); 
}


}