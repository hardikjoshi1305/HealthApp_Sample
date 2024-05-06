import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/BlogPostItem.dart';
import '../controller/BlogPostController.dart';
class BlogPostList extends StatelessWidget {
  final BlogPostController blogPostController = Get.put(BlogPostController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (blogPostController.isLoading.value) {
        return Scaffold(
          appBar: AppBar(title: Text('Blog Posts')),
          body: Center(child: CircularProgressIndicator()),
        );
      }

      return Scaffold(
        appBar: AppBar(title: Text('Blog Posts')),
        body: ListView.builder(
          itemCount: blogPostController.blogPosts.length,
          itemBuilder: (context, index) {
            final post = blogPostController.blogPosts[index];
            return BlogPostItem(post: post);
          },
        ),
      );
    });
  }
}
