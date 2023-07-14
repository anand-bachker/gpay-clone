import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:gp/pages/TransactionHistory.dart';

Widget makeActionIcon({
  required BuildContext context,
  required String title,
  required String iconpath,
  required Function() onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/$iconpath',
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ),
  );
}

Widget makeRecentTransaction(
    {required BuildContext context, required String name, String image = ''}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => TransactionHistoryPage(name: name)),
      );
    },
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image == ''
              ? Avatar(
                  name: name.toUpperCase(),
                  shape: AvatarShape.circle(
                    MediaQuery.of(context).size.width * 0.08,
                  ),
                )
              : CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.08,
                  backgroundImage: NetworkImage(image),
                ),
          const SizedBox(
            height: 7,
          ),
          Flexible(
            child: Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip),
            ),
          ),
        ],
      ),
    ),
  );
}
