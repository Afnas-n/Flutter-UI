import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/Models/post_model.dart';

class ApiCall {
  List<Post> parsePost(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      return parsePost(response.body);
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
