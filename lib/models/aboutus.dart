class AboutUs {
  final String? about_us, privacy_policy, terms_conditions;

  AboutUs({
    this.about_us,
    this.privacy_policy,
    this.terms_conditions,
  });

  factory AboutUs.fromJson(Map<String, dynamic> json) {
    //print(json);
    return AboutUs(
      about_us: json['about_us'] as String?,
      privacy_policy: json['privacy_policy'] as String?,
      terms_conditions: json['terms_conditions'] as String?,
    );
  }
}
