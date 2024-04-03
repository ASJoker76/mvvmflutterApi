import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class RandomImageViewModel extends ChangeNotifier {
  final logger = Logger();

  Future<Uint8List?> getImageRandom() async {
    final url = 'https://picsum.photos/300/300';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      logger.d('Image loaded successfully');
      return response.bodyBytes;
    } else {
      logger.e('Failed to fetch image: ${response.statusCode}');
      return null;
    }
  }
}
