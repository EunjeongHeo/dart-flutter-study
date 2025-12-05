void main() {
  print('필수 문제 2번');

  // 상품별 가격 정보
  const Map<String, int> productPrices = {
    '티셔츠': 10000,
    '바지': 8000,
    '모자': 4000,
  };

  // 장바구니 목록
  List<String> cart = ['티셔츠', '바지', '모자', '티셔츠', '바지'];

  // 총 금액 계산
  int totalPrice = calculateTotalPrice(cart, productPrices);
  print('장바구니에 ${totalPrice}원 어치를 담으셨네요 !');

  // 할인 금액 계산
  int discount = calculateDiscount(totalPrice);
  if (discount > 0) {
    print('할인 금액 : ${discount}원');
  }

  // 최종 결제 금액 계산
  int finalPrice = calculateFinalPrice(totalPrice, discount);
  print('최종 결제 금액은 ${finalPrice}원입니다!');
}

int calculateTotalPrice(List<String> cart, Map<String, int> prices) {
  int total = 0;
  for (var item in cart) {
    total += prices[item] ?? 0;
  }
  return total;
}

int calculateDiscount(int totalPrice) {
  if (totalPrice >= 20000) {
    return (totalPrice * 0.1).toInt();
  }
  return 0;
}

int calculateFinalPrice(int total, int discount) {
  return total - discount;
}
