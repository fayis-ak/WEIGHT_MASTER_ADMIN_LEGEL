// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weigh_master_admin/Data/db_service.dart';

// class ServicePage extends StatelessWidget {
//   const ServicePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DbService>(builder: (context, service, child) {
//       return FutureBuilder(
//           future: service.getServiceHistory(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             final data = service.serviceHistory;
//             return data.isEmpty
//                 ? const Center(
//                     child: Text("No Service Request"),
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
//                                   "Service Info.",
//                                   style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),

//                                 // Text(data[index].),
//                                 Text(
//                                   "Complaint: ${data[index].compalaint}",
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
//                                   "discription: ${data[index].buymodel.productModel.discription}",
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/service_model.dart';
import 'package:weigh_master_admin/module/admin/Data/db_service.dart';

class ServicePageLegel extends StatefulWidget {
  const ServicePageLegel({super.key});

  @override
  State<ServicePageLegel> createState() => _ServicePageLegelState();
}

class _ServicePageLegelState extends State<ServicePageLegel> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: [
          const Text(
            "Rented Products ",
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
                    future: service.getService(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: service.servicemap.length,
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
                                  if (service.servicemap[index]['status'] ==
                                      'Accept')
                                    Container(
                                      width: 90,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(service
                                                          .servicemap[index]
                                                      ['buymodel']
                                                  ['productModel']['image']))),
                                    ),
                                  Text('NOTE ACCEPT ADMIN'),
                                  if (service.servicemap[index]['status'] ==
                                      'Accept')
                                    Text(
                                        'PRODUCT NAME :${service.servicemap[index]['buymodel']['productModel']['name']}'),
                                  if (service.servicemap[index]['status'] ==
                                      'Accept')
                                    Text(
                                        'USER NAME :${service.servicemap[index]['name']}'),
                                  if (service.servicemap[index]['status'] ==
                                      'Accept')
                                    Text(
                                        'COMPLAINT ${service.servicemap[index]['compalaint']}')
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              )),
        ],
      ),
    ]);
  }
}
