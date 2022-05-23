import 'dart:convert';

LikeDecrementtModel likeDecrementtModelFromJson(String str) => LikeDecrementtModel.fromJson(json.decode(str));

String likeDecrementtModelToJson(LikeDecrementtModel data) =>
    json.encode(data.toJson());

class LikeDecrementtModel {
  LikeDecrementtModel({
    required this.msg,
  });

  String msg;

  factory LikeDecrementtModel.fromJson(Map<String, dynamic> json) =>
      LikeDecrementtModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
