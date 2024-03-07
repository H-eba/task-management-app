import 'package:flutter/material.dart';
import 'package:untitled1/ui/auth/componant/custom_text_form_field.dart';
import 'package:untitled1/ui/auth/login_screen.dart';
import 'package:untitled1/ui/auth/myValidations.dart';
import 'package:untitled1/ui/home/home.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = 'Register Screen';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFDFECDB),
        image: DecorationImage(
          image: AssetImage("assets/images/back_ground_auth.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('create account'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.23),
                    CustomTextFormField(
                      lable: 'user name',
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please enter user name';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      lable: 'Email',
                      keybordType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please enter email';
                        }

                        if (!MyValidations.isValidEmail(text)) {
                          return "enter valid email";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      lable: 'Password',
                      keybordType: TextInputType.number,
                      controller: passwordController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please enter Password';
                        }
                        if (text.length < 6) {
                          return 'the password should be at least 6';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      lable: ' Confirm Password',
                      keybordType: TextInputType.number,
                      controller: confirmPasswordController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please enter Confirm Password';
                        }
                        if (text != passwordController.text) {
                          return 'Confirm password dose not matche password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5D9CEC)),
                          onPressed: () {
                            register();
                            Navigator.of(context).pushNamed(HomeScreen.routeName);
                          },
                          child: Text('create account',style: TextStyle(color: Colors.white,
                          fontSize: 20),)),
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    }, child: Text('aready have an account',
                    style: TextStyle(fontSize: 15),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      ///register
    }
  }
}
