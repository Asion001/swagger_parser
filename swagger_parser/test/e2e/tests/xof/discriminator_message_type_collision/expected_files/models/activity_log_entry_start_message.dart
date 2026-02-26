// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_log_entry_start_message_message_type.dart';

part 'activity_log_entry_start_message.freezed.dart';
part 'activity_log_entry_start_message.g.dart';

@Freezed()
class ActivityLogEntryStartMessage with _$ActivityLogEntryStartMessage {
  const factory ActivityLogEntryStartMessage({
    @JsonKey(name: 'MessageType')
    required ActivityLogEntryStartMessageMessageType messageType,
    @JsonKey(name: 'SessionId') required String sessionId,
  }) = _ActivityLogEntryStartMessage;

  factory ActivityLogEntryStartMessage.fromJson(Map<String, Object?> json) =>
      _$ActivityLogEntryStartMessageFromJson(json);
}
