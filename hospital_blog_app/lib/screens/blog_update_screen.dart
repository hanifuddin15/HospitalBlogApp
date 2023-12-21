// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/blog_update_controller.dart';
// import '../models/blog_list_model.dart';

// class BlogUpdateScreen extends StatelessWidget {
//   final BlogContent blog;

//   const BlogUpdateScreen({Key? key, required this.blog}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final BlogUpdateController updateController = Get.put(BlogUpdateController());

//     TextEditingController titleController = TextEditingController(text: blog.title);
//     TextEditingController subtitleController = TextEditingController(text: blog.subTitle);
//     TextEditingController slugController = TextEditingController(text: blog.slug);
//    // TextEditingController idController = TextEditingController(int: blog.id);
//    //TextEditingController categoryIdController = TextEditingController(text: blog.categoryId);

//     TextEditingController imageController = TextEditingController(text: blog.image);
//     TextEditingController videoController = TextEditingController(text: blog.video);
//     TextEditingController descriptionController = TextEditingController(text: blog.description);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Blog'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//              TextFormField(
//               controller: subtitleController,
//               decoration: InputDecoration(labelText: 'Sub Title'),
//             ),
//              TextFormField(
//               controller: slugController,
//               decoration: InputDecoration(labelText: 'Slug'),
//             ),
//             TextFormField(
//               controller: imageController,
//               decoration: InputDecoration(labelText: 'Image'),
//             ),
//             TextFormField(
//               controller: videoController,
//               decoration: InputDecoration(labelText: 'Video'),
//             ),
//             TextFormField(
//               controller: descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Call the update method when the button is pressed
//                 updateController.updateBlog(
//                   blogId: blog.id ?? 0,
//                   title: titleController.text,
//                   image: imageController.text,
//                   video: videoController.text,
//                   description: descriptionController.text, 
//                   categoryId: blog.categoryId ?? 0, 
//                   subtitle: subtitleController.text, 
//                   slug: slugController.text
//                 );
//               },
//               child: Text('Update Blog'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'dart:io';
import '../controllers/blog_update_controller.dart';
import '../models/blog_list_model.dart';

class BlogUpdateScreen extends StatelessWidget {
  final BlogContent blog;

  const BlogUpdateScreen({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogUpdateController updateController = Get.put(BlogUpdateController());
TextEditingController imageController = TextEditingController(text: blog.image);
    TextEditingController titleController = TextEditingController(text: blog.title);
    TextEditingController subtitleController = TextEditingController(text: blog.subTitle);
    TextEditingController slugController = TextEditingController(text: blog.slug);
    TextEditingController videoController = TextEditingController(text: blog.video);
    TextEditingController descriptionController = TextEditingController(text: blog.description);

    // Declare a variable to hold the selected image file
    File? selectedImage;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: subtitleController,
              decoration: InputDecoration(labelText: 'Sub Title'),
            ),
            TextFormField(
              controller: slugController,
              decoration: InputDecoration(labelText: 'Slug'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Use image_picker to pick an image file
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  selectedImage = File(pickedFile.path);
                  // Update the imageController text if needed
                  // imageController.text = pickedFile.path;
                }
              },
              child: Text('Pick Image'),
            ),
            TextFormField(
              // Use a TextFormField for image display, but make it non-editable
              controller: TextEditingController(text: selectedImage?.path ?? ''),
              enabled: false,
              decoration: InputDecoration(labelText: 'Image'),
            ),
            TextFormField(
              controller: videoController,
              decoration: InputDecoration(labelText: 'Video'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the update method when the button is pressed
                updateController.updateBlog(
                  blogId: blog.id ?? 0,
                  title: titleController.text,
                 // image: selectedImage!, // Pass the File object
                  video: videoController.text,
                  description: descriptionController.text,
                  categoryId: blog.categoryId ?? 0,
                  subtitle: subtitleController.text,
                  slug: slugController.text, image: imageController.text
                );
              },
              child: Text('Update Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
