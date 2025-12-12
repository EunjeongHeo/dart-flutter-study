import '../models/student_score.dart';

StudentScore? findStudentByName(
  List<StudentScore> students,
  String name,
) {
  if (!_hasStudent(students, name)) return null;
  return students.firstWhere((s) => s.name == name);
}

bool _hasStudent(List<StudentScore> students, String name) {
  return students.any((s) => s.name == name);
}
