import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // input Controller
  TextEditingController introduceController = TextEditingController();
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    getIntroduceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.account_tree,
          color: Colors.orange,
          size: 32,
        ),
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "Flutter Test App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset('assets/img/main.jpg', fit: BoxFit.cover),
              ),
            ),
            // 이름
            Container(
              color: Colors.pink,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    color: Colors.lightGreenAccent,
                    width: 150,
                    child: Text(
                      "Name ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("TEST"),
                ],
              ),
            ),
            // 나이
            Container(
              color: Colors.pink,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    color: Colors.lightGreenAccent,
                    width: 150,
                    child: Text(
                      "Age ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("100"),
                ],
              ),
            ),
            // 취미
            Container(
              color: Colors.pink,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    color: Colors.lightGreenAccent,
                    width: 150,
                    child: Text(
                      "Hobby ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("Game"),
                ],
              ),
            ),
            // 직업
            Container(
              color: Colors.pink,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    color: Colors.lightGreenAccent,
                    width: 150,
                    child: Text(
                      "Job ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("Dev"),
                ],
              ),
            ),
            // MBIT
            Container(
              color: Colors.pink,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    color: Colors.lightGreenAccent,
                    width: 150,
                    child: Text(
                      "MBTI ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("MBIT"),
                ],
              ),
            ),
            // Introduce
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, left: 30),
                  child: Text(
                    "Introduce",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(right: 25),
                      child: Icon(Icons.mode_edit,
                          color: isEditMode == true ? Colors.red : Colors.black,
                          size: 28)),
                  onTap: () async {
                    if (isEditMode == false) {
                      setState(() {
                        isEditMode = true;
                      });
                    } else {
                      if (introduceController.text.isEmpty) {
                        // snackbar
                        var snackBar = SnackBar(
                          content: Text("Empty"),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setString(
                          'introduce', introduceController.text);

                      setState(() {
                        isEditMode = false;
                      });
                    }
                  },
                ),
              ],
            ),
            // Divider
            Container(
              width: 350,
              child: Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
            ),
            // Input Box
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: TextField(
                enabled: isEditMode,
                maxLines: 5,
                controller: introduceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffd9d9d9)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getIntroduceData() async {
    var sharedPref = await SharedPreferences.getInstance();
    String introduceMsg = sharedPref.getString('introduce').toString();
    introduceController.text = introduceMsg ?? "";
  }
}
