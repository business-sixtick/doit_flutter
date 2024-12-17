import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 노티파이어, 프로바이더, 컨슈머

// 노티파이어
class PageNotifier extends StateNotifier<int>{
  PageNotifier() : super(1); // 초기화

  // 이전 , 다음 previous, next
  void setPage(int value) => state = value;

}

// 프로 바이더 (노티를 포함함함)
final pageProvider = StateNotifierProvider<PageNotifier, int>((ref) {
  return PageNotifier();
});

class TabBarEx  extends ConsumerWidget{ // 컨슈머머
  // TabController tabController = TabController(length: 2, vsync: this);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(pageProvider);
    debugPrint('debugPrint : TabBarEx');

    return DefaultTabController(
      length: 2,
      initialIndex: tabIndex,
      child: Scaffold(
        appBar: AppBar(title: const Text("탭바 테스트"),),
        bottomNavigationBar: TabBar(
          onTap: (index)=> ref.read(pageProvider.notifier).setPage(index),
          tabs: [
            Tab(icon:  Icon(Icons.home), text: 'Home',),
            Tab(icon:  Icon(Icons.settings), text: 'Settings',),
          ]
          ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(), // 스와이프 막음
          children: [
            FirstPage(),
            SecondPage(),
          ],
        ),
      ),
    ); // 뼈대를 이루는 위젯
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("첫번째 페이지"),
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("두번째 페이지"),
        ),
      ),
    );
  }
}