import 'dart:io';

String readStudentName() {
  stdout.write('어떤 학생의 통계를 확인하시겠습니까? ');
  return stdin.readLineSync() ?? '';
}

void printInvalidName() {
  print('잘못된 학생 이름입니다.');
}
