// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import 'blog_list_controller.dart';

// class BlogUpdateController extends GetxController {
//   //final String apiUrl = 'https://apitest.smartsoft-bd.com/api/admin/blog-news/update/';
//    final url = (Urls.baseUrl + Urls.blogupdate);
//   LocalData localData = Get.find();

//   Future<void> updateBlog({
//     required int blogId,
//     required int categoryId,
//     required String title,
//     required String subtitle,
//     required String slug,
//     required String image,
//     required String video,
//     required String description,
//   }) async {
//     try {
    
//       final Map<String, dynamic> requestBody = {
//         'id': blogId.toString(),
//         'category_id' : categoryId.toString(),
//         'title': title,
//         'sub_title' : subtitle,
//         'slug': slug,
//         'image': image,
//         'video': video,
//         'description': description,
//       };

     
//       final response = await http.post(
//         Uri.parse('$url$blogId'),
//         body: requestBody,
//         headers: {
//           "Authorization": "Bearer ${localData.token}",
//         },
//       );

      
//       if (response.statusCode == 200) {
//         Get.find<BlogListController>().fetchBlogs();
//     Get.snackbar('Success!!', 'Blog updated successfully!', duration: Duration(seconds: 3));
    
//         print('Blog updated successfully!');
//         print(response.body);
//       } else {
//        Get.snackbar('Failed!!', 'Blog updated Failed!', duration: Duration(seconds: 3));
//         print('Failed to update blog. Status code: ${response.statusCode}');
//         print(response.body);
//       }
//     } catch (error) {
     
//       Get.snackbar('Error!!', 'Error updating blog: $error', duration: Duration(seconds: 3));
//       print('Error updating blog: $error');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';
import 'blog_list_controller.dart';

class BlogUpdateController extends GetxController {
  final url = (Urls.baseUrl + Urls.blogupdate);
  LocalData localData = Get.find();

  Future<void> updateBlog({
    required int blogId,
    required int categoryId,
    required String title,
    required String subtitle,
    required String slug,
    required String image,
    required String video,
    required String description,
  }) async {
    try {
      final Map<String, dynamic> requestBody = {
        'id': blogId.toString(),
        'category_id': categoryId.toString(),
        'title': title,
        'sub_title': subtitle,
        'slug': slug,
        'image': image,
        'video': video,
        'description': description,
      };

      final response = await http.post(
        Uri.parse('$url$blogId'),
        body: requestBody,
        headers: {
          "Authorization": "Bearer ${localData.token}",
        },
      );

      if (response.statusCode == 200) {
        Get.find<BlogListController>().fetchBlogs();
        Get.snackbar('Success!!', 'Blog updated successfully!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        print('Blog updated successfully!');
        print(response.body);
      } else {
        Get.snackbar('Failed!!', 'Blog updated Failed!',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        print('Failed to update blog. Status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      Get.snackbar('Error!!', 'Error updating blog: $error',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      print('Error updating blog: $error');
    }
  }
}

