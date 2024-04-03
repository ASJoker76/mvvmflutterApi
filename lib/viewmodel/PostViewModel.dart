import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:mvvmflutter/model/Response.dart';
import 'dart:convert';

// import '../model/Post.dart';

class PostViewModel extends ChangeNotifier {
  List<Response> _posts = [];
  final logger = Logger(); // Buat instance Logger
  List<Response> get posts => _posts;

  Future<void> fetchPosts() async {
    final url = 'https://dayoffapi.vercel.app/api';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      logger.d('Response data: $responseData'); // Mencetak responseData ke konsol log
      _posts = responseData.map((json) => Response.fromJson(json)).toList();
      notifyListeners();
    } else {
      logger.e('Failed to fetch posts: ${response.statusCode}');
    }
  }
}
