// To parse this JSON data, do
//
//     final getallsoildetails = getallsoildetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Getallsoildetails getallsoildetailsFromJson(String str) =>
    Getallsoildetails.fromJson(json.decode(str));

String getallsoildetailsToJson(Getallsoildetails data) =>
    json.encode(data.toJson());

class Getallsoildetails {
  final Channel channel;
  final List<Feed> feeds;

  Getallsoildetails({
    required this.channel,
    required this.feeds,
  });

  factory Getallsoildetails.fromJson(Map<String, dynamic> json) =>
      Getallsoildetails(
        channel: Channel.fromJson(json["channel"]),
        feeds: List<Feed>.from(json["feeds"].map((x) => Feed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "channel": channel.toJson(),
        "feeds": List<dynamic>.from(feeds.map((x) => x.toJson())),
      };
}

class Channel {
  final String id;
  final String name;
  final String description;
  final String field1;
  final String field2;
  final String field3;
  final String field4;
  final String field5;
  final String field6;
  final String field7;
  final String field8;
  final String metadata;
  final String tags;
  final String externalSite;
  final String gitHub;
  final String elevation;
  final bool showLocation;
  final String latitude;
  final String longitude;
  final bool showVideo;
  final String videoUrl;
  final bool status;
  final bool isActive;
  final int interval;
  final DateTime created;
  final DateTime updated;

  Channel({
    required this.id,
    required this.name,
    required this.description,
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
    required this.field5,
    required this.field6,
    required this.field7,
    required this.field8,
    required this.metadata,
    required this.tags,
    required this.externalSite,
    required this.gitHub,
    required this.elevation,
    required this.showLocation,
    required this.latitude,
    required this.longitude,
    required this.showVideo,
    required this.videoUrl,
    required this.status,
    required this.isActive,
    required this.interval,
    required this.created,
    required this.updated,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        field1: json["field1"],
        field2: json["field2"],
        field3: json["field3"],
        field4: json["field4"],
        field5: json["field5"],
        field6: json["field6"],
        field7: json["field7"],
        field8: json["field8"],
        metadata: json["metadata"],
        tags: json["tags"],
        externalSite: json["externalSite"],
        gitHub: json["gitHub"],
        elevation: json["elevation"],
        showLocation: json["showLocation"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        showVideo: json["showVideo"],
        videoUrl: json["videoURL"],
        status: json["status"],
        isActive: json["isActive"],
        interval: json["interval"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "field1": field1,
        "field2": field2,
        "field3": field3,
        "field4": field4,
        "field5": field5,
        "field6": field6,
        "field7": field7,
        "field8": field8,
        "metadata": metadata,
        "tags": tags,
        "externalSite": externalSite,
        "gitHub": gitHub,
        "elevation": elevation,
        "showLocation": showLocation,
        "latitude": latitude,
        "longitude": longitude,
        "showVideo": showVideo,
        "videoURL": videoUrl,
        "status": status,
        "isActive": isActive,
        "interval": interval,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
      };
}

class Feed {
  final int id;
  final String channelId;
  final String field1;
  final String field2;
  final String field3;
  final String field4;
  final String field5;
  final String field6;
  final String field7;
  final String field8;
  final String elevation;
  final String latitude;
  final String longitude;
  final String status;
  final DateTime created;

  Feed({
    required this.id,
    required this.channelId,
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
    required this.field5,
    required this.field6,
    required this.field7,
    required this.field8,
    required this.elevation,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.created,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        id: json["id"],
        channelId: json["channelId"],
        field1: json["field1"],
        field2: json["field2"],
        field3: json["field3"],
        field4: json["field4"],
        field5: json["field5"],
        field6: json["field6"],
        field7: json["field7"],
        field8: json["field8"],
        elevation: json["elevation"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        status: json["status"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "channelId": channelId,
        "field1": field1,
        "field2": field2,
        "field3": field3,
        "field4": field4,
        "field5": field5,
        "field6": field6,
        "field7": field7,
        "field8": field8,
        "elevation": elevation,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
        "created": created.toIso8601String(),
      };
}
