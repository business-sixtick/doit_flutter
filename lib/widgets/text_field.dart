import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





// riverpod 상태관리 요소 3가지, 노티파이어, 프로바이더, 컨슈머위젯



class TextFieldEx extends ConsumerWidget{
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch()

    
    return Column(
      
      children: [
        SizedBox(height: 50,),
        Text('data'),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(keyboardType: TextInputType.number, controller: textEditingController,),
        ),
      ],
    );
  }
}
