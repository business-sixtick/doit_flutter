import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 노티파이어, 프로바이더, 컨슈머


class ListViewEx extends ConsumerWidget{
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      // scrollDirection: Axis.horizontal, // 리스트의 방향을 정할 수 있음. 
      itemBuilder: (context, position){
        return GestureDetector(  // 위젯에 제스쳐를 인식하게 함. 
          onTap: () => {
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text('알림'),
                content: Text('이것은 $position 입니다'),
                actions: [ // 없어도 됨됨
                  TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('close'),), 
                ],
              );
            })
          },
          child: Card(
            child: Text(position.toString()),
          ),
        );

      },
      itemCount: 10,
      );

  }
}