import 'package:flutter/material.dart';
import '../viewmodel/PostViewModel.dart';

class CustomBottomSheet {
  static void show(BuildContext context, PostViewModel postViewModel) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: Text('Libur Nasional'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: postViewModel.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = postViewModel.posts[index];
                  Icon icon;
                  if (post.isCuti) {
                    icon = Icon(Icons.check_circle, color: Colors.green);
                  } else {
                    icon = Icon(Icons.check_circle, color: Colors.red);
                  }
                  return ListTile(
                    leading: icon,
                    title: Text(post.tanggal + " " + post.keterangan),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
