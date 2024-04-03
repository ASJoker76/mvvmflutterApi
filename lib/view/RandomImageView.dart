import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../viewmodel/RandomImageViewModel.dart';

class RandomImageView extends StatefulWidget {
  @override
  _RandomImageViewState createState() => _RandomImageViewState();
}

class _RandomImageViewState extends State<RandomImageView> {
  final randomImageViewModel = RandomImageViewModel();
  Uint8List? imageData;

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    final bytes = await randomImageViewModel.getImageRandom();
    setState(() {
      imageData = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: Center(
        child: imageData != null
            ? Image.memory(imageData!)
            : CircularProgressIndicator(),
      ),
    );
  }
}
