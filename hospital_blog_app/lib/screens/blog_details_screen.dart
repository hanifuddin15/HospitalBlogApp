import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/delete_blog_controller.dart';
import '../models/blog_list_model.dart';
import 'blog_update_screen.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogContent blog;
 final BlogDeleteController deleteController = Get.put(BlogDeleteController());
   BlogDetailScreen({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${blog.title}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Sub Title: ${blog.subTitle}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Image: ${blog.image}'),
            SizedBox(height: 10),
            Text('Video: ${blog.video}'),
            SizedBox(height: 10),
            Text('Slug: ${blog.slug}'),
            SizedBox(height: 20),
            Text('Description: ${blog.description}'),
            SizedBox(height: 20),
            Text('Category Id: ${blog.categoryId}'),
            SizedBox(height: 20),
            Text('Date: ${blog.date}'),
            SizedBox(height: 20),
            Text(
              'Id: ${blog.id}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                  
                    Get.to(() => BlogUpdateScreen(blog: blog));
                  },
                  child: Text('Update Blog'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                   
                    deleteController.deleteBlog(blog.id!);
                  },
                  child: Text('Delete Blog'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
