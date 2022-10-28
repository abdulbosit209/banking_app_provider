

import 'package:banking_app/data_layer/db/cached_username_message.dart';
import 'package:banking_app/data_layer/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier{

  ChatViewModel({required this.chatRepository}){
    fetchMessages();
  }

  final ChatRepository chatRepository;
  bool isLoading = false;
  List<CachedUserMessageModel> texts = [];

  Future<CachedUserMessageModel> insertMessage({required CachedUserMessageModel cachedUserMessageModel})async{
    return await chatRepository.insertMessage(cachedUserMessageModel: cachedUserMessageModel);
  }

  Future<void> fetchMessages()async{
    notify(true);
    texts = await chatRepository.getAllMessageText();
    notify(false);
  }

  Future<void> deleteMessages()async{
    notify(true);
    await chatRepository.clearAllMessage();
    notify(false);
  }


  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}