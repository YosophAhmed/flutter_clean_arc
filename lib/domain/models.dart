// onBoarding Models
class SliderObject {
  SliderObject(
    this.title,
    this.subTitle,
    this.image,
  );
  String title;
  String subTitle;
  String image;
}

class SliderViewObject {
  SliderViewObject({
    required this.sliderObject,
    required this.numberOfSlides,
    required this.currentIndex,
  });

  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;
}