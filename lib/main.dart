import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts(withThumbnails: false); //오래 걸리는 코드
      print(contacts[0].displayName); // 이름 담겨있음
      print(contacts[0].phones![0].value.toString()); // 번호 담겨있음

      for (int i=0; i<contacts.length; i++){
        setState(() {
          name[contacts[i].displayName.toString()]=contacts[0].phones![0].value.toString();
        });
      }

      var newPerson = new Contact(); //폰에 연락처 강제 추가(new 키워드 생략 가능)
      newPerson.givenName='송송';
      newPerson.familyName='최';
      ContactsService.addContact(newPerson);

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request(); // 허락해달라고 팝업 띄우는 코드
      openAppSettings(); //앱 설정 화면 켜줌
    }
  }

  var total = 3;
  Map<String, String> name= {};
  var like = [0, 0, 0];

  addOne(key, value) {
    if (key.length > 0) {
      setState(() {
        name[key] = value;
        print(name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var sortedName = Map.fromEntries(
        name.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('다이얼로그'),
          onPressed: () {
            //버튼 눌렀을때 마다 실행
            print(context.findAncestorWidgetOfExactType<
                MaterialApp>()); //조상중에 materialApp이 있으면 출력해주세요
            showDialog(
                context: context,
                barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                builder: (context) {
                  return DialogUI(addOne: addOne);
                });
          },
        ),
        appBar: AppBar(
          title: Text(total.toString()),
          actions: [
            IconButton(
                onPressed: () {
                  getPermission();
                },
                icon: Icon(Icons.contacts))
          ],
        ),
        body: ListView.builder(
            itemCount: sortedName.length,
            itemBuilder: (context, i) {
              //일반적으로 c,i로 작명
              String key = sortedName.keys.elementAt(i);
              return ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(key),
                subtitle: Text(sortedName[key].toString()),
                trailing: ElevatedButton(
                    child: Text("삭제"),
                    onPressed: () {
                      setState(() {
                        sortedName.remove(key);
                        name.remove(key);
                      });
                    }),
              ); //이 위젯이 3번 반복됨
            }),
        bottomNavigationBar: bottomappbar());
  }
}

class DialogUI extends StatefulWidget {
  DialogUI({Key? key, this.addOne}) : super(key: key);
  final addOne;

  @override
  State<DialogUI> createState() => _DialogUIState();
}

class _DialogUIState extends State<DialogUI> {
  var inputData1 = '';
  var inputData2 = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
                onChanged: (text) {
                  inputData1 = text;
                },
                decoration: InputDecoration(hintText: '이름')),
            TextField(
                onChanged: (text) {
                  inputData2 = text;
                },
                decoration: InputDecoration(hintText: '전화번호')),
          ]),
      actions: <Widget>[
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context); //창닫기
              },
            ),
            TextButton(
              child: Text('완료'),
              onPressed: () {
                widget.addOne(inputData1, inputData2);
                Navigator.of(context).pop(); //창닫기-세밀한 제어가능
              },
            ),
          ],
        ))
      ],
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
  const bottomappbar({Key? key}) : super(key: key);

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
