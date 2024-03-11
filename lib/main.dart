import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions:[
            Icon(Icons.search, color: Colors.black,),SizedBox(width: 10),
            Icon(Icons.menu, color: Colors.black),SizedBox(width: 10),
            Icon(Icons.notifications_outlined, color: Colors.black), SizedBox(width: 10),],
          title: Row(
            children: [
              Text('금호동 3가', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              Icon(Icons.expand_more, color: Colors.black,)
            ],
          )
          ),
        body: Container(
          height: 150,
          padding: EdgeInsets.all(5),
          child: Row(
            children:[
              Flexible(flex:1, child: Image.asset('assets/dslr.jpg')),
              Flexible(flex:2, child:Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('캐논 DESLR 100D (단렌즈, 충전기, 16기가 SD 포함',
                      style:TextStyle(fontSize: 20)),
                    Text('지역 이름 • 끌올 10분 전', style: TextStyle(color: Colors.black38, fontSize: 12),),
                    Text('100000원', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite_border, color: Colors.black38, size: 20,),
                        Text('4', style: TextStyle(color: Colors.black38),),
                      ],
                    )
                  ],
                ),
              )),
            ]
          ),
        )
      )
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