import 'dart:convert';

List<GameCategoryModel> gameCategoryModelFromJson(String str) =>
    List<GameCategoryModel>.from(
        json.decode(str).map((x) => GameCategoryModel.fromJson(x)));

String gameCategoryModelToJson(List<GameCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameCategoryModel {
  GameCategoryModel({
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

  factory GameCategoryModel.fromJson(Map<String, dynamic> json) =>
      GameCategoryModel(
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
