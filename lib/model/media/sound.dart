import "package:flutter/services.dart";
import "package:soundpool/soundpool.dart";
class SoundService {
  Soundpool? pool;
  Soundpool? pool2;
  int? soundId;
  int? soundId2;
  SoundService() {
    init();
  }
  Future<void> init() async {
    pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
    soundId = await rootBundle
        .load("assets/sounds/mixkit-on-or-off-light-switch-tap-2585.wav") //your sound file name here
        .then((ByteData soundData) {
      return pool!.load(soundData);

    });
    pool2 = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

    soundId2 = await rootBundle
        .load("assets/sounds/mixkit-negative-tone-interface-tap-2569.wav") //your sound file name here
        .then((ByteData soundData2) {
      return pool2!.load(soundData2);
    });
  }
  playSound() {
    pool!.play(soundId!);
  }
  playSound2() {
    pool2!.play(soundId2!);
  }
}