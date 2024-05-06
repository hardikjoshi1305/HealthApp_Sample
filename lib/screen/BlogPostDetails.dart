import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/BlogPostController.dart';
import '../model/BlogPost.dart';

class BlogPostDetails extends StatelessWidget {
  final String blogId;

  BlogPostDetails({required this.blogId});

  @override
  Widget build(BuildContext context) {
    final blogPostController = Get.find<BlogPostController>();
    final blogPost = blogPostController.blogPosts.firstWhere(
          (post) => post.id == blogId,
      orElse: () => BlogPost(
        id: '',
        title: 'Not Found',
        summary: 'The blog post you are looking for does not exist.',
        imageUrl: '',
        content: '',
      ),
    );

    if (blogPost.id.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Not Found')),
        body: Center(child: Text('The blog post you are looking for does not exist.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Blog Post Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero widget for smooth image transition
            Hero(
              tag: blogPost.id,
              child: Image.network(
                blogPost.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250, // Fixed height for header image
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with style
                  Text(
                    blogPost.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 12),
                  // Summary
                  Text(
                    blogPost.summary,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  // Divider to separate header from content
                  Divider(),
                  // Full content of the blog post
                  Text(
                    blogPost.content,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
