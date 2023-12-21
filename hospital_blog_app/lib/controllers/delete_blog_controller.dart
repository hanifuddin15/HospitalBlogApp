import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/local_data/local_data.dart';
import 'blog_list_controller.dart';

class BlogDeleteController extends GetxController {
  LocalData localData = Get.find();
  final String apiUrl = 'https://apitest.smartsoft-bd.com/api/admin/blog-news/delete/';

  Future<void> deleteBlog(int blogId) async {
    try {
      
      final response = await http.delete(
        Uri.parse('$apiUrl$blogId'),
        headers: {
          "Authorization": "Bearer ${localData.token}",
        },
      );

      
      if (response.statusCode == 200) {
         Get.find<BlogListController>().fetchBlogs();
    Get.snackbar('Success!!', 'Blog deleted successfully!');
        
        print('Blog deleted successfully!');
        print(response.body);
      } else {
       
        print('Failed to delete blog. Status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
   
      print('Error deleting blog: $error');
    }
  }
}
