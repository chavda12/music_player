import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

 var playIndex = 0.obs;
 var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();

    checkPermission();
  }

  playSong(String? uri,index) async {
    try {
      playIndex.value = index;
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri ?? '')));
      audioPlayer.play();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  checkPermission() async {
    try {
      var permission = await Permission.storage.request();
      if (permission.isGranted) {
      } else {
        checkPermission();
      }
    } catch (e) {}
  }
}
