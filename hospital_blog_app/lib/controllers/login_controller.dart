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

//   try {
//     var response = await post(
//       url,
//       body: {
//         'username': user,
//         'password': password,
//       },
//       headers: {
//         'Accept': 'application/json',
//       },
//     );

//     var body = jsonDecode(response.body);

//     // if (response.statusCode == 200) {
//     //   try {
//     //     LoginResult loginResult =
//     //         LoginResult.fromJson(jsonDecode(response.body));
//     //     if (loginResult.data != null &&
//     //         loginResult.data!.type == 'doctor') {
//     //       await setLocalData(loginResult.data!);
//     //       DoctorProfile doctorProfile = loginResult.data!;
//     //       Get.put(doctorProfile);
//     //     }

//     //     isLoading = false;
//     //     update();  // Make sure to call update here to trigger a re-render
//     //     Get.offAll(() => DoctorHomeScreen());
//     //   } catch (e) {
//     //     isLoading = false;
//     //     update();
//     //     Get.snackbar('Login', 'Invalid Credentials');
//     //     print(e);
//     //   }
//     // } else {
//     //   isLoading = false;
//     //   update();
//     //   Get.snackbar('Login', body['msg']);
//     // }

//     //developed by hanif
//     if (response.statusCode == 200) {
//   var responseBody = jsonDecode(response.body);

//   // Check if the response body contains "msg" key with value "Invalid Credentials."
//   if (responseBody['msg'] != null &&
//       responseBody['msg'] == 'Invalid Credentials.') {
//     // Handle the case where credentials are invalid
//     isLoading = false;
//     update();
//     Get.snackbar('Login', 'Invalid Credentials');
//   } else {
//     try {
//       LoginResult loginResult = LoginResult.fromJson(responseBody);
//       if (loginResult.data != null && loginResult.data!.type == 'doctor' ) {
//         await setLocalData(loginResult.data!);
//         DoctorProfile doctorProfile = loginResult.data!;
//         Get.put(doctorProfile);

//         isLoading = false;
//         update();
//         Get.offAll(() => DoctorHomeScreen());
//       }
//     } catch (e) {
//       isLoading = false;
//       update();
//       Get.snackbar('Login', 'Invalid Credentials');
//       print(e);
//     }
//   }
// } else {
//   Get.snackbar('Login', body['msg']);
// }

//   } catch (e) {
//     isLoading = false;
//     update();
//     Get.snackbar('Error', 'Server Error');
//     print(e);
//   }

//newly developed by hanif

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
           // Convert empty string age to null
  

  // Update the age property
  
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
    // } else {
    //   isLoading = false;
    //   update();
    //   Get.snackbar('Login', responseBody['msg']);
    // }
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

//newly developed by hanif end

//developed by hanif end

  // login()async{
  //   final uname = userController.value.text.trim();
  //   final pass = passwordController.value.text.trim();

  //   isLoading = true;
  //   update();
  //   Uri url = Uri.parse(Urls.baseUrl+Urls.login);
  //   var response = await post(url, body:
  //   {
  //     'username': uname,
  //     "password": pass
  //   },
  //       headers: {
  //         "Accept":"application/json"
  //       });

  //   var body = jsonDecode(response.body);
  //   print(body);
  //   try{
  //     var response = await post(url, body:
  //     {
  //       'username': uname,
  //       "password": pass
  //     },
  //         headers: {
  //           "Accept":"application/json"
  //         });

  //     var body = jsonDecode(response.body);

  //     if(response.statusCode==200){
  //       try{
  //         LoginResult loginResult = LoginResult.fromJson(jsonDecode(response.body));
  //         if(loginResult.data!=null && loginResult.data!.type == "doctor") //modified condition by hanif
  //         {
  //           await setLocalData(loginResult.data!);
  //           DoctorProfile doctorProfile = loginResult.data!;
  //           Get.put(doctorProfile);
  //         }

  //         isLoading = false;
  //         update();
  //         Get.offAll(()=>DoctorHomeScreen());
  //       }catch(e){
  //         isLoading = false;
  //         update();
  //         //Get.snackbar("Login", "${body["msg"]}");
  //         Get.snackbar("Login", "Invalid Credentials"); // modified by hanif
  //         print(e);

  //       }
  //     }else{
  //       Get.snackbar("Login", body["msg"]);
  //     }

  //   }catch(e){
  //     isLoading = false;
  //     update();
  //     Get.snackbar("Error", "Server Error");
  //     print(e);

  //   }
  //   //01824713029
  //   //12345678
  // }

  // setLocalData(DoctorProfile personalInfo)async{

  //   LocalData localData = Get.find<LocalData>();
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   await localStorage.clear(); // developed by hanif
  //   await localStorage.setString(LocalData.uname, userController.value.text.trim());
  //   await localStorage.setString(LocalData.pwd, passwordController.value.text.trim());
  //   await localStorage.setInt(LocalData.uid, personalInfo.id!);
  //   await localStorage.setString(LocalData.tkn, personalInfo.jwtToken!.original!.accessToken!);
  //   await localStorage.setBool(LocalData.ild, true);


  //   localData.userId = personalInfo.id!;
  //   localData.username = userController.value.text.trim();
  //   localData.password = passwordController.value.text.trim();
  //   localData.token = personalInfo.jwtToken!.original!.accessToken!;
  //   localData.isLoggedIn = true;
  //   Get.put(localData);

  //   update();
  // }

// setLocalData(DoctorProfile personalInfo) async {
//   LocalData localData = Get.find<LocalData>();
//   SharedPreferences localStorage = await SharedPreferences.getInstance();
//   await localStorage.clear();
//   await localStorage.setString(
//       LocalData.uname, userController.value.text.trim());
//   await localStorage.setString(
//       LocalData.pwd, passwordController.value.text.trim());
//   await localStorage.setInt(LocalData.uid, personalInfo.id!);
//   await localStorage.setString(
//       LocalData.tkn, personalInfo.jwtToken!.original!.accessToken!);
//   await localStorage.setBool(LocalData.ild, true);

//   localData.userId = personalInfo.id!;
//   localData.username = userController.value.text.trim();
//   localData.password = passwordController.value.text.trim();
//   localData.token = personalInfo.jwtToken!.original!.accessToken!;
//   localData.isLoggedIn = true;
//   Get.put(localData);

//   update();  // Make sure to call update here to trigger a re-render
// }
setLocalData(LoginResult logininfo) async {
  LocalData localData = Get.find<LocalData>();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  
  if (logininfo != null) {
    // If personalInfo is not null, set the data and mark as logged in
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
    // If personalInfo is null, clear the local storage and mark as logged out
    await localStorage.clear();
    localData.isLoggedIn = false;
  }

  Get.put(localData);
  update();  // Make sure to call update here to trigger a re-render
}


}