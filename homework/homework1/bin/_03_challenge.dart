import 'dart:math';

void main() {
  print('도전 문제\n');

  // 로또 번호 발급
  List<int> lottoNumbers = generateLottoNumbers();
  print('발급한 로또 번호  : $lottoNumbers\n');

  // 당첨 여부 확인
  List<int> winningNumbers = [9, 19, 29, 35, 37, 38];
  String result = checkWinning(lottoNumbers, winningNumbers);
  print('당첨 여부 : $result\n');

  // 로또 초기화
  lottoNumbers.clear();
  print('현재 발급한 로또 번호: $lottoNumbers');
}

List<int> generateLottoNumbers() {
  Random random = Random();
  Set<int> numbers = {};

  while (numbers.length < 6) {
    numbers.add(random.nextInt(45) + 1);
  }

  return numbers.toList();
}

String checkWinning(List<int> lotto, List<int> winning) {
  int matchCount = lotto.where((num) => winning.contains(num)).length;

  if (matchCount >= 5) return '1등';
  if (matchCount == 4) return '2등';
  if (matchCount == 3) return '3등';
  return '당첨 실패';
}
