# doit_flutter
이지스퍼블리싱에서 출간한 do it 플러터 앱프로그래밍 책을 읽으며 

## 플러터에 대해서
- 출시 : 2017년도
- 크로스 플랫폼 프레임워크 (모바일, 웹, 데스크탑, 임베디드)
- 렌더링 : 스키아(skia)엔진 사용(오픈소스 2D 그래픽 엔진). 모든 디바에스에서 같은 화면을 제공함. 

## 개발환경
- 운영체제 : 우분투
- IDE : VSCODE
- 프레임워크 : flutter --version. 다트 3.5, 플러터 3.24 https://docs.flutter.dev/get-started/install
- flutter create <프로젝트명> 또는 flutter create . (기존프로젝트에 추가)
- flutter doctor : 안드로이드 툴체인이 안되어있음. 나중에 안드로이드 스튜이도에서 에뮬레이터로 테스트할때 다시 체크해야함.
- sudo apt update
- sudo apt install default-jdk
- lib/main.dart 실행 또는 터미널에서 flutter run 실행


## git clone
- 터미널에서 git clone git@github.com:business-sixtick/doit_flutter.git
- doit_flutter 폴더가 생성되면서 복제된다.

## 수정되는 파일
- /lib/* :   개발 코드
- /test/* : 테스트 코드
- pubspec.yaml : 설정 파일

## 기술서
### 다트 Dart
- 2011년 10월 공개됨
- main() 에서 시작함. 
- 모든 객체는 Objact를 상속 받음. 
- ; 세미콜론을 사용함. 
- 타입이 나뉘어있지만 통합된 dynamic 키워드를 써서 여러가지 타입을 혼용해서 받을 수 있다. (null 허용)  var 키워드 ( null 허용 안함)
- <> 제네릭 타입을 지원한다
- ? : 삼항연산자를 지원한다. 
- 객체앞에 _ 를 붙이면 private 로 동작한다. 
- 널 안정성 ( null safety) 를 지원한다 . null 허용 하지 않으면 기본적으로 null 을 대입할 수 없다. 
- https://pub.dev/    ex> flutter pub add http
#### Dart 자료형
- int : 정수
- double : 실수
- num : 숫자
- String : 문자열
- bool : 논리
- var : 추론형 타입. null 불가. 타입 결정후 다른타입으로 변경불가
- dynamic : 추론형 타입. null 가능. 타입 결정 후 다른타입으로 변경 가능. 
- 널가능 타입 : int? 처럼 타입 뒤에 ? 를 붙이면 null 허용함. 
#### 비동기 처리
- 비동기 함수는 반환타입이 Future<> 이다.
- 함수명 뒤에 async 키워드를 붙인다. 
- 구현부에  await 키워드를 쓸 수 있다. await 붙으면 그위치에서 완료될때까지 대기하고 쓰레드를 넘김 
- 비동기 함수에 .then(콜백함수) 써서 반환값을 콜백함수로 처리 할 수 있다. 
#### Stream 
- import 'dart:async';
- async*
- yield
- await for(var value in stream){}


### 위젯 
- 화면을 구성하는 부속품
- main > runApp > Widget
- 스테이트리스(stateless) : 상태가 없는 위젯. 렌더링을 한번만 함.
- 스테이트풀(statefull) : 상태가 있는 위젯. 상태가 바뀌면 렌더링을 다시 함. 
-  Riverpod는 Provider보다 더욱 명확하고 안전하며, 유연하고 성능이 뛰어난 상태 관리 솔루션입니다.

### 상태관리 Riverpod 
```
import 'package:flutter_riverpod/flutter_riverpod.dart';  // 프로바이더를 개선한 상태관리

<!-- @override
  Widget build(BuildContext context) {
    return ProviderScope( // 최상위 위젯에 감싸줘야 됨.
      child: MaterialApp( -->

// 상태를 관리하는 Notifier
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
  // state = state + 1; 처럼 state 자체를 갱신해줘야 렌더링을 다시함. 
}

// Provider 생성
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

// 노티 없는 프로바이더
// final sliderProvider = StateProvider<double>((ref) => 50);
// (value)=> ref.read(sliderProvider.notifier).state = value  또는 state 대신 노티에서 제공하는 메서드를 쓸 수 도 있음.  

// Consumer에서 상태 사용
class MyWidget extends ConsumerWidget { // stateful위젯이아니라 ConsumerWidget를 상속받음
  @override
  Widget build(BuildContext context, WidgetRef ref) {  //
    final count = ref.watch(counterProvider); // 
    return Text('Count: $count');
  }
}
```

### 앱화면의 기본틀 MaterialApp(home : Scaffold)
```
Scaffod(
    appBar: AppBar(title: Text('타이틀')), // 화면 상단의 구성
    floatingActionButton : FloatingActionButton(child : Icon(Icons.add). onPressed: (){}), // 기본적으로 우하단에 떠있다. 거의 단일 화면 앱에서나 쓸까?
    body: Container(), // 화면 중앙 구성
    // 이외 하단메뉴 상단메뉴 등을 구성할 수 있다. 
);
```

### 저장소 
### 파이어베이스
### 네이티브 연동
