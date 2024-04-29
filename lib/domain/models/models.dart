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

// Login Models
class Customer {
  Customer(
    this.id,
    this.name,
    this.numOfNotifications,
  );

  String id;
  String name;
  int numOfNotifications;
}

class Contacts {
  Contacts(
    this.phone,
    this.email,
    this.link,
  );

  String phone;
  String email;
  String link;
}

class AuthObject {
  AuthObject(
    this.customer,
    this.contacts,
  );

  Customer? customer;
  Contacts? contacts;
}
