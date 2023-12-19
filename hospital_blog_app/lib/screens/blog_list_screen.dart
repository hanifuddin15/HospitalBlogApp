import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/blog_list_controller.dart';
import '../models/blog_list_model.dart';
import '../utilities/values/colors.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Blog List'),
      ),
      body: GetX<BlogController>(
        init: blogController,
        builder: (controller) {
          if (controller.blogs.isEmpty) {
            // If the list is empty, fetch blogs
            controller.fetchBlogs();
            return Center(child: CircularProgressIndicator());
          } else {
            // If the list is not empty, display the list
            return ListView.builder(
              itemCount: controller.blogs.length,
              itemBuilder: (context, index) {
                BlogContent blog = controller.blogs[index];
                return Card(
                  color: AppColors.grey,
                  child: ListTile(
                    title: Text(blog.title ?? ''),
                    subtitle: Text(blog.subTitle ?? ''),
                    onTap: () {
                      // Handle blog item tap
                      // You can navigate to a detailed view or perform other actions here
                      print('Tapped on blog: ${blog.title}');
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}