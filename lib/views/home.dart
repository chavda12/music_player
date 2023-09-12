import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controller/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
    var controller = Get.put(PlayerController());
    return Material(
      child: Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor: bgDarkColor,
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.search, color: whiteColor))
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
        body: FutureBuilder<List<SongModel>>(
            future: controller.audioQuery.querySongs(
                ignoreCase: true,
                orderType: OrderType.ASC_OR_SMALLER,
                sortType: null,
                uriType: UriType.EXTERNAL),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return Center(
                    child: Text(
                  'No song found',
                  style: ourStyle(),
                ));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Obx(
                            () => ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              tileColor: bgColor,
                              title: Text(
                                snapshot.data![index].displayNameWOExt,
                                style: ourStyle(size: 15, color: Colors.red),
                              ),
                              subtitle: Text(
                                snapshot.data![index].artist ?? '',
                                style: ourStyle(size: 12),
                              ),
                              leading: QueryArtworkWidget(
                                  id: snapshot.data![index].id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: Icon(
                                    Icons.music_note,
                                    color: whiteColor,
                                    size: 32,
                                  )),
                              trailing: (controller.playIndex.value == index &&
                                      controller.isPlaying.value)
                                  ? Icon(
                                      Icons.play_arrow,
                                      color: whiteColor,
                                      size: 26,
                                    )
                                  : null,
                              onTap: () {
                                controller.playSong(
                                    snapshot.data![index].uri, index);
                              },
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
      ),
    );
  }
}
