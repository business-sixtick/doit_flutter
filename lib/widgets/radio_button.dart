import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 노티파이어, 프로바이더, 컨슈머
class RadioNotifier extends StateNotifier<int>{
  RadioNotifier(): super(0);
  void setState(value) => state = value;
}

final radioProvider = StateNotifierProvider<RadioNotifier, int>((ref) => RadioNotifier());
final checkBoxProvider = StateProvider<bool>((ref)=>false); // 노티 없는 제공자 딱히 별도 처리 없이 겟셋만 있을 경우에 씀씀
final sliderProvider = StateProvider<double>((ref) => 50);

class RadioButtonEx extends ConsumerWidget{ 

  @override
  Widget build(BuildContext context, WidgetRef ref) {  // 다시 그릴때 호출됨. 
    final radioIndex = ref.watch(radioProvider);
    final checkboxValue = ref.watch(checkBoxProvider);
    final sliderValue = ref.watch(sliderProvider);

    debugPrint('debugPrint : radioIndex $radioIndex, checkbox $checkboxValue, slider $sliderValue');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(value: 0, groupValue: radioIndex, onChanged: (index) => ref.read(radioProvider.notifier).setState(index)),
            const Text('일번'),
            Radio(value: 1, groupValue: radioIndex, onChanged: (index) => ref.read(radioProvider.notifier).setState(index)),
            const Text('이번'),
            Radio(value: 2, groupValue: radioIndex, onChanged: (index) => ref.read(radioProvider.notifier).setState(index)),
            const Text('삼번'),
            
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(value: checkboxValue, onChanged: (value)=> ref.read(checkBoxProvider.notifier).state = value ?? false, ),
            const Text('사랑해?'),
          ],  
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Slider(
            value: sliderValue, 
            onChanged: (value)=> ref.read(sliderProvider.notifier).state = value, 
            min: 10, 
            max: 100, 
            // divisions: 10,
            // label: sliderValue.toStringAsFixed(4), // 적용안되네
            ),
        ),
        Text('${sliderValue.toStringAsFixed(4)}'),
      ],
    );
  }
}