const String userNameMessageTable = "user_name";


class CachedUserMessageModelFields {
  static final List<String> values = [
    /// Add all fields
    sentMessage, time,
  ];
  static const String id = "_id";
  static const String sentMessage = "sent_message";
  static const String time = "time";


}

class CachedUserMessageModel {
  final int? id;
  final String sentMessage;
  final String time;


  CachedUserMessageModel({this.id, required this.sentMessage, required this.time});

  CachedUserMessageModel copyWith({
    int? id,
    String? sentMessage,
    String? time,
  }) => CachedUserMessageModel(id: id ?? this.id, sentMessage: sentMessage ?? this.sentMessage, time: time ?? this.time);

  static CachedUserMessageModel fromJson(Map<String, Object?> json) =>
      CachedUserMessageModel(
        id: json[CachedUserMessageModelFields.id] as int?,
        sentMessage: json[CachedUserMessageModelFields.sentMessage] as String,
        time: json[CachedUserMessageModelFields.time] as String,
      );

  Map<String, Object?> toJson() => {
    CachedUserMessageModelFields.id: id,
    CachedUserMessageModelFields.sentMessage: sentMessage,
    CachedUserMessageModelFields.time: time,
  };

  @override
  String toString() => '''
        time: $time
        sentMessage $sentMessage
      ''';
}