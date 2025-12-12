import 'package:homework2/services/file_service.dart';
import 'package:homework2/services/student_service.dart';
import 'package:homework2/io/console_io.dart';

void main() {
  final students = loadStudents('students.txt');

  while (true) {
    final name = readStudentName();
    final student = findStudentByName(students, name);

    if (student == null) {
      printInvalidName();
      continue;
    }

    student.showInfo();
    saveResult(
      'result.txt',
      '이름: ${student.name}, 점수: ${student.score}',
    );
    break;
  }
}
