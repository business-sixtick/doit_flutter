// import 'package:flutter_test/flutter_test.dart';



main(){
  var i = null; // 런타임 에러를 발생시킴. 컴파일 단계에서 걸리지 않으므로 매우 위험함. 
  // printInteger(i);
  printInteger(123);
}

printInteger(int num){
  print('the number is $num');
}

