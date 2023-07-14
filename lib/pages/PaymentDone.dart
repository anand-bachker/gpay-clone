import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gp/pages/TransactionHistory.dart';
import 'package:gp/services/customservices.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class PaymentDone extends StatefulWidget {
  const PaymentDone(
      {super.key,
      required this.amount,
      required this.name,
      required this.SSS,
      required this.pa});

  final String name;
  final String pa;
  final String amount;
  final bool SSS;

  @override
  State<PaymentDone> createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone> {
  // get current time
  DateTime now = DateTime.now();
  // generate random transaction id of length 12
  String transactionId = Random().nextInt(1000000000).toString() +
      Random().nextInt(100).toString();

  late AudioPlayer player;

  @override
  void initState() {
    super.initState();



    // add transaction to shared pref
    getListFromSharedPref().then((value) {
      List<dynamic> temp = value;
      temp.add({
        "name": widget.SSS?"":widget.name,
        "amount": widget.amount.replaceAll("₹", ""),
        "date": now.millisecondsSinceEpoch,
        "id": transactionId,
        "pa": widget.pa
      });
      saveListToSharedPref(temp);
    });
    

    player = AudioPlayer();
    player.setAsset('assets/audio/SuccSound.mp3');
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 49, 50, 56),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue[400],
                    )),
                Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    )),
                Icon(
                  Icons.check_circle_rounded,
                  color: Colors.blue[400],
                  size: 100,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "${widget.amount}.00",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Paid to ${widget.name}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            !widget.SSS
                ? const SizedBox()
                : const Text(
                    "Rahul",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(
              height: 80,
            ),
            Text(
              DateFormat('MMMM dd, yyyy').add_jm().format(now),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "UPI transaction ID: $transactionId",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 120,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => TransactionHistoryPage(
                              name: widget.name,
                            )));
              },
              child: Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Got it",
                      style: TextStyle(
                          color: Colors.blue[500],
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
