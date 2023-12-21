import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_blog_app/screens/blog_list_screen.dart';

import '../controllers/blog_list_controller.dart';
import '../controllers/blog_publish_controller.dart';

class BlogPublishScreen extends StatelessWidget {
  final BlogPublishController blogController = Get.put(BlogPublishController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Blog Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title(required)')),
              TextField(
                  controller: subTitleController,
                  decoration: InputDecoration(labelText: 'Sub Title(required)')),
              TextField(
                  controller: slugController,
                  decoration: InputDecoration(labelText: 'Slug(required)')),
              TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description(required)')),
              TextField(
                  controller: categoryIdController,
                  decoration: InputDecoration(labelText: 'Category ID(required)')),
              TextField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Date')),
              TextField(
                  controller: tagsController,
                  decoration:
                      InputDecoration(labelText: 'Tags (comma separated)')),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  blogController.createBlog(
                    title: titleController.text,
                    subTitle: subTitleController.text,
                    slug: slugController.text,
                    description: descriptionController.text,
                    categoryId: int.parse(categoryIdController.text),
                    date: dateController.text,
                    // tags: tagsController.text.split(','),
                  );
                },
                child: Text('Create Blog Post'),
              ),
              // Obx(() {
              //   if (blogController.blogStore.value.message != null) {
              //     return Text('API Response: ${blogController.blogStore.value.message}',);
              //    // Get.snackbar('Login', 'Invalid user type');

              //   } else {
              //     return SizedBox.shrink();
              //   }

              // }),
              Obx(() {
                if (blogController.blogStore.value.message != null) {
                  Get.snackbar(
                    'API Response',
                    blogController.blogStore.value.message!,
                    duration: Duration(seconds: 3),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                  );

                  // // Navigate to BlogListScreen after showing the Snackbar
                  // Future.delayed(Duration(seconds: 1), () {
                  //   Get.to(() => BlogListScreen());
                  // });
                  return Text(
                    'API Response: ${blogController.blogStore.value.message}',
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
