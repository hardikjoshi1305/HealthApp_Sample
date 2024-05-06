import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthapp/screen/BlogPostDetails.dart';

import '../model/BlogPost.dart';
class BlogPostItem extends StatelessWidget {
  final BlogPost post;

  BlogPostItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0, // Add shadow for depth
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with placeholder
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                post.imageUrl,
                fit: BoxFit.cover,
                height: 200, // Fixed height for uniformity
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  height: 200,
                  width: double.infinity,
                  child: Center(child: Icon(Icons.image_not_supported)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with style
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Limiting lines for better readability
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                  SizedBox(height: 8),
                  // Summary text
                  Text(
                    post.summary,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    maxLines: 3, // Limit lines for better readability
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                  SizedBox(height: 12),
                  // "Read More" button
                  ElevatedButton(
                    onPressed: () {
                      Get.to(()=>BlogPostDetails(blogId: post.id));
                    },
                    child: Text('Read More'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
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
