class Splash {
  final int id;
  final String title;
  final String description;
  final String image;
  final String splash;

  Splash({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.splash,
  });

  factory Splash.fromJson(Map<String, dynamic> json) {
    return Splash(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      splash: json['splash'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'splash': splash,
    };
  }
}