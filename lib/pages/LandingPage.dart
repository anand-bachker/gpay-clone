// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gp/builder/mybuilder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gp/services/customservices.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(32, 33, 37, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),

              // Top Section

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: const Color.fromRGBO(48, 49, 53, 1),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1, color: Color.fromRGBO(81, 82, 86, 1)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          const SizedBox(
                            width: 150,
                            height: 50,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      saveListToSharedPref([]);
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/16825337?v=4'),
                    ),
                  ),
                ],
              ),

              // Top Section

              const SizedBox(
                height: 50,
              ),

              // First Image Section

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/FirstSection.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),

              // First Image Section

              const SizedBox(
                height: 10,
              ),

              // Actions section
              // grid 4x2

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 15,
                    shrinkWrap: true,
                    children: [
                      makeActionIcon(
                          context: context,
                          title: "Scan Any QR Code",
                          iconpath: "1.jpg",
                          onPressed: () async {
                            final qrcode =
                                await FlutterBarcodeScanner.scanBarcode(
                              "#ff6666",
                              "Cancel",
                              true,
                              ScanMode.QR,
                            );
                            parseUPI(context, qrcode);
                          }),
                      makeActionIcon(
                          context: context,
                          title: "Pay Contacs",
                          iconpath: "2.jpg",
                          onPressed: () {}),
                      makeActionIcon(
                          context: context,
                          title: "Pay phone number",
                          iconpath: "3.jpg",
                          onPressed: () {}),
                      makeActionIcon(
                          context: context,
                          title: "Bank Transfer",
                          iconpath: "4.jpg",
                          onPressed: () {}),
                      makeActionIcon(
                          context: context,
                          title: "Pay UPI ID or number",
                          iconpath: "5.jpg",
                          onPressed: () {}),
                      makeActionIcon(
                          context: context,
                          title: "Self transfer",
                          iconpath: "6.jpg",
                          onPressed: () {}),
                      makeActionIcon(
                          context: context,
                          title: "Pay bills",
                          iconpath: "7.jpg",
                          onPressed: () {}),
                      makeActionIcon(
                          context: context,
                          title: "Mobile Recharge",
                          iconpath: "8.jpg",
                          onPressed: () {}),
                    ]),
              ),

              // Actions section

              const SizedBox(
                height: 10,
              ),

              // My UPI section

              Card(
                color: const Color.fromRGBO(32, 33, 37, 1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1, color: Color.fromRGBO(81, 82, 86, 1)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 35,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Text(
                        'UPI ID: tipulala@upi',
                        style: TextStyle(color: Colors.white, fontSize: 11.8),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.copy,
                        size: 11.8,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

              // My UPI section

              const SizedBox(
                height: 10,
              ),

              // Recent People Transaction

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "People",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  children: [
                    makeRecentTransaction(
                        context: context,
                        name: "Shonty kumar",
                        image:
                            "https://avatars.githubusercontent.com/u/16825337?v=4"),
                    makeRecentTransaction(
                      context: context,
                      name: "Gaurav tiwari",
                    ),
                    makeRecentTransaction(
                      context: context,
                      name: "Tirkey Lala",
                    ),
                    makeRecentTransaction(
                      context: context,
                      name: "khachit madda",
                    ),
                    makeRecentTransaction(
                      context: context,
                      name: "Kishor Raj",
                    ),
                    makeRecentTransaction(
                      context: context,
                      name: "Omkar",
                    ),
                    makeRecentTransaction(
                      context: context,
                      name: "rajesh",
                    ),
                    makeRecentTransaction(
                      context: context,
                      name: "kiran",
                    ),
                  ],
                ),
              ),

              // Recent People Transaction

              const SizedBox(
                height: 20,
              ),

              // Recent Business Transaction

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Business",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      Card(
                        color: const Color.fromRGBO(60, 64, 67, 1),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color.fromRGBO(81, 82, 86, 1)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SizedBox(
                          width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.shopping_bag_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Explore',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  children: [
                    makeRecentTransaction(context: context, name: "Manish C.."),
                    makeRecentTransaction(
                        context: context, name: "Rahul"),
                    makeRecentTransaction(context: context, name: "Jiomart"),
                    makeRecentTransaction(context: context, name: "Amazon"),
                  ],
                ),
              ),

              // Recent Business Transaction

              const SizedBox(
                height: 30,
              ),

              // Bills Recharge Section

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Bills, Recharge and more",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "No bills due. Try Adding these",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),

              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                children: [
                  makeRecentTransaction(
                    context: context,
                    name: "Mobile\nRecharge",
                  ),
                  makeRecentTransaction(
                    context: context,
                    name: "DTH / Cable\nTV",
                  ),
                  makeRecentTransaction(
                    context: context,
                    name: "Electricity",
                  ),
                  makeRecentTransaction(
                    context: context,
                    name: "FASTag\nrecharge",
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () async {
                  var data = await getListFromSharedPref();
                  int sum = 0;
                  for (var i = 0; i < data.length; i++) {
                    sum += int.parse(data[i]['amount']);
                  }
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Total Amount"),
                        content: Text("Total Amount is $sum"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Ok"))
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  color: const Color.fromRGBO(32, 33, 37, 1),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 1, color: Color.fromRGBO(81, 82, 86, 1)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const SizedBox(
                    width: 100,
                    height: 35,
                    child: Center(
                      child: Text(
                        'See all',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),

              // Bills Recharge Section

              const SizedBox(
                height: 20,
              ),

              // Promotions Section

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Promotions",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                children: [
                  makeRecentTransaction(
                    context: context,
                    name: "Reawrds",
                  ),
                  makeRecentTransaction(
                    context: context,
                    name: "Offers",
                  ),
                  makeRecentTransaction(
                    context: context,
                    name: "Refferls",
                  ),
                  makeRecentTransaction(
                    context: context,
                    name: "Indi-Home",
                  ),
                ],
              ),

              // Promotions Section

              const SizedBox(
                height: 40,
              ),

              // History/Balance Section

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.history,
                        color: Colors.blue,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Show transaction history",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.blue,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Check bank balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),

              // History/Balance Section

              const SizedBox(
                height: 40,
              ),

              // Bottom Footer

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/BottomSection.jpg",
                    fit: BoxFit.fitWidth),
              ),

              // Bottom Footer

              // Footer Message

              const SizedBox(
                height: 40,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Showing business based on your location. learn more",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
