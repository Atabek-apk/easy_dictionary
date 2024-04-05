import 'dart:convert';

List<ChangeLanguage> changeLanguageFromJson(String str) =>
    List<ChangeLanguage>.from(
        json.decode(str).map((x) => ChangeLanguage.fromJson(x)));

String changeLanguageToJson(List<ChangeLanguage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChangeLanguage {
  String turkmen;
  String english;

  ChangeLanguage({
    required this.turkmen,
    required this.english,
  });

  factory ChangeLanguage.fromJson(Map<String, dynamic> json) => ChangeLanguage(
        turkmen: json["turkmen"],
        english: json["english"],
      );

  Map<String, dynamic> toJson() => {
        "turkmen": turkmen,
        "english": english,
      };
}
