// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../controllers/blog_list_controller.dart';
// import '../models/blog_list_model.dart';
// import '../utilities/values/colors.dart';
// import 'blog_details_screen.dart';
// import 'blog_publish_screen.dart';

// class BlogListScreen extends StatefulWidget {
//   const BlogListScreen({super.key});

//   @override
//   State<BlogListScreen> createState() => _BlogListScreenState();
// }

// class _BlogListScreenState extends State<BlogListScreen> {
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Row(
//           children: [
//             Text('Blog List'),
//             SizedBox(width:40),

//              Container(
            
//               height:35,
//                child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)
//                   ),
//                   backgroundColor: Color.fromARGB(255, 13, 13, 14),
               
//                 ),
//                       onPressed: () async {
//                         // Save the device when the save button is pressed
//                        Get.to(()=>BlogScreen());
//                       },
//                       child: Row(
//                         children: [
//                           IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.white,)),
//                           Text('Blog Store ',style: TextStyle(
//                             color: Colors.white
//                           ),),
//                         ],
//                       ),
                      
//                     ),
//              ),
//           ],
//         ),
//       ),
//       body: GetX<BlogController>(
//         init: BlogController(),
//         builder: (controller) {
//           if (controller.blogs.isEmpty) {
//             // If the list is empty, fetch blogs
//             controller.fetchBlogs();
//             return Center(child: CircularProgressIndicator());
//           } else {
//             // If the list is not empty, display the list
//             return ListView.builder(
//               itemCount: controller.blogs.length,
//               itemBuilder: (context, index) {
//                 BlogContent blog = controller.blogs[index];
//                 return Card(
//                   elevation: 10,
//                   shadowColor: Colors.grey,
//                   borderOnForeground: true,
//                   color: Colors.amber,
//                   child: ListTile(
//                     title: Text(blog.title ?? '',
//                     style:GoogleFonts.bebasNeue(
//                     textStyle: TextStyle(
                  
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold
                    
//                     ))
                    
//                     ),
//                     subtitle: Text(blog.subTitle ?? '',
                    
//                     style:GoogleFonts.roboto(
//                     textStyle: TextStyle(
                  
//                     fontSize: 20,
//                     fontWeight: FontWeight.normal
                    
//                     ))
//                     ),
//                     onTap: () {
//                        Get.to(() => BlogDetailScreen(blog: blog));
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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hospital_blog_app/controllers/blog_list_controller.dart';
// import 'package:hospital_blog_app/controllers/blog_list_controller.dart';

// import '../controllers/blog_list_controller.dart';
// import '../controllers/blog_list_controller.dart';
// import '../controllers/blog_list_controller.dart';
// import '../models/blog_list_model.dart';
// import 'blog_details_screen.dart';
// import 'blog_publish_screen.dart';
// class BlogListScreen extends StatelessWidget {
//    BlogListScreen({Key? key}) : super(key: key);
//    //final BlogController = Get.find<BlogController>();

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
//                   Get.to(() => BlogScreen());
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
//       body: Obx(
//         () {
//           final controller = Get.put(BlogController());

//           if (controller.blogs.isEmpty) {
//             // If the list is empty, fetch blogs
//             controller.fetchBlogs();
//             return Center(child: CircularProgressIndicator());
//           } else {
//             // If the list is not empty, display the list
//             return ListView.builder(
//               itemCount: controller.blogs.length,
//               itemBuilder: (context, index) {
//                 BlogContent blog = controller.blogs[index];
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
//                       Get.to(() => BlogDetailScreen(blog: blog));
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
//                   Get.to(() => BlogScreen());
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
//       body: Obx(
//         () {
//           if (blogController.blogs.isEmpty) {
//             // If the list is empty, fetch blogs
//             blogController.fetchBlogs();
//             return Center(child: CircularProgressIndicator());
//           } else {
//             // If the list is not empty, display the list
//             return ListView.builder(
//               itemCount: blogController.blogs.length,
//               itemBuilder: (context, index) {
//                 BlogContent blog = blogController.blogs[index];
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
//                       Get.to(() => BlogDetailScreen(blog: blog));
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
