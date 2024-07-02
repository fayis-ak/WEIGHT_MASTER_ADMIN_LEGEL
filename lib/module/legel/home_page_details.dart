import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weigh_master_admin/module/admin/Data/db_service.dart';
import 'package:weigh_master_admin/module/admin/constants/custom_side_bar.dart';

import '../admin/constants/custom_colors.dart';

class HomePageDetailsLegel extends StatefulWidget {
  const HomePageDetailsLegel({super.key});

  @override
  State<HomePageDetailsLegel> createState() => _HomePageDetailsLegelState();
}

class _HomePageDetailsLegelState extends State<HomePageDetailsLegel> {
  List<String> items = [
    'Electronic',
    'Lab',
    'Crane',
    'Jewelry',
    'Counting',
    'kitchen',
    'Industrial',
    'Wheel'
  ];

  int current = 0;
  String currentFilter = "one";

  List<Widget> screenfilter = [
    One(),
    Two(),
    THree(),
    Four(),
    Five(),
    Six(),
    Seven(),
    Eight(),
  ];

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                              : Colors.white70,
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(),
                color: CustomColors.backgroundGreen,
              ),
              child: screenfilter[current],
            ),
          ),
        ],
      ),
    );
  }
}

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'Electronic')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}

class Two extends StatelessWidget {
  const Two({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'Lab')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}

class THree extends StatelessWidget {
  const THree({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'Crane')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}

class Four extends StatelessWidget {
  const Four({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'Jewelry')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}

class Five extends StatelessWidget {
  const Five({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'kitchen')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}

class Six extends StatelessWidget {
  const Six({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'Industrial')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}

class Seven extends StatelessWidget {
  const Seven({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'Industrial')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}

class Eight extends StatelessWidget {
  const Eight({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 1.3,
      child: Consumer<DbService>(builder: (context, service, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Product Data")
                .where('producttype', isEqualTo: 'Wheel')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 30),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: height / 3,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data[index]["image"]))),
                                ),
                                Text(
                                  data[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[index]["discription"]} (${data[index]["type"]})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data[index]["rate"].toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            });
      }),
    );
  }
}
