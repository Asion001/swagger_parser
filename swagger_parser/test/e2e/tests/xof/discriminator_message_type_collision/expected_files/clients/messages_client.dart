// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/inbound_web_socket_message_union.dart';

part 'messages_client.g.dart';

@RestApi()
abstract class MessagesClient {
  factory MessagesClient(Dio dio, {String? baseUrl}) = _MessagesClient;

  @GET('/messages')
  Future<List<InboundWebSocketMessageUnion>> getMessages();
}
