import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/font_style.dart';

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({super.key});

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor:bgDarkColor,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search, color: whiteColor))
          ],
          leading: Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
          title: Text(
            'Beats',
            style: TextStyle(color: Colors.white),
            // style: ourStyle(size: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 100,
              // physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    tileColor: bgColor,
                    title: Text(
                      'Music Name',
                     style: ourStyle(size: 15, color: Colors.red),
                    ),
                    subtitle: Text(
                      'Artist Name',
                      style: ourStyle(size: 12),
                    ),
                    leading: Icon(
                      Icons.music_note,
                      color: whiteColor,
                      size: 32,
                    ),
                    trailing: Icon(
                      Icons.play_arrow,
                      color: whiteColor,
                      size: 26,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
