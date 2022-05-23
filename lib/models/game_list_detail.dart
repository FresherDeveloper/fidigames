import 'dart:convert';

GameListModel gameListDetailFromJson(String str) =>
    GameListModel.fromJson(json.decode(str));

String gameListDetailToJson(GameListModel data) => json.encode(data.toJson());

class GameListModel {
  GameListModel({
    required this.message,
    required this.data,
  });

  String message;
  List<GameDetail> data;

  factory GameListModel.fromJson(Map<String, dynamic> json) => GameListModel(
        message: json["message"],
        data: List<GameDetail>.from(
            json["data"].map((x) => GameDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GameDetail {
  GameDetail({
    required this.id,
    required this.gameName,
    required this.userId,
    required this.gameDescription,
    required this.gameUrl,
    required this.gameMinp,
    required this.gameMaxp,
    required this.gameCategory,
    required this.gameLikesCount,
    required this.gameImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String gameName;
  String userId;
  String gameDescription;
  String gameUrl;
  int gameMinp;
  int gameMaxp;
  String gameCategory;
  int gameLikesCount;
  String gameImageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory GameDetail.fromJson(Map<String, dynamic> json) => GameDetail(
        id: json["id"],
        gameName: json["game_name"],
        userId: json["UserId"],
        gameDescription: json["game_description"],
        gameUrl: json["game_url"],
        gameMinp: json["game_minp"],
        gameMaxp: json["game_maxp"],
        gameCategory: json["game_category"],
        gameLikesCount: json["game_likes_count"],
        gameImageUrl: json["game_image_url"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_name": gameName,
        "UserId": userId,
        "game_description": gameDescription,
        "game_url": gameUrl,
        "game_minp": gameMinp,
        "game_maxp": gameMaxp,
        "game_category": gameCategory,
        "game_likes_count": gameLikesCount,
        "game_image_url": gameImageUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
