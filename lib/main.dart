import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0 , 0];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){ //버튼 눌렀을때 마다 실행
            print(a);
            setState(() {
              a++;
            });
          },
        ),
        appBar: AppBar(
          title: Text('위젯 공부')
          ),
        body: ListView.builder(
           itemCount: 3,
           itemBuilder: (context,i){ //일반적으로 c,i로 작명
             return ListTile(
               leading: Text(like[i].toString()),
               title:Text(name[i]),
               trailing:ElevatedButton(onPressed: (){
                 setState(() {
                   like[i]++;
                 });
               }, child: Text('좋아요')),
             ); //이 위젯이 3번 반복됨
           }
          ),
          bottomNavigationBar: bottomappbar()
      )
    );
  }
}

//나만의 위젯을 만드는 법
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text('안녕'),
    );
  }
}

class bottomappbar extends StatelessWidget {
  const bottomappbar({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.call),
          Icon(Icons.call),
          Icon(Icons.call),
        ],
      ),
    );
  }
}



// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: const Text('Rive Animation'),
//       centerTitle: true,
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             child: const Text('Simple Animation'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (context) => const SimpleAnimation(),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             child: const Text('Dancing Mascot'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (context) => const StateMachineMuscot(),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             child: const Text('Animation time control'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (context) => const StateTimeControl(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// class SimpleAnimation extends StatelessWidget {
//   const SimpleAnimation({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: const Text('Rive Animation'),
//       centerTitle: true,
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: RiveAnimation.network(
//               'https://public.rive.app/community/runtime-files/2191-4327-loader-solicitud-de-cuentas.riv',
//             ),
//           ),
//           Expanded(
//             child: RiveAnimation.asset(
//               'assets/dash_flutter_muscot.riv',
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// class StateMachineMuscot extends StatefulWidget {
//   const StateMachineMuscot({Key? key}) : super(key: key);
//
//   @override
//   _StateMachineMuscotState createState() => _StateMachineMuscotState();
// }
//
// class _StateMachineMuscotState extends State<StateMachineMuscot> {
//   Artboard? riveArtboard;
//   SMIBool? isDance;
//   SMITrigger? isLookUp;
//
//   @override
//   void initState() {
//     super.initState();
//     rootBundle.load('assets/dash_flutter_muscot.riv').then(
//           (data) async {
//         try {
//           final file = RiveFile.import(data);
//           final artboard = file.mainArtboard;
//           var controller =
//           StateMachineController.fromArtboard(artboard, 'birb');
//           if (controller != null) {
//             artboard.addController(controller);
//             isDance = controller.findSMI('dance');
//             isLookUp = controller.findSMI('look up');
//           }
//           setState(() => riveArtboard = artboard);
//         } catch (e) {
//           print(e);
//         }
//       },
//     );
//   }
//
//   void toggleDance(bool newValue) {
//     setState(() => isDance!.value = newValue);
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: const Text('Rive Animation'),
//       centerTitle: true,
//     ),
//     body: riveArtboard == null
//         ? const SizedBox()
//         : Column(
//       children: [
//         Expanded(
//           child: Rive(
//             artboard: riveArtboard!,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text('Dance'),
//             Switch(
//               value: isDance!.value,
//               onChanged: (value) => toggleDance(value),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         ElevatedButton(
//           child: const Text('Look up'),
//           onPressed: () => isLookUp?.value = true,
//         ),
//         const SizedBox(height: 12),
//       ],
//     ),
//   );
//
//
// }
//
// //여기가 스터디 코드
// class StateTimeControl extends StatefulWidget {
//   const StateTimeControl({Key? key}) : super(key: key);
//
//   @override
//   _StateTimeControl createState() => _StateTimeControl();
// }
//
// class _StateTimeControl extends State<StateTimeControl> {
//   Artboard? riveArtboard;
//   SMIBool? isDance; //dance 상태 제어 변수
//   SMITrigger? isLookUp; //look up 상태 제어 변수
//
//   @override
//   void initState() {
//     super.initState();
//     rootBundle.load('assets/dash_flutter_muscot.riv').then(
//           (data) async {
//         try {
//           final file = RiveFile.import(data);
//           final artboard = file.mainArtboard;
//           var controller =
//           StateMachineController.fromArtboard(artboard, 'birb');
//           if (controller != null) {
//             artboard.addController(controller);
//             isDance = controller.findSMI('dance');
//             isLookUp = controller.findSMI('look up');
//             isDance?.value = true; // 'Dance' 상태를 기본적으로 활성화
//           }
//           setState(() => riveArtboard = artboard);
//         } catch (e) {
//           print(e);
//         }
//       },
//     );
//   }
//
//   // 'stop dance' 버튼을 눌렀을 때 호출되는 함수
//   // 3초동안 멈췄다가 다시 춤추도록
//   void stopDance() {
//     if (isDance != null && isDance!.value) {
//       setState(() => isDance!.value = false); // 'Dance' 상태를 비활성화하여 춤을 멈춤.
//
//       // 3초 후에 다시 춤을 시작합니다.
//       Future.delayed(Duration(seconds: 3), () {
//         setState(() {
//           if (isDance != null) {
//             isDance!.value = true; // 'Dance' 상태를 다시 활성화하여 춤을 시작합니다.
//           }
//         });
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: const Text('Rive Animation'),
//       centerTitle: true,
//     ),
//     body: riveArtboard == null
//         ? const SizedBox()
//         : Column(
//       children: [
//         Expanded(
//           child: Rive(
//             artboard: riveArtboard!,
//           ),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//         const SizedBox(height: 12),
//         ElevatedButton(
//           child: const Text('Stop Dance'),
//           onPressed: () {
//           stopDance();
//           },
//         ),
//         const SizedBox(height: 12),
//         ElevatedButton(
//           child: const Text('Look up'),
//           onPressed: () => isLookUp?.value = true,
//         ),
//         const SizedBox(height: 12),
//       ],
//     ),
//   ]));
// }