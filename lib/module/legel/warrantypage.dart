// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weigh_master_admin/Data/db_service.dart';

// class WarrentyPage extends StatelessWidget {
//   const WarrentyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DbService>(builder: (context, service, child) {
//       return FutureBuilder(
//           future: service.getWarrentyHistory(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             final data = service.warrentyHistory;
//             return data.isEmpty
//                 ? const Center(
//                     child: Text("No Warrenty Request"),
//                   )
//                 : ListView.separated(
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 30),
//                         decoration: const BoxDecoration(
//                             color: Color.fromARGB(255, 255, 249, 230)),
//                         // height: 100,
//                         width: MediaQuery.of(context).size.width / 2,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               "${index + 1} -",
//                               style: const TextStyle(
//                                   fontSize: 22, fontWeight: FontWeight.w500),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   "User Info.",
//                                   style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   "Name: ${data[index].name}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   "Email: ${data[index].email}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   "Contact Number: ${data[index].number}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   "Warrenty  Info.",
//                                   style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),

//                                 // Text(data[index].),
//                                 Text(
//                                   "Complaint: ${data[index].additionalComment}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   "Date: ${data[index].date}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   "Product Info.",
//                                   style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 // Text(data[index].),
//                                 Text(
//                                   "Product Name: ${data[index].buymodel.productModel.name}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   "Siscription: ${data[index].buymodel.productModel.discription}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) => const Divider(),
//                     itemCount: data.length);
//           });
//     });
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/warrenty_claim_model.dart';
import 'package:weigh_master_admin/module/admin/Data/db_service.dart';

class WarrentyPageLegel extends StatefulWidget {
  const WarrentyPageLegel({super.key});

  @override
  State<WarrentyPageLegel> createState() => _WarrentyPageLegelState();
}

class _WarrentyPageLegelState extends State<WarrentyPageLegel> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: [
          const Text(
            "Rented Products",
            style: TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: height / 1.2,
            width: width / 1.4,
            child: Consumer<DbService>(
              builder: (context, service, child) {
                return FutureBuilder(
                  future: service.getWarenty(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: service.warentymap.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.blueGrey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  width: 90,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          service.warentymap[index]['buymodel']
                                              ['productModel']['image']),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    'PRODUCT NAME:${service.warentymap[index]['buymodel']['productModel']['name']}'),
                                Text(
                                    'WARRANTY DATE:${service.warentymap[index]['buymodel']['productModel']['warrentyDate']}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ]);
  }
}
