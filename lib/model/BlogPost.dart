import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPost {
   dynamic id;
   dynamic title;
   dynamic summary;
   dynamic imageUrl;
   dynamic content;

  BlogPost({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.content,
  });

   factory BlogPost.fromDocumentSnapshot(DocumentSnapshot doc) {
     final data = doc.data() as Map<String, dynamic>?;

     // Handle null values and provide default values if necessary
     final id = doc.id;
     final title = data?['title'] as String? ?? ''; // Default to empty string if null
     final summary = data?['summary'] as String? ?? ''; // Default to empty string if null
     final imageUrl = data?['imageUrl'] as String? ?? ''; // Default to empty string if null
     final content = data?['content'] as String? ?? ''; // Default to empty string if null

     return BlogPost(
       id: id,
       title: title,
       summary: summary,
       imageUrl: imageUrl,
       content: content,
     );
   }

}
