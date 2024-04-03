import 'package:flutter/material.dart';
import 'package:mvvmflutter/view/RandomImageView.dart';
import 'package:provider/provider.dart';

import '../buttomsheet/CustomBottomSheet.dart';
import '../viewmodel/PostViewModel.dart';

class LiburNasionalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('CEK LIBUR NASIONAL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                postViewModel.fetchPosts();
                _showBottomSheet(context, postViewModel);
              },
              child: Text('Cek Libur Nasional'),
            ),
            SizedBox(height: 20), // Jarak antara tombol dan tombol berikutnya
            ElevatedButton(
              onPressed: () {
                // Navigasi ke view tujuan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RandomImageView()), // Ganti DestinationView() dengan view tujuan Anda
                );
              },
              child: Text('Pindah View Lain'),
            ),
          ],
        ),
      ),
    );
  }

  // Panggil kelas bottom sheet yang baru dibuat
  void _showBottomSheet(BuildContext context, PostViewModel postViewModel) {
    CustomBottomSheet.show(context, postViewModel);
  }
}
