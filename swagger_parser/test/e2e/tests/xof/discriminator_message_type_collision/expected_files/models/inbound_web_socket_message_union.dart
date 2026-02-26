// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_log_entry_start_message.dart';
import 'activity_log_entry_start_message_message_type.dart';
import 'activity_log_entry_stop_message.dart';
import 'activity_log_entry_stop_message_message_type.dart';

part 'inbound_web_socket_message_union.freezed.dart';
part 'inbound_web_socket_message_union.g.dart';

@Freezed(unionKey: 'MessageType')
sealed class InboundWebSocketMessageUnion with _$InboundWebSocketMessageUnion {
  @FreezedUnionValue('ActivityLogEntryStart')
  const factory InboundWebSocketMessageUnion.activityLogEntryStart({
    @JsonKey(name: 'SessionId') required String sessionId,
  }) = InboundWebSocketMessageUnionActivityLogEntryStart;

  @FreezedUnionValue('ActivityLogEntryStop')
  const factory InboundWebSocketMessageUnion.activityLogEntryStop({
    @JsonKey(name: 'DurationTicks') required int durationTicks,
  }) = InboundWebSocketMessageUnionActivityLogEntryStop;

  factory InboundWebSocketMessageUnion.fromJson(Map<String, Object?> json) =>
      _$InboundWebSocketMessageUnionFromJson(json);
}
