// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatConversation {

 String get id; List<String> get participants; String get lastMessage; DateTime? get lastMessageTime; String? get lastMessageSenderId; MessageStatus get lastMessageStatus; ConversationType get type; String? get title; List<String> get pinnedBy; Map<String, int> get unreadCount; Map<String, bool> get typing; DateTime? get createdAt;
/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatConversationCopyWith<ChatConversation> get copyWith => _$ChatConversationCopyWithImpl<ChatConversation>(this as ChatConversation, _$identity);

  /// Serializes this ChatConversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConversation&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.lastMessageStatus, lastMessageStatus) || other.lastMessageStatus == lastMessageStatus)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.pinnedBy, pinnedBy)&&const DeepCollectionEquality().equals(other.unreadCount, unreadCount)&&const DeepCollectionEquality().equals(other.typing, typing)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(participants),lastMessage,lastMessageTime,lastMessageSenderId,lastMessageStatus,type,title,const DeepCollectionEquality().hash(pinnedBy),const DeepCollectionEquality().hash(unreadCount),const DeepCollectionEquality().hash(typing),createdAt);

@override
String toString() {
  return 'ChatConversation(id: $id, participants: $participants, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, lastMessageSenderId: $lastMessageSenderId, lastMessageStatus: $lastMessageStatus, type: $type, title: $title, pinnedBy: $pinnedBy, unreadCount: $unreadCount, typing: $typing, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatConversationCopyWith<$Res>  {
  factory $ChatConversationCopyWith(ChatConversation value, $Res Function(ChatConversation) _then) = _$ChatConversationCopyWithImpl;
@useResult
$Res call({
 String id, List<String> participants, String lastMessage, DateTime? lastMessageTime, String? lastMessageSenderId, MessageStatus lastMessageStatus, ConversationType type, String? title, List<String> pinnedBy, Map<String, int> unreadCount, Map<String, bool> typing, DateTime? createdAt
});




}
/// @nodoc
class _$ChatConversationCopyWithImpl<$Res>
    implements $ChatConversationCopyWith<$Res> {
  _$ChatConversationCopyWithImpl(this._self, this._then);

  final ChatConversation _self;
  final $Res Function(ChatConversation) _then;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? participants = null,Object? lastMessage = null,Object? lastMessageTime = freezed,Object? lastMessageSenderId = freezed,Object? lastMessageStatus = null,Object? type = null,Object? title = freezed,Object? pinnedBy = null,Object? unreadCount = null,Object? typing = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageStatus: null == lastMessageStatus ? _self.lastMessageStatus : lastMessageStatus // ignore: cast_nullable_to_non_nullable
as MessageStatus,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConversationType,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pinnedBy: null == pinnedBy ? _self.pinnedBy : pinnedBy // ignore: cast_nullable_to_non_nullable
as List<String>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as Map<String, int>,typing: null == typing ? _self.typing : typing // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatConversation].
extension ChatConversationPatterns on ChatConversation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatConversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatConversation value)  $default,){
final _that = this;
switch (_that) {
case _ChatConversation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatConversation value)?  $default,){
final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> participants,  String lastMessage,  DateTime? lastMessageTime,  String? lastMessageSenderId,  MessageStatus lastMessageStatus,  ConversationType type,  String? title,  List<String> pinnedBy,  Map<String, int> unreadCount,  Map<String, bool> typing,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that.id,_that.participants,_that.lastMessage,_that.lastMessageTime,_that.lastMessageSenderId,_that.lastMessageStatus,_that.type,_that.title,_that.pinnedBy,_that.unreadCount,_that.typing,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> participants,  String lastMessage,  DateTime? lastMessageTime,  String? lastMessageSenderId,  MessageStatus lastMessageStatus,  ConversationType type,  String? title,  List<String> pinnedBy,  Map<String, int> unreadCount,  Map<String, bool> typing,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatConversation():
return $default(_that.id,_that.participants,_that.lastMessage,_that.lastMessageTime,_that.lastMessageSenderId,_that.lastMessageStatus,_that.type,_that.title,_that.pinnedBy,_that.unreadCount,_that.typing,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> participants,  String lastMessage,  DateTime? lastMessageTime,  String? lastMessageSenderId,  MessageStatus lastMessageStatus,  ConversationType type,  String? title,  List<String> pinnedBy,  Map<String, int> unreadCount,  Map<String, bool> typing,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that.id,_that.participants,_that.lastMessage,_that.lastMessageTime,_that.lastMessageSenderId,_that.lastMessageStatus,_that.type,_that.title,_that.pinnedBy,_that.unreadCount,_that.typing,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatConversation implements ChatConversation {
  const _ChatConversation({required this.id, required final  List<String> participants, this.lastMessage = '', this.lastMessageTime, this.lastMessageSenderId, this.lastMessageStatus = MessageStatus.sent, this.type = ConversationType.direct, this.title, final  List<String> pinnedBy = const [], final  Map<String, int> unreadCount = const {}, final  Map<String, bool> typing = const {}, this.createdAt}): _participants = participants,_pinnedBy = pinnedBy,_unreadCount = unreadCount,_typing = typing;
  factory _ChatConversation.fromJson(Map<String, dynamic> json) => _$ChatConversationFromJson(json);

@override final  String id;
 final  List<String> _participants;
@override List<String> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override@JsonKey() final  String lastMessage;
@override final  DateTime? lastMessageTime;
@override final  String? lastMessageSenderId;
@override@JsonKey() final  MessageStatus lastMessageStatus;
@override@JsonKey() final  ConversationType type;
@override final  String? title;
 final  List<String> _pinnedBy;
@override@JsonKey() List<String> get pinnedBy {
  if (_pinnedBy is EqualUnmodifiableListView) return _pinnedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pinnedBy);
}

 final  Map<String, int> _unreadCount;
@override@JsonKey() Map<String, int> get unreadCount {
  if (_unreadCount is EqualUnmodifiableMapView) return _unreadCount;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_unreadCount);
}

 final  Map<String, bool> _typing;
@override@JsonKey() Map<String, bool> get typing {
  if (_typing is EqualUnmodifiableMapView) return _typing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_typing);
}

@override final  DateTime? createdAt;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConversationCopyWith<_ChatConversation> get copyWith => __$ChatConversationCopyWithImpl<_ChatConversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatConversationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConversation&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.lastMessageStatus, lastMessageStatus) || other.lastMessageStatus == lastMessageStatus)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._pinnedBy, _pinnedBy)&&const DeepCollectionEquality().equals(other._unreadCount, _unreadCount)&&const DeepCollectionEquality().equals(other._typing, _typing)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_participants),lastMessage,lastMessageTime,lastMessageSenderId,lastMessageStatus,type,title,const DeepCollectionEquality().hash(_pinnedBy),const DeepCollectionEquality().hash(_unreadCount),const DeepCollectionEquality().hash(_typing),createdAt);

@override
String toString() {
  return 'ChatConversation(id: $id, participants: $participants, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, lastMessageSenderId: $lastMessageSenderId, lastMessageStatus: $lastMessageStatus, type: $type, title: $title, pinnedBy: $pinnedBy, unreadCount: $unreadCount, typing: $typing, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatConversationCopyWith<$Res> implements $ChatConversationCopyWith<$Res> {
  factory _$ChatConversationCopyWith(_ChatConversation value, $Res Function(_ChatConversation) _then) = __$ChatConversationCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> participants, String lastMessage, DateTime? lastMessageTime, String? lastMessageSenderId, MessageStatus lastMessageStatus, ConversationType type, String? title, List<String> pinnedBy, Map<String, int> unreadCount, Map<String, bool> typing, DateTime? createdAt
});




}
/// @nodoc
class __$ChatConversationCopyWithImpl<$Res>
    implements _$ChatConversationCopyWith<$Res> {
  __$ChatConversationCopyWithImpl(this._self, this._then);

  final _ChatConversation _self;
  final $Res Function(_ChatConversation) _then;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? participants = null,Object? lastMessage = null,Object? lastMessageTime = freezed,Object? lastMessageSenderId = freezed,Object? lastMessageStatus = null,Object? type = null,Object? title = freezed,Object? pinnedBy = null,Object? unreadCount = null,Object? typing = null,Object? createdAt = freezed,}) {
  return _then(_ChatConversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageStatus: null == lastMessageStatus ? _self.lastMessageStatus : lastMessageStatus // ignore: cast_nullable_to_non_nullable
as MessageStatus,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConversationType,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pinnedBy: null == pinnedBy ? _self._pinnedBy : pinnedBy // ignore: cast_nullable_to_non_nullable
as List<String>,unreadCount: null == unreadCount ? _self._unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as Map<String, int>,typing: null == typing ? _self._typing : typing // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
