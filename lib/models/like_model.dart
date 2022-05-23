import 'dart:convert';

LikeIncrementModel likeIncrementModelFromJson(String str) => LikeIncrementModel.fromJson(json.decode(str));

String likeIncrementModelToJson(LikeIncrementModel data) =>
    json.encode(data.toJson());

class LikeIncrementModel {
  LikeIncrementModel({
    required this.msg,
  });

  String msg;

  factory LikeIncrementModel.fromJson(Map<String, dynamic> json) =>
      LikeIncrementModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
