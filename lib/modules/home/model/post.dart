import 'dart:convert';

List<ResponsePost> responsePostFromJson(String str) => List<ResponsePost>.from(json.decode(str).map((x) => ResponsePost.fromJson(x)));

String responsePostToJson(List<ResponsePost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponsePost {
    ResponsePost({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int? userId;
    int? id;
    String? title;
    String? body;

    factory ResponsePost.fromJson(Map<String, dynamic> json) => ResponsePost(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
    };
}
