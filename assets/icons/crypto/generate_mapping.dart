import 'dart:convert';
import 'dart:io';

void main() async {
  // Путь к текущей папке (где расположен скрипт)
  final directory = Directory.current;

  // Убедимся, что скрипт работает в нужной папке
  print('Working directory: ${directory.path}');

  // Список файлов в текущей папке
  final files = directory.listSync();

  // Результирующий маппинг
  final Map<String, String> mapping = {};

  // Обрабатываем каждый файл
  for (var file in files) {
    if (file is File && file.path.endsWith('.svg')) {
      // Имя файла
      final fileName = file.uri.pathSegments.last;

      // Ищем текст в скобках
      final match = RegExp(r'\((.*?)\)').firstMatch(fileName);
      if (match != null) {
        final key = match.group(1)!; // Текст в скобках
        mapping[key] = fileName;
      }
    }
  }

  // Путь к JSON-файлу (в той же папке)
  final jsonFile = File('${directory.path}/crypto_mapping.json');

  // Записываем результат в JSON
  await jsonFile.writeAsString(JsonEncoder.withIndent('  ').convert(mapping));

  print('Mapping saved to ${jsonFile.path}');
}
