import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:swagger_parser/swagger_parser.dart';
import 'package:test/test.dart';

void main() {
  group('nullable single-item xOf ref', () {
    late Directory tempDir;
    late File schemaFile;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp(
        'swagger_parser_nullable_single_item_xof_ref_',
      );

      schemaFile = File(p.join(tempDir.path, 'schema.yaml'));
      await schemaFile.writeAsString(r'''
openapi: 3.0.0
info:
  title: Nullable single-item xOf ref regression
  version: 1.0.0
paths: {}
components:
  schemas:
    DeviceProfile:
      type: object
      properties:
        name:
          type: string
    Container:
      type: object
      properties:
        deviceProfileAllOf:
          allOf:
            - $ref: '#/components/schemas/DeviceProfile'
          nullable: true
        deviceProfileOneOf:
          oneOf:
            - $ref: '#/components/schemas/DeviceProfile'
          nullable: true
        deviceProfileAnyOf:
          anyOf:
            - $ref: '#/components/schemas/DeviceProfile'
          nullable: true
''');
    });

    tearDown(() async {
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('generates nullable optional fields for single-item xOf refs',
        () async {
      final outputDir = p.join(tempDir.path, 'output');

      final config = SWPConfig(
        outputDirectory: outputDir,
        schemaPath: schemaFile.path,
        jsonSerializer: JsonSerializer.freezed,
        putClientsInFolder: true,
      );

      final processor = GenProcessor(config);
      await processor.generateFiles();

      final modelFile = File(p.join(outputDir, 'models', 'container.dart'));
      expect(modelFile.existsSync(), isTrue);

      final content = await modelFile.readAsString();

      expect(content, contains('DeviceProfile? deviceProfileAllOf'));
      expect(content, contains('DeviceProfile? deviceProfileOneOf'));
      expect(content, contains('DeviceProfile? deviceProfileAnyOf'));

      expect(content,
          isNot(contains('required DeviceProfile deviceProfileAllOf')));
      expect(content,
          isNot(contains('required DeviceProfile deviceProfileOneOf')));
      expect(content,
          isNot(contains('required DeviceProfile deviceProfileAnyOf')));
    });
  });
}
