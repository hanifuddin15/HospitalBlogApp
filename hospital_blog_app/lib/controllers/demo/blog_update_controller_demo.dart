// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';

// class BlogUpdateController extends GetxController {
//   final String apiUrl = 'https://apitest.smartsoft-bd.com/api/admin/blog-news/update/';

//   Future<void> updateBlog({
//     required int blogId,
//     required int categoryId,
//     required String title,
//     required String subtitle,
//     required String slug,
//    // required File image,
//     required String video,
//     required String description,
//   }) async {
//     try {
//       // Create a multipart request
//       var request = http.MultipartRequest('POST', Uri.parse('$apiUrl$blogId'));

//       // Add fields to the request
//       request.fields['id'] = blogId.toString();
//       request.fields['category_id'] = categoryId.toString();
//       request.fields['title'] = title;
//       request.fields['sub_title'] = subtitle;
//       request.fields['slug'] = slug;
//       request.fields['video'] = video;
//       request.fields['description'] = description;

//       // Add the image file to the request
//       // var imageField = await http.MultipartFile.fromPath('image', image.path);
//       // request.files.add(imageField);

//       // Send the multipart request
//       var response = await request.send();
//       print(response);

//       // Check if the request was successful (status code 200)
//       if (response.statusCode == 200) {
//         // Successful update, you can handle the response as needed
//         print('Blog updated successfully!');
//         print(await response.stream.bytesToString());
//       } else {
//         // Request failed, handle the error
//         print('Failed to update blog. Status code: ${response.statusCode}');
//         print(await response.stream.bytesToString());
//       }
//     } catch (error) {
//       // Handle any exceptions that occur during the HTTP request
//       print('Error updating blog: $error');
//     }
//   }
// }
