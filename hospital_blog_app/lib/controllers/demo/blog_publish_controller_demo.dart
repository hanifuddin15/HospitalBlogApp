// import 'package:get/get.dart';
// import 'package:hospital_blog_app/core/local_data/local_data.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';



// import '../models/blog_store_model.dart'; // Replace with the correct path

// class BlogPublishController extends GetxController {
//   var blogStore = BlogStore().obs;
//   LocalData localData = Get.find();

//   Future<void> createBlog({
//     required String title,
//     required String subTitle,
//     required String slug,
//     required String description,
//     required int categoryId,
//     required String date,
//     required List<String> tags,
//   }) async {
//     try {
//       // Map your request parameters
//       final Map<String, dynamic> requestBody = {
//         'title': '${title}',
//         'sub_title': '${subTitle}',
//         'slug': '${slug}',
//         'description': description,
//         'category_id': categoryId,
//         'date': date,
//         'tags': tags,
//       };

//       // Make the API request
//       final response = await http.post(
//         Uri.parse('https://apitest.smartsoft-bd.com/api/admin/blog-news/store'),
//         headers: {
            
//             "Authorization": "Bearer ${localData.token}",
//           },
//         body: jsonEncode(requestBody),
       
//       );
//  print(requestBody);
//       // Handle the API response
//       if (response.statusCode == 200) {
//         blogStore.value = BlogStore.fromJson(jsonDecode(response.body));
//       } else {
//         blogStore.value = BlogStore(
//           message: 'Error creating blog post',
//           status: response.statusCode,
//         );
//       }
//     } catch (e) {
//       blogStore.value = BlogStore(
//         message: 'Error creating blog post: $e',
//         status: -1,
//       );
//     }
//   }
// }
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../core/local_data/local_data.dart';
// import '../models/blog_store_model.dart'; // Replace with the correct path

// class BlogPublishController extends GetxController {
//   var blogStore = BlogStore().obs;
//   LocalData localData = Get.find();

//   Future<void> createBlog({
//     required String title,
//     required String subTitle,
//     required String slug,
//     required String description,
//     required int categoryId,
//     required String date,
//    // required List<String> tags,
//   }) async {
//     try {
//       // Create a MultipartRequest
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('https://apitest.smartsoft-bd.com/api/admin/blog-news/store'),
//       );

//       // Add your headers
//       request.headers.addAll({
//         'Authorization': 'Bearer ${localData.token}',
//       });

//       // Add your fields
//       request.fields['title'] = title;
//       request.fields['sub_title'] = subTitle;
//       request.fields['slug'] = slug;
//       request.fields['description'] = description;
//       request.fields['category_id'] = categoryId.toString();
//       request.fields['date'] = date;
//      // request.fields['tags'] = tags.join(',');

//       // Make the API request
//       var response = await request.send();

//       // Handle the API response
//       if (response.statusCode == 200) {
//         // Parse the response
//         var responseData = await response.stream.bytesToString();
//         blogStore.value = BlogStore.fromJson(jsonDecode(responseData));
//         print(responseData);
//       } else {
//         blogStore.value = BlogStore(
//           message: 'Error creating blog post ',
//           status: response.statusCode,
//         );
//       }
//     } catch (e) {
//       blogStore.value = BlogStore(
//         message: 'Error creating blog post from exception: $e',
//         status: -1,
//       );
//     }
//   }
// }