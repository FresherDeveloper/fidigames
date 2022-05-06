import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.msg,
        required this.apiKey,
    });

    String msg;
    String? apiKey;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        msg: json["msg"],
        apiKey: json["api-key"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "api-key": apiKey,
    };
}
