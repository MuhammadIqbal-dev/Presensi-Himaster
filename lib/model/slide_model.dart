class SliderModel {
  String? image;
  String? title;
  String? description;

// Constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String? getImage() {
    return image;
  }

  String? getTitle() {
    return title;
  }

  String? getDescription() {
    return description;
  }
}

// List created
List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

// Item 1
  sliderModel.setImage("assets/imgs/ob1.png");
  sliderModel.setTitle("Gak perlu lagi ribet absen manual!");
  sliderModel.setDescription("Dengan E-Presensi, kamu bisa absen dengan Ponsel Pintar kamu");
  slides.add(sliderModel);

  sliderModel = SliderModel();

// Item 2
  sliderModel.setImage("assets/imgs/ob2.png");
  sliderModel.setTitle("Tracking Keaktifan dan pantau jadwal kegiatan");
  sliderModel.setDescription("Simple, gak ribet dan selalu up-to-date!");
  slides.add(sliderModel);

  sliderModel = SliderModel();

// Item 3
  sliderModel.setImage("assets/imgs/ob3.png");
  sliderModel.setTitle("Asyik, mau absen gak bakalan kesusahan lagi!");
  sliderModel.setDescription("Yuk, login sekarang dan pakai aplikasi nya!");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  return slides;
}
