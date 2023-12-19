
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';
import '../models/blog_list_model.dart';


class BlogController extends GetxController {
  RxList<BlogContent> blogs = <BlogContent>[].obs;
  LocalData localData = Get.find();

  Future<void> fetchBlogs() async {
    try {
       Uri url = Uri.parse(Urls.baseUrl + Urls.bloglist);
      final response = await get(
       url,
        headers: {
            
            "Authorization": "Bearer ${localData.token}",
          }
      );
print(response.body);
      if (response.statusCode == 200) {
        final blogList = BlogList.fromJson(json.decode(response.body));
        blogs.value = blogList.blogdata?.blogs?.content ?? [];
      } else {
        throw Exception('Failed to load blogs');
      }
    } catch (error) {
      print('Error fetching blogs: $error');
    }
  }
}

final BlogController blogController = BlogController();
