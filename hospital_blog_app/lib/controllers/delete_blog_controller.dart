// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import 'blog_list_controller.dart';

// class BlogDeleteController extends GetxController {
//   LocalData localData = Get.find();
//   //final String apiUrl = 'https://apitest.smartsoft-bd.com/api/admin/blog-news/delete/';
//  final url = Urls.baseUrl + Urls.blogdelete;
//   Future<void> deleteBlog(int blogId) async {
//     try {
      
//       final response = await http.delete(
//        // Uri.parse('$apiUrl$blogId'),
//          Uri.parse('$url$blogId'),
//         headers: {
//           "Authorization": "Bearer ${localData.token}",
//         },
//       );

      
//       if (response.statusCode == 200) {
//          Get.find<BlogListController>().fetchBlogs();
//     Get.snackbar('Success!!', 'Blog deleted successfully!');
        
//         print('Blog deleted successfully!');
//         print(response.body);
//       } else {
       
//         print('Failed to delete blog. Status code: ${response.statusCode}');
//         print(response.body);
//       }
//     } catch (error) {
   
//       print('Error deleting blog: $error');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';
import 'blog_list_controller.dart';

class BlogDeleteController extends GetxController {
  LocalData localData = Get.find();
  final url = Urls.baseUrl + Urls.blogdelete;

  Future<void> deleteBlog(int blogId) async {
    try {
      final response = await http.delete(
        Uri.parse('$url$blogId'),
        headers: {
          "Authorization": "Bearer ${localData.token}",
        },
      );

      if (response.statusCode == 200) {
        Get.find<BlogListController>().fetchBlogs();
        Get.snackbar('Success!', 'Blog deleted successfully!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        print('Blog deleted successfully!');
        print(response.body);
      } else {
        Get.snackbar('Error!', 'Failed to delete blog. Status code: ${response.statusCode}',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        print('Failed to delete blog. Status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      Get.snackbar('Error!', 'Error deleting blog: $error',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      print('Error deleting blog: $error');
    }
  }
}
