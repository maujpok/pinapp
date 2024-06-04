// Autogenerated from Pigeon (v19.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

class CommentModel {
  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;

  int id;

  String name;

  String email;

  String body;

  Object encode() {
    return <Object?>[
      postId,
      id,
      name,
      email,
      body,
    ];
  }

  static CommentModel decode(Object result) {
    result as List<Object?>;
    return CommentModel(
      postId: result[0]! as int,
      id: result[1]! as int,
      name: result[2]! as String,
      email: result[3]! as String,
      body: result[4]! as String,
    );
  }
}

class _CommentsApiCodec extends StandardMessageCodec {
  const _CommentsApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is CommentModel) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return CommentModel.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class CommentsApi {
  /// Constructor for [CommentsApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CommentsApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _CommentsApiCodec();

  final String __pigeon_messageChannelSuffix;

  Future<List<CommentModel?>> fetchComments(int postId) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.pinapp_challenge.CommentsApi.fetchComments$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[postId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as List<Object?>?)!.cast<CommentModel?>();
    }
  }
}
