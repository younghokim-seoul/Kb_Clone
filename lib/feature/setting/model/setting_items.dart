sealed class SettingItems {}

class Header extends SettingItems {}

class Body extends SettingItems {
  Body(this.displayItem);

  final Map<String, List<String>> displayItem;
}

final kbPayItems = [Header(), Body(kbPayDisplayMap)];
final cardPayItems = [Header(), Body(cardDisplayMap)];

const kbPayDisplayMap = {
  'KB Pay': ['계좌관리', '이용내역', '결제수단관리', '알파원카드', 'KB Pay 머니', '제휴멤버십', '해외현장결제'],
  '뱅킹': ['국내송금(오픈뱅킹)', '오픈뱅킹 등록'],
  '포인트': ['내 포인트', '적립 · 사용내역', '충전', '보내기', 'ATM출금', '교환 · 사용', '대금결제'],
  '자산관리': ['자산 분석', '마이데이터 관리', '금융상품', '목돈모으기', '자동모으기'],
  '소비관리': ['리포트', '우리동네', '내 신용 조회', '소비 분석'],
  '혜택쿠폰': ['혜택 ZONE', '해피오더', '쿠폰함'],
  '편의기능': ['간편결제 등록관리', '국민비서', '국민지갑'],
};

const cardDisplayMap = {
  '카드이용': ['카드이용내역', '이용실적·혜택', '이용한도'],
  '가족카드회원': ['가족카드 이용내역(매출전표)', '가족카드 이용한도', '이용한도'],
};
