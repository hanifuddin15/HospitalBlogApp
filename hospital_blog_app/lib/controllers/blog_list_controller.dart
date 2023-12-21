// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import '../models/blog_list_model.dart';

// class BlogController extends GetxController with WidgetsBindingObserver {
//   StreamController<List<BlogContent>> _blogsController =
//       StreamController<List<BlogContent>>.broadcast();
//   RxList<BlogContent> blogs = <BlogContent>[].obs;
//   Stream<List<BlogContent>> get blogsStream => _blogsController.stream;

//   LocalData localData = Get.find();

//   Future<void> fetchBlogs() async {
//     try {
//       Uri url = Uri.parse(Urls.baseUrl + Urls.bloglist);
//       final response = await get(
//         url,
//         headers: {
//           "Authorization": "Bearer ${localData.token}",
//         },
//       );
//       print(response.body);
//       if (response.statusCode == 200) {
//         final blogList = BlogList.fromJson(json.decode(response.body));
//         List<BlogContent> updatedBlogs =
//             blogList.blogdata?.blogs?.content ?? [];
//         blogs.value = updatedBlogs;
//         _blogsController.add(updatedBlogs);
//       } else {
//         throw Exception('Failed to load blogs');
//       }
//     } catch (error) {
//       print('Error fetching blogs: $error');
//     }
//   }

//   // Manual data fetching method
//   Future<void> fetchDataManually() async {
//     await fetchBlogs();
//   }

//   @override
//   void onInit() {
//     fetchBlogs();
//     WidgetsBinding.instance?.addObserver(this);
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     _blogsController.close();
//     WidgetsBinding.instance?.removeObserver(this);
//     super.onClose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       fetchBlogs(); // Reload blogs when the app is resumed
//     }
//   }
// }

// import 'dart:convert';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import '../models/blog_list_model.dart';

// class BlogController extends GetxController with WidgetsBindingObserver {
//   RxList<BlogContent> blogs = <BlogContent>[].obs;
//   LocalData localData = Get.find();

//   Future<void> fetchBlogs() async {
//     try {
//       Uri url = Uri.parse(Urls.baseUrl + Urls.bloglist);
//       final response = await get(
//         url,
//         headers: {
//           "Authorization": "Bearer ${localData.token}",
//         },
//       );
//       print(response.body);
//       if (response.statusCode == 200) {
//         final blogList = BlogList.fromJson(json.decode(response.body));
//         blogs.value = blogList.blogdata?.blogs?.content ?? [];
//       } else {
//         throw Exception('Failed to load blogs');
//       }
//     } catch (error) {
//       print('Error fetching blogs: $error');
//     }
//   }

//   @override
//   void onInit() {
//     fetchBlogs();
//     WidgetsBinding.instance?.addObserver(this);
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     WidgetsBinding.instance?.removeObserver(this);
//     super.onClose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       fetchBlogs(); // Reload blogs when the app is resumed
//     }
//   }
// }


import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';
import '../models/blog_list_model.dart';

class BlogListController extends GetxController with WidgetsBindingObserver {
  RxList<BlogContent> blogs = <BlogContent>[].obs;
  LocalData localData = Get.find();
  StreamController<bool> _updateController = StreamController<bool>.broadcast();

  Stream<bool> get updateStream => _updateController.stream;

  Future<void> fetchBlogs() async {
    try {
      Uri url = Uri.parse(Urls.baseUrl + Urls.bloglist);
      final response = await get(
        url,
        headers: {
          "Authorization": "Bearer ${localData.token}",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        final blogList = BlogList.fromJson(json.decode(response.body));
        blogs.value = blogList.blogdata?.blogs?.content ?? [];
        _updateController.add(true); // Notify listeners about the update
      } else {
        throw Exception('Failed to load blogs');
      }
    } catch (error) {
      print('Error fetching blogs: $error');
    }
  }

  @override
  void onInit() {
    fetchBlogs();
    WidgetsBinding.instance?.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    _updateController.close();
    WidgetsBinding.instance?.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      fetchBlogs(); // Reload blogs when the app is resumed
    }
  }
}