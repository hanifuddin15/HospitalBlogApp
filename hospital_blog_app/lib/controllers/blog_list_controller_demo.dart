
// import 'dart:async';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import '../models/blog_list_model.dart';


// class BlogController extends GetxController {
//   RxList<BlogContent> blogs = <BlogContent>[].obs;
//    //StreamSubscription<List<BlogContent>>? _blogsSubscription;
//   LocalData localData = Get.find();

//   Future<void> fetchBlogs() async {
//     try {
//        Uri url = Uri.parse(Urls.baseUrl + Urls.bloglist);
//       final response = await get(
//        url,
//         headers: {
            
//             "Authorization": "Bearer ${localData.token}",
//           }
//       );
// print(response.body);
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
//     @override
//   void onInit() {
//    fetchBlogs() ;

//     super.onInit();
//   }
//    @override
//   void onClose() {
//     fetchBlogs(); 
//     super.onClose();
//   }
// }






// final BlogController blogController = BlogController();
// import 'dart:async';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import '../models/blog_list_model.dart';

// class BlogController extends GetxController {
//   final _blogs = <BlogContent>[].obs;
//   final _blogsController = StreamController<List<BlogContent>>.broadcast();
//   StreamSubscription<List<BlogContent>>? _blogsSubscription;

//   LocalData localData = Get.find();

//   List<BlogContent> get blogs => _blogs;

//   // Expose a Stream for real-time updates
//   Stream<List<BlogContent>> get blogsStream => _blogsController.stream;

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
//         _blogs.value = blogList.blogdata?.blogs?.content ?? [];

//         // Add new data to the stream
//         _blogsController.add(_blogs);
//       } else {
//         throw Exception('Failed to load blogs');
//       }
//     } catch (error) {
//       print('Error fetching blogs: $error');
//     }
//   }

//   @override
//   void onInit() {
//     // Listen to changes in the _blogs list and add them to the stream
//     _blogsSubscription = _blogs.listen((event) {
//       _blogsController.add(event);
//     });

//     super.onInit();
//   }

//   @override
//   void onClose() {
//     // Cancel the subscription when the controller is closed
//     _blogsSubscription?.cancel();

//     // Close the StreamController
//     _blogsController.close();

//     super.onClose();
//   }
// }

// final BlogController blogController = BlogController();


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


// import 'dart:async';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import '../models/blog_list_model.dart';

// class BlogController extends GetxController {
//   final _blogsController = StreamController<List<BlogContent>>.broadcast();
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
//         _blogsController.add(blogList.blogdata?.blogs?.content ?? []);
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
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     _blogsController.close();
//     super.onClose();
//   }
// }


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
//  RxList<BlogContent> blogs = <BlogContent>[].obs;
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
