class Onboarder {
  late String image;
  late String title;
  late String hint;

  static List<Onboarder> getOnboardingItems(
    List<String> titles,
    List<String> descs,
    List<String> images,
  ) {
    List<Onboarder> items = [];
    for (int i = 0; i < images.length; i++) {
      Onboarder obj = new Onboarder();
      obj.image = images[i];
      obj.title = titles[i];
      obj.hint = descs[i];
      items.add(obj);
    }
    return items;
  }
}
