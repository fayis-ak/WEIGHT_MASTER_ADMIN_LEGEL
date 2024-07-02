// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:weigh_master_legal_neww/constants/custom_colors.dart';
// import 'package:weigh_master_legal_neww/home_page_details.dart';
// import 'package:weigh_master_legal_neww/notification_page.dart';
// import 'package:weigh_master_legal_neww/ourcenter.dart';
// import 'package:weigh_master_legal_neww/rented_products.dart';
// import 'package:weigh_master_legal_neww/service.dart';
// import 'package:weigh_master_legal_neww/userproduct.dart';
// import 'package:weigh_master_legal_neww/warrantypage.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> items = [
//     "Home",
//     "Notifications",
//     "User Product",
//     "Rented Products",
//     "Warranty",
//     "Service",
//     "Our Center"
//   ];

//   List<Widget> pages = [
//     const HomePageDetails(),
//     const NotificationPage(),
//     const UserProduct(),
//     const RentedProducts(),
//     const WarrentyPage(), // Placeholder for Warranty page
//     const ServicePage(),
//     CenterPage(),
//   ];

//   int current = 0;
//   String currentFilter =
//       "normal"; // Add a variable to keep track of the current filter

// // Define a function to filter wonderful pages
//   bool filterPage(String filter, int index) {
//     switch (filter) {
//       case "search":
//         return index == 0;
//       case "buy":
//         return index == 2;
//       case "rent":
//         return index == 2;
//       case "lab":
//         return index == 3;
//       case "crane":
//         return index == 4;
//       case "gold":
//         return index == 2;
//       case "normal":
//         return true;
//       default:
//         return true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: CustomColors.backgroundGreen,
//         title: SizedBox(
//           height: 80,
//           child: ListView.separated(
//             separatorBuilder: (BuildContext context, int index) =>
//                 SizedBox(width: MediaQuery.of(context).size.width / 10),
//             physics: const BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               // Filter the items based on the current filter
//               if (!filterPage(currentFilter, index)) return Container();
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         current = index;
//                       });
//                     },
//                     child: Text(items.elementAt(index),
//                         style: TextStyle(
//                             color: current == index
//                                 ? Colors.blueGrey
//                                 : Colors.white70)),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Handle logout action
//             },
//             icon: const Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           DropdownButton<String>(
//             value: currentFilter,
//             onChanged: (String? newValue) {
//               setState(() {
//                 currentFilter = newValue!;
//               });
//             },
//             items: <String>[
//               'normal',
//               'search',
//               'buy',
//               'rent',
//               'lab',
//               'crane',
//               'gold'
//             ].map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               color: CustomColors.backgroundGreen,
//               child: pages[current],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weigh_master_admin/module/legel/home_page_details.dart';
import 'package:weigh_master_admin/module/legel/notification_page.dart';
import 'package:weigh_master_admin/module/legel/ourcenter.dart';
import 'package:weigh_master_admin/module/legel/rented_products.dart';
import 'package:weigh_master_admin/module/legel/service.dart';
import 'package:weigh_master_admin/module/legel/userproduct.dart';
import 'package:weigh_master_admin/module/legel/warrantypage.dart';

import '../admin/constants/custom_colors.dart';

class HomePageLegel extends StatefulWidget {
  const HomePageLegel({Key? key}) : super(key: key);

  @override
  State<HomePageLegel> createState() => _HomePageLegelState();
}

class _HomePageLegelState extends State<HomePageLegel> {
  List<String> items = [
    "Home",
    "Notifications",
    "User Product",
    "Rented Products",
    "Warranty",
    "Service",
    "Our Center"
  ];

  List<Widget> pages = [
    const HomePageDetailsLegel(),
    const NotificationPageLegel(),
    const UserProductLegel(),
    // const RentedProductsLegel(),
    const WarrentyPageLegel(),
    const ServicePageLegel(),
    CenterPageLegel(),
  ];

  int current = 0;
  String currentFilter = "normal";

  bool filterPage(String filter, int index) {
    switch (filter) {
      case "search":
        return index == 0;
      case "buy":
        return index == 2;
      case "rent":
        return index == 2;
      case "lab":
        return index == 3;
      case "crane":
        return index == 4;
      case "gold":
        return index == 2;
      case "normal":
        return true;
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundGreen,
        title: SizedBox(
          height: 80,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: MediaQuery.of(context).size.width / 10),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (!filterPage(currentFilter, index)) return Container();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Text(items.elementAt(index),
                        style: TextStyle(
                            color: current == index
                                ? Colors.blueGrey
                                : Colors.white70)),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle logout action
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          // const Filter(),
          // DropdownButton<String>(
          //   value: currentFilter,
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       currentFilter = newValue!;
          //     });
          //   },
          //   items: <String>[
          //     'normal',
          //     'search',
          //     'buy',
          //     'rent',
          //     'lab',
          //     'crane',
          //     'gold'
          //   ].map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          // ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: CustomColors.backgroundGreen,
              child: pages[current],
            ),
          ),
        ],
      ),
    );
  }
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Material(
        color: const Color.fromARGB(255, 234, 234, 238),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.grey,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey : null,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Filter Button',
                style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.white : Colors.black),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
        ),
      ),
    );
  }
}
