// To parse this JSON data, do
//
//     final listAbsensi = listAbsensiFromJson(jsonString);

import 'dart:convert';

ListAbsensi listAbsensiFromJson(String str) =>
    ListAbsensi.fromJson(json.decode(str));

String listAbsensiToJson(ListAbsensi data) => json.encode(data.toJson());

class ListAbsensi {
  ListAbsensi({
    required this.meta,
    required this.data,
  });

  Meta meta;
  Data data;

  factory ListAbsensi.fromJson(Map<String, dynamic> json) => ListAbsensi(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.history,
  });

  User? user;
  List<History>? history;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "history": List<dynamic>.from(history!.map((x) => x.toJson())),
      };
}

class History {
  History({
    required this.id,
    required this.title,
    required this.code,
    required this.start,
    required this.end,
    required this.status,
    required this.eventId,
    required this.createdAt,
    required this.updatedAt,
    required this.place,
    required this.link,
    required this.desc,
  });

  int id;
  String title;
  String code;
  DateTime start;
  DateTime end;
  int status;
  int eventId;
  DateTime createdAt;
  DateTime updatedAt;
  String place;
  String link;
  String desc;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        title: json["title"],
        code: json["code"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        status: json["status"],
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        place: json["place"] == null ? null : json["place"],
        link: json["link"] == null ? null : json["link"],
        desc: json["desc"] == null ? null : json["desc"],
    );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "status": status,
        "event_id": eventId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "place": place == null ? null : place,
        "link": link == null ? null : link,
        "desc": desc == null ? null : desc,
    };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.roleId,
    required this.event,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int roleId;
  List<Event> event;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? ''
            : DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roleId: json["role_id"] ?? 2,
        event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role_id": roleId,
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.id,
    required this.name,
    required this.status,
    required this.structureId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.code,
  });

  int id;
  String name;
  int status;
  int structureId;
  dynamic createdAt;
  dynamic updatedAt;
  Pivot pivot;
  List<History> code;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        structureId: json["structure_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: Pivot.fromJson(json["pivot"]),
        code: List<History>.from(json["code"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "structure_id": structureId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot.toJson(),
        "code": List<dynamic>.from(code.map((x) => x.toJson())),
      };
}


class Pivot {
  Pivot({
    required this.userId,
    required this.eventId,
  });

  int userId;
  int eventId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        eventId: json["event_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "event_id": eventId,
      };
}

class Meta {
  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  int code;
  String status;
  dynamic message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
