import 'package:just_audio/just_audio.dart';

//this must be showin in the terminal ((kheder )) Building with Flutter multidex support enabled.  in
//the first time he will ask you to enable multidex .. just press Y
class MySound {
  static final AudioPlayer audioPlayer = AudioPlayer();

  static Future<void> playAudio(String audioFilePath) async {
    try {
      await audioPlayer.setAsset(audioFilePath);
      await audioPlayer.play();
    } catch (e) {
      //print("Error playing audio: $e");
    }
  }
}
