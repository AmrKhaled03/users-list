import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.name,
    required this.age,
    required this.email,
    required this.gender,
  }) : super(key: key);
  final String name;
  final int age;
  final String gender;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Username is $name",
                style: TextStyle(
                    color: gender == 'male' ? Colors.blue : Colors.pink,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Age is $age",
                  style: TextStyle(
                      color: gender == 'male' ? Colors.blue : Colors.pink,
                      fontSize: 30)),
              const SizedBox(
                height: 10,
              ),
              Text("Email is $email",
                  style: TextStyle(
                      color: gender == 'male' ? Colors.blue : Colors.pink,
                      fontSize: 20)),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Gender is $gender",
                style: TextStyle(
                    color: gender == 'male' ? Colors.blue : Colors.pink),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        gender == 'male' ? Colors.blue : Colors.pink),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back To  List ",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
