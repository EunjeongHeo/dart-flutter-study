import 'dart:io';
import '../models/student_score.dart';

List<StudentScore> loadStudents(String path) {
  try {
    final file = File(path);

    _validateFileExists(file, path);

    final lines = file.readAsLinesSync();
    final students = <StudentScore>[];

    for (final line in lines) {
      if (!_isNonEmptyLine(line)) continue;

      final parts = _validateAndSplitCsvLine(line);
      
      final name = _parseName(parts[0]);
      final score = _parseScore(parts[1]);

      students.add(StudentScore(name, score));
    }

    return students;
  } catch (e) {
    print('데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
}

void saveResult(String path, String content) {
  try {
    final file = File(path);
    file.writeAsStringSync(content);
    print('결과 저장이 완료되었습니다.');
  } catch (e) {
    print('결과 저장에 실패했습니다: $e');
  }
}

void _validateFileExists(File file, String path) {
  if (!file.existsSync()) {
    throw FileSystemException('파일을 찾을 수 없습니다.', path);
  }
}

bool _isNonEmptyLine(String line) {
  return line.trim().isNotEmpty;
}

List<String> _validateAndSplitCsvLine(String line) {
  final parts = line.split(',');
  if (parts.length != 2) {
    throw FormatException('잘못된 데이터 형식', line);
  }
  return parts;
}

String _parseName(String value) {
  final name = value.trim();
  if (name.isEmpty) {
    throw FormatException('이름이 비어있습니다.');
  }
  return name;
}

int _parseScore(String value) {
  final score = int.tryParse(value.trim());
  if (score == null) {
    throw FormatException('숫자가 아닙니다.', value);
  }
  return score;
}
