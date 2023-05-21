import 'package:finalproject/model/user.dart';
import 'package:finalproject/service/user_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String error = "";
  late UserModel _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 350,
              child: Stack(
                children: [
                  Positioned(
                      top: 40,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        children: [
                          Image.asset("assets/image/splash_screen.png"),
                          Text(
                            "Woofye",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            _nameField(),
            SizedBox(height: 20),
            _nimField(),
            SizedBox(height: 20),
            _emailField(),
            SizedBox(height: 20),
            _usernameField(),
            SizedBox(height: 20),
            _passwordField(),
            SizedBox(height: 10),
            _registerButton(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Color(0xffAD8B73),
                    fontSize: 14.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xffF4BFBF),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return TextField(
      controller: _nameController,
      cursorColor: Color(0xffAD8B73),
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'name',
        labelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Iconsax.user,
          color: Color(0xffAD8B73),
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _nimField() {
    return TextField(
      controller: _nimController,
      cursorColor: Color(0xffAD8B73),
      decoration: InputDecoration(
        labelText: 'Nim',
        hintText: 'nim',
        labelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Iconsax.user,
          color: Color(0xffAD8B73),
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

Widget _emailField() {
    return TextField(
      controller: _emailController,
      cursorColor: Color(0xffAD8B73),
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@gmail.com',
        labelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Iconsax.user,
          color: Color(0xffAD8B73),
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextField(
      controller: _usernameController,
      cursorColor: Color(0xffAD8B73),
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'username',
        labelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Iconsax.user,
          color: Color(0xffAD8B73),
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: true,
      controller: _passwordController,
      cursorColor: Color(0xffAD8B73),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
        labelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Iconsax.lock,
          color: Color(0xffAD8B73),
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Color(0xffAD8B73),
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffAD8B73), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return MaterialButton(
      onPressed: () async {
        if (_nameController.text.isEmpty ||
            _nimController.text.isEmpty ||
            _usernameController.text.isEmpty ||
            _emailController.text.isEmpty ||
            _passwordController.text.isEmpty) {
          setState(() {
            error = "Please fill all the fields";
          });
          return;
        }

        UserModel user = UserModel(
            name: _nameController.text,
            nim: _nimController.text,
            username: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text);
        try {
          await userDatabaseHelper.createUser(user);
        } catch (e) {
          setState(() {
            error = e.toString();
          });
          return;
        }
        setState(() {
          error = "User Created";
        });
      },
      height: 45,
      color: Color(0xffAD8B73),
      child: Text(
        "Register",
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
