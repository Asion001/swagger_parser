// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_log_entry_stop_message_message_type.dart';

part 'activity_log_entry_stop_message.freezed.dart';
part 'activity_log_entry_stop_message.g.dart';

@Freezed()
class ActivityLogEntryStopMessage with _$ActivityLogEntryStopMessage {
  const factory ActivityLogEntryStopMessage({
    @JsonKey(name: 'MessageType')
    required ActivityLogEntryStopMessageMessageType messageType,
    @JsonKey(name: 'DurationTicks') required int durationTicks,
  }) = _ActivityLogEntryStopMessage;

  factory ActivityLogEntryStopMessage.fromJson(Map<String, Object?> json) =>
      _$ActivityLogEntryStopMessageFromJson(json);
}
