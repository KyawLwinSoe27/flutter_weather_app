class ConditionModel {
  String? text;
  String? icon;
  int? code;

  ConditionModel({
    required this.text,
    required this.icon,
    required this.code
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
    text: json["text"],
    icon: json["icon"],
    code: json["code"]
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code
  };

}