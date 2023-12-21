
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hospital_blog_app/controllers/blog_list_controller.dart';
import 'package:hospital_blog_app/core/urls/urls.dart';
import 'package:http/http.dart' as http;
import '../core/local_data/local_data.dart';
import '../models/blog_store_model.dart';

class BlogPublishController extends GetxController {
  var blogStore = BlogStore().obs;
  LocalData localData = Get.find();

  Future<void> createBlog({
    required String title,
    required String subTitle,
    required String slug,
    required String description,
    required int categoryId,
    required String date,
  }) async {
    try {
      Uri url = Uri.parse(Urls.baseUrl + Urls.blogstore);
       var request = http.MultipartRequest(
        'POST',
        //Uri.parse('https://apitest.smartsoft-bd.com/api/admin/blog-news/store'),
        url
      );

      // Add your headers
      request.headers.addAll({
        'Authorization': 'Bearer ${localData.token}',
      });

      // Add your fields
      request.fields['title'] = title;
      request.fields['sub_title'] = subTitle;
      request.fields['slug'] = slug;
      request.fields['description'] = description;
      request.fields['category_id'] = categoryId.toString();
      request.fields['date'] = date;
     // request.fields['tags'] = tags.join(',');

      var response = await request.send();


      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        blogStore.value = BlogStore.fromJson(jsonDecode(responseData));
       print(responseData);
        Get.find<BlogListController>().fetchBlogs(); 
      } else {
        blogStore.value = BlogStore(
          message: 'Error creating blog post',
          status: response.statusCode,
        );
      }
    } catch (e) {
      blogStore.value = BlogStore(
        message: 'Error creating blog post: $e',
        status: -1,
      );
    }
  }
}