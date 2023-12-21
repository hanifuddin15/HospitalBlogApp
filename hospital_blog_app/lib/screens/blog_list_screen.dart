import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_blog_app/controllers/blog_list_controller.dart';
import '../models/blog_list_model.dart';
import 'blog_details_screen.dart';
import 'blog_publish_screen.dart';

class BlogListScreen extends StatelessWidget {
  final BlogListController blogController = Get.find(); // Get the existing instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Text('Blog List'),
            SizedBox(width: 40),
            Container(
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Color.fromARGB(255, 13, 13, 14),
                ),
                onPressed: () async {
                  Get.to(() => BlogPublishScreen());
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white)),
                    Text(
                      'Blog Store ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          if (blogController.blogs.isEmpty) {
            // If the list is empty, fetch blogs
            blogController.fetchBlogs();
            return Center(child: CircularProgressIndicator());
          } else {
            // If the list is not empty, display the list
            return ListView.builder(
              itemCount: blogController.blogs.length,
              itemBuilder: (context, index) {
                BlogContent blog = blogController.blogs[index];
                return Card(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  color: Colors.amber,
                  child: ListTile(
                    title: Text(
                      blog.title ?? '',
                      style: GoogleFonts.bebasNeue(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Text(
                      blog.subTitle ?? '',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal)),
                    ),
                    onTap: () {
                      Get.to(() => BlogDetailScreen(blog: blog));
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


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hospital_blog_app/controllers/blog_list_controller.dart';
// import '../models/blog_list_model.dart';
// import 'blog_details_screen.dart';
// import 'blog_publish_screen.dart';

// class BlogListScreen extends StatelessWidget {
//   final BlogController blogController = Get.find(); // Get the existing instance
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Row(
//           children: [
//             Text('Blog List'),
//             SizedBox(width: 40),
//             Container(
//               height: 35,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   backgroundColor: Color.fromARGB(255, 13, 13, 14),
//                 ),
//                 onPressed: () async {
//                  // await blogController.fetchDataManually();
//                   Get.to(() => BlogPublishScreen());
//                 },
//                 child: Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.add, color: Colors.white)),
//                     Text(
//                       'Blog Store ',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: StreamBuilder<List<BlogContent>>(
//         stream: blogController.blogsStream,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<BlogContent> blogs = snapshot.data ?? [];
//             return ListView.builder(
//               itemCount: blogs.length,
//               itemBuilder: (context, index) {
//                 BlogContent blog = blogs[index];
//                 return Card(
//                   elevation: 10,
//                   shadowColor: Colors.grey,
//                   borderOnForeground: true,
//                   color: Colors.amber,
//                   child: ListTile(
//                     title: Text(
//                       blog.title ?? '',
//                       style: GoogleFonts.bebasNeue(
//                           textStyle: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                     subtitle: Text(
//                       blog.subTitle ?? '',
//                       style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.normal)),
//                     ),
//                     onTap: () {
//                      // Get.to(() => BlogDetailScreen(blog: blog));
//                      Get.off(() => BlogDetailScreen(blog: blog));
//                       print('Tapped on blog: ${blog.title}');
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
