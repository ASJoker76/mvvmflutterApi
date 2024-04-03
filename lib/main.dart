import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/LiburNasionalView.dart';
import 'viewmodel/PostViewModel.dart';

void main() {
  runApp(MyAppNew());
}

class MyAppNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostViewModel(),
      child: MaterialApp(
        title: 'MVVM Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LiburNasionalView(),
      ),
    );
  }
}
