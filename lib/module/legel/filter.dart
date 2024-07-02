// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:weigh_master_legal_neww/animations/slide_animation.dart';
// import 'package:weigh_master_legal_neww/home_page.dart';

// class Filter extends StatefulWidget {
//   const Filter({super.key});

//   @override
//   State<Filter> createState() => _FilterState();
// }

// class _FilterState extends State<Filter> {
//    final Filter brand;

  
//   get isSelected => null;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             // New Button
//             Padding(padding: EdgeInsets.only(left: 15), child: Text('hello')),
//           ],
//         ),
//       ),


//      Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: Material(
//         color: const Color.fromARGB(255, 234, 234, 238),
//         borderRadius: BorderRadius.circular(10),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(10),
//           splashColor: Colors.grey,
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//             decoration: BoxDecoration(
//               color: isSelected ? Colors.grey : null,
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Text(
//                 'heloo',
//                 style: TextStyle(
//                     fontSize: 14,
//                     color: isSelected ? Colors.white : Colors.black),
//               ),
//             ),
//           ),
//           onTap: () async {},
//         ),
//       ),
//     );
//   }
// }
