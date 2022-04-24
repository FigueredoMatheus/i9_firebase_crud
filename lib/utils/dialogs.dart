import 'package:flutter/material.dart';

void dialogLoading(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Container(
          width: 160,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 5,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                message,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> dialogSuccess(BuildContext context, String title) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
        content: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
