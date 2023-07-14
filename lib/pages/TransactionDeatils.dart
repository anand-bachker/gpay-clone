import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key, required this.data});

  final Map data;

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 58, 59, 65),
      ),
      bottomSheet: Container(
        color: const Color.fromARGB(255, 58, 59, 65),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 54, 55, 58),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Having Issue?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 58, 59, 65),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Avatar(
                name: widget.data['name'],
                placeholderColors: const [
                  Colors.blue,
                  Colors.red,
                  Colors.green,
                  Colors.yellow,
                  Colors.purple,
                  Colors.orange,
                  Colors.pink,
                  Colors.teal,
                  Colors.cyan,
                  Colors.lime,
                  Colors.indigo,
                  Colors.brown,
                  Colors.grey,
                  Colors.blueGrey,
                ],
                shape: AvatarShape.circle(
                  40,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "To ${widget.data['name']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "₹${widget.data['amount']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Container(
                width: 160,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Split with friends",
                    style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Completed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                DateFormat('MMMM dd, yyyy').add_jm().format(
                    DateTime.fromMillisecondsSinceEpoch(widget.data['date'])),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.white,
                                width: 70,
                                height: 35,
                                child: Image.asset("assets/images/SBI.png"),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "State Bank of India ····2049",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "Savings Account",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 206, 206, 211),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Transform.rotate(
                            angle: -90 * math.pi / 180,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "UPI transaction ID\n${widget.data['id']}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "To ${widget.data['name']}\n${widget.data['pa']}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "From Ravish Kumar(State Bank of India)\nRavishKumar202@oksbi",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Google transaction ID\nCICAmPS-Z56_QO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
