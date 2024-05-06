import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/BlogPost.dart';

class BlogPostController extends GetxController {
  var blogPosts = <BlogPost>[].obs;
  var isLoading = true.obs;

  BlogPostController() {
    fetchBlogPosts();
  }

  Future<void> fetchBlogPosts() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('blogPosts')
          .get();

      blogPosts.value = snapshot.docs.map((doc) {
        return BlogPost.fromDocumentSnapshot(doc);
      }).toList();

      isLoading.value = false;
    } catch (e) {
      print("Error fetching blog posts: $e");
      isLoading.value = false;
    }
  }
}
