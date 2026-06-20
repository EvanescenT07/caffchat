import 'package:caffchat/data/repositories/user/user_presence_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_presence_provider.g.dart';

@Riverpod(keepAlive: true)
UserPresenceService userPresence(Ref ref) {
  return UserPresenceService();
}
