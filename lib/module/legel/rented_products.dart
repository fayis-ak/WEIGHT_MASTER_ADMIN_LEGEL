import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RentedProductsLegel extends StatefulWidget {
  const RentedProductsLegel({super.key});

  @override
  State<RentedProductsLegel> createState() => _RentedProductsLegelState();
}

class _RentedProductsLegelState extends State<RentedProductsLegel> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    3, // 3 items per rowdjust the aspect ratio as needed
              ),
              itemCount: 18,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ]
    );
  }
}
