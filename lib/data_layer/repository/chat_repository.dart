

import 'package:banking_app/data_layer/db/cached_username_message.dart';
import '../db/local_database.dart';

class ChatRepository {

  ChatRepository({required this.localDatabase});

  final LocalDatabase localDatabase;


  Future<CachedUserMessageModel> insertMessage({required CachedUserMessageModel cachedUserMessageModel})async{
    return await LocalDatabase.insertCachedUserMessage(cachedUserMessageModel);
  }

  Future<List<CachedUserMessageModel>> getAllMessageText()async{
    return await LocalDatabase.getAllCachedUserMessage();
  }

  Future<int> clearAllMessage()async{
    return await LocalDatabase.deleteAllCachedUserMessage();
  }

}