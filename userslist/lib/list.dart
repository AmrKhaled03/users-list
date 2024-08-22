import 'package:flutter/material.dart';
import 'package:userslist/info.dart';

enum Gender { male, female }

enum Mode { dark, light }

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<Map<String, dynamic>> users = [
    {
      'name': "Amr",
      'age': 21,
      "email": "Amr@yahoo.com",
      'gender': "male",
    },
    {
      'name': "Adam",
      'age': 19,
      "email": "Adam@yahoo.com",
      'gender': "male",
    },
    {
      'name': "Alaa",
      'age': 21,
      "email": "Alaa@yahoo.com",
      'gender': "male",
    },
    {
      'name': "Sophia",
      'age': 20,
      "email": "Sophia@yahoo.com",
      'gender': "female",
    },
    {
      'name': "Sandra",
      'age': 15,
      "email": "Sandra@yahoo.com",
      'gender': "female",
    },
    {
      'name': "Ahmed",
      'age': 23,
      "email": "Ahmed@yahoo.com",
      'gender': "male",
    },
    {
      'name': "Mohamed",
      'age': 20,
      "email": "Mohamed@yahoo.com",
      'gender': "male",
    },
    {
      'name': "Safy",
      'age': 24,
      "email": "Safy@yahoo.com",
      'gender': "female",
    },
    {
      'name': "Ehab",
      'age': 10,
      "email": "Ehab@yahoo.com",
      'gender': "male",
    },
    {
      'name': "Omar",
      'age': 13,
      "email": "Omar@yahoo.com",
      'gender': "male",
    },
  ];
  Mode selectedMode = Mode.light;
  Gender? selectedGender;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            selectedMode == Mode.dark ? Colors.white : Colors.black,
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/564x/15/a4/35/15a4355d7b0039cbc51943f246bed34c.jpg"),
          ),
        ),
        title: Text(
          "Users List",
          style: TextStyle(
              color: selectedMode == Mode.dark ? Colors.black : Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (selectedMode == Mode.dark) {
                  selectedMode = Mode.light;
                } else {
                  selectedMode = Mode.dark;
                }
              });
            },
            icon: Icon(
              selectedMode == Mode.dark ? Icons.light_mode : Icons.dark_mode,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: selectedMode == Mode.dark ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ListView.separated(
            itemCount: users.length,
            separatorBuilder: (_, index) {
              return index % 2 == 0
                  ? const Divider(
                      height: 20,
                      thickness: 0.5,
                    )
                  : const SizedBox(
                      height: 20,
                    );
            },
            itemBuilder: (_, index) {
              Map user = users[index];
              Gender userGender =
                  user['gender'] == 'male' ? Gender.male : Gender.female;

              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    selectedGender = userGender;
                  });
                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  tileColor: selectedIndex == index
                      ? (selectedGender == Gender.male
                          ? Colors.blue
                          : Colors.pink)
                      : Colors.grey,
                  title: Text(
                    "${user['name']} [ ${index + 1} ]",
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text("${user['email']} ${user['age']} years",
                      style: const TextStyle(color: Colors.white)),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['gender'] == 'male'
                        ? 'https://i.pinimg.com/564x/e8/7a/b0/e87ab0a15b2b65662020e614f7e05ef1.jpg'
                        : 'https://i.pinimg.com/474x/87/ff/14/87ff14780b70043d7a2e2d21fcdb26c1.jpg'),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                  name: user['name'],
                                  age: user['age'],
                                  email: user['email'],
                                  gender: user['gender'])));
                    },
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
