import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:swagger_parser/swagger_parser.dart';
import 'package:test/test.dart';

void main() {
  group('enum + allOf default', () {
    late Directory tempDir;
    late File schemaFile;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp(
        'swagger_parser_enum_allof_default_',
      );

      schemaFile = File(p.join(tempDir.path, 'schema.yaml'));
      await schemaFile.writeAsString(r'''
openapi: 3.0.0
info:
  title: Enum allOf default regression
  version: 1.0.0
paths:
  /Items/{itemId}/Refresh:
    post:
      tags:
        - Items
      operationId: refreshItem
      parameters:
        - name: itemId
          in: path
          required: true
          schema:
            type: string
        - name: metadataRefreshMode
          in: query
          schema:
            enum: [None, ValidationOnly, Default, FullRefresh]
            allOf:
              - $ref: '#/components/schemas/MetadataRefreshMode'
            default: None
      responses:
        '204':
          description: no content
components:
  schemas:
    MetadataRefreshMode:
      type: string
      enum: [None, ValidationOnly, Default, FullRefresh]
''');
    });

    tearDown(() async {
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('generates enum-qualified retrofit default value', () async {
      final outputDir = p.join(tempDir.path, 'output');

      final config = SWPConfig(
        outputDirectory: outputDir,
        schemaPath: schemaFile.path,
        jsonSerializer: JsonSerializer.freezed,
        putClientsInFolder: true,
      );

      final processor = GenProcessor(config);
      await processor.generateFiles();

      final clientFile =
          File(p.join(outputDir, 'clients', 'items_client.dart'));
      expect(clientFile.existsSync(), isTrue);

      final content = await clientFile.readAsString();
      expect(
        content,
        contains(
          "@Query('metadataRefreshMode') MetadataRefreshMode? metadataRefreshMode = MetadataRefreshMode.none",
        ),
      );
      expect(content, isNot(contains(' metadataRefreshMode = None')));
    });
  });
}
