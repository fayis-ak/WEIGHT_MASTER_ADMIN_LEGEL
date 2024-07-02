import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/buy_product_model.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/user_model.dart';
import 'package:weigh_master_admin/module/admin/Data/db_service.dart';

class UserProductLegel extends StatefulWidget {
  const UserProductLegel({super.key});

  @override
  State<UserProductLegel> createState() => _UserProductLegelState();
}

class _UserProductLegelState extends State<UserProductLegel> {
  bool orderList = true;
  UserModel? selectedUser;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // User
        Column(
          children: [
            const Text(
              'Users',
              style: TextStyle(
                  color: Color.fromARGB(255, 252, 251, 251), fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: height / 1.2,
                width: width / 6,
                child: Consumer<DbService>(
                  builder: (context, service, child) {
                    return StreamBuilder(
                      stream: service.getAllusers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<UserModel> userlist = [];

                        userlist = snapshot.data!.docs.map((e) {
                          return UserModel.fromJson(
                              e.data() as Map<String, dynamic>);
                        }).toList();
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemCount: userlist.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedUser = userlist[index];
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: selectedUser == userlist[index]
                                      ? Colors.blue
                                      : Colors.blueGrey,
                                  child: Column(
                                    children: [
                                      Text(userlist[index].name),
                                      Text(userlist[index].email),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ))
          ],
        ),

        Column(
          children: [
            const Text(
              "Customer Products",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: height / 1.2,
              width: width / 1.4,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  left: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              child: selectedUser == null
                  ? Center(
                      child: Text(
                        "Select a user to view details",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Consumer<DbService>(
                      builder: (context, service, child) {
                        final uid = selectedUser!.uid;
                        log('user uid ${selectedUser!.uid}');
                        return FutureBuilder(
                          future: service.getMyBroughtProduct(uid),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return service.userlistproMap.isEmpty
                                ? Center(
                                    child: Text('NO PRODUCT '),
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 3 / 2,
                                    ),
                                    itemCount: service.userlistproMap.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: Colors.blueGrey,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 90,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          service.userlistproMap[
                                                                      index][
                                                                  "productModel"]
                                                              ['image'],
                                                        ))),
                                              ),
                                              Text(
                                                'PRODUCT NAME:${service.userlistproMap[index]["productModel"]['name']}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'BYE DATE :${service.userlistproMap[index]["boughtDate"]}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'AMOUT ${service.userlistproMap[index]["totalAmount"].toString()}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
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
      ],
    );
  }
}
