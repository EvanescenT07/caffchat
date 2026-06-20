import 'package:caffchat/data/repositories/chat/firestore_chat_repository.dart';
import 'package:caffchat/domain/repositories/chat/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ChatRepository chatRepository(Ref ref) {
  return FirestoreChatRepository();
}
