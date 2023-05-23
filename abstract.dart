abstract class Media {
  void play() {
    print("Playing media...");
  }
}

class Song extends Media {
  late String artist;

  @override
  void play() {
    super.play();
    print("Playing song by $artist...");
  }
}

void main() {


  Song s = Song();
  s.artist = "The Weeknd";
  s.play();
}

