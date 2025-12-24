# Homework Todo App 구현

## 요구사항

- **프로젝트명:** `tasks`
- **초기 화면:** `HomePage`
- **상세 화면:** `ToDoDetailPage`
- **ToDoEntity 필드**
  - `title: String`
  - `description: String?`
  - `isFavorite: bool`
  - `isDone: bool`
- **필수 기능**
  - ToDo 없음 → 안내 카드 UI 표시
  - FAB 클릭 → BottomSheet 열기
  - title 입력 시 키보드 자동 포커스
  - title에서 엔터(줄바꿈 대신) → 저장 동작
  - description(세부정보 추가) 토글 표시
  - 저장 버튼: title 비어있으면 비활성화
  - ListView로 ToDo 리스트 표시
  - 완료/즐겨찾기 토글
  - 항목 탭 → 상세 화면 이동
  - 상세 화면에서 즐겨찾기 토글 시 목록에도 반영

## 📁 프로젝트 구조
```text
tasks/
 ├─ lib/
 │   ├─ main.dart                      # 앱 실행 진입점
 │   ├─ app.dart                       # MaterialApp 및 Theme 설정
 │   ├─ models/
 │   │   └─ todo_entity.dart           # ToDoEntity 모델
 │   ├─ pages/
 │   │   ├─ home_page.dart             # HomePage
 │   │   └─ todo_detail_page.dart      # ToDoDetailPage
 │   └─ widgets/
 │       ├─ no_todo_card.dart          # ToDo 없을 때 카드 UI
 │       ├─ todo_view.dart             # 리스트 아이템
 │       └─ add_todo_bottom_sheet.dart # ToDo 추가 BottomSheet
 ├─ assets/
 │   └─ images/
 │       └─ task.webp                  # 빈 화면 이미지
 ├─ pubspec.yaml
 └─ README.md
```

## 스크린샷

기본 흐름
<table> <tr> <td align="center"> <img width="232" height="500" alt="홈 화면" src="https://github.com/user-attachments/assets/2b840daf-f579-4f3c-96f1-547182386fe7" /> <br/> <sub>홈 화면</sub> </td> <td align="center"> <img width="228" height="500" alt="+버튼 클릭" src="https://github.com/user-attachments/assets/2f921da0-0c26-4370-b795-fa1982b7e6eb" /> <br/> <sub>+ 버튼 클릭</sub> </td> <td align="center"> <img width="225" height="500" alt="할 일 입력" src="https://github.com/user-attachments/assets/bd5d4f42-d116-47d4-b9fc-42e59616b89f" /> <br/> <sub>할 일 입력</sub> </td> </tr> </table>
할 일 관리
<table> <tr> <td align="center"> <img width="231" height="500" alt="할 일 목록" src="https://github.com/user-attachments/assets/f94140b0-a6d0-42bd-ab29-e2a12eeeb1a3" /> <br/> <sub>할 일 목록</sub> </td> <td align="center"> <img width="232" height="500" alt="할 일 목록 체크 완료" src="https://github.com/user-attachments/assets/9514e716-8fe7-4bfe-9df0-a70728183a2a" /> <br/> <sub>체크 완료</sub> </td> <td align="center"> <img width="232" height="500" alt="세부 화면" src="https://github.com/user-attachments/assets/5aa37daa-bff5-4af6-8396-b39f52b0516e" /> <br/> <sub>세부 화면</sub> </td> </tr> </table>