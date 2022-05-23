import 'dart:convert';

AddGameModel addGameModelFromJson(String str) => AddGameModel.fromJson(json.decode(str));

String addGameModelToJson(AddGameModel data) => json.encode(data.toJson());

class AddGameModel {
  AddGameModel({
    required this.msg,
  });

  String msg;

  factory AddGameModel.fromJson(Map<String, dynamic> json) => AddGameModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
