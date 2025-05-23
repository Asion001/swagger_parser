// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_paginated_dto.freezed.dart';
part 'cursor_paginated_dto.g.dart';

@Freezed()
class CursorPaginatedDto with _$CursorPaginatedDto {
  const factory CursorPaginatedDto({
    required String? nextCursor,
    required String? previousCursor,
  }) = _CursorPaginatedDto;

  factory CursorPaginatedDto.fromJson(Map<String, Object?> json) =>
      _$CursorPaginatedDtoFromJson(json);
}
