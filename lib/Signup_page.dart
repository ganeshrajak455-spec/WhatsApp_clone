
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/Auth_service.dart';
import 'package:whatsapp/Custome_text_form_field.dart';
import 'package:whatsapp/Home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final AuthService _authService = AuthService();

Future<void> Signup() async {
  if(_formkey.currentState!.validate()){
    String reuslt = await _authService.signupUser(
      email: emailcontroller.text, 
      phone: phonecontroller.text, 
      password: passwordcontroller.text);
    debugPrint("Signup Success");
    Get.to(HomePage());
    Get.snackbar("Signup Success", "Success full",backgroundColor: Colors.blueGrey,colorText: Colors.white,);
  }else{
    debugPrint("Signup Field");
    Get.snackbar("Signup Field", " Signup Field",backgroundColor: Colors.blueGrey,colorText: Colors.black);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Form(
          key: _formkey,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Signup Form",style: GoogleFonts.bowlbyOneSc(fontSize: 20,color: Colors.amber),),
                  SizedBox(height: 30,),

                  CustomeTextFormField(
                    controller: emailcontroller,
                    hintText: "Email",
                    prefixIcon: Icons.email,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalied Email";
                      }
                      if(!value.contains("@")){
                        return "@";
                      }
                      return null;
                    }
                  ),

                  SizedBox(height: 20,),
                  CustomeTextFormField(
                    controller: phonecontroller,
                    hintText: "Phone",
                    prefixIcon: Icons.phone,
                    keyboardtype: TextInputType.numberWithOptions(),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalied Number";
                      }
                      if(value.length < 10){
                        return "Number must be 10 Number";
                      }
                      return null;
                    }
                  ),

                  SizedBox(height: 20,),
                  CustomeTextFormField(
                    controller: passwordcontroller,
                    hintText: "Password",
                    prefixIcon: Icons.password,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Invalied Password";
                      }
                      return null;
                    }
                  ),
                  
                  SizedBox(height: 30,),
                  SizedBox(width: double.infinity,child: ElevatedButton(onPressed: Signup, child: Text("data")),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
