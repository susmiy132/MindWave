import 'package:flutter/material.dart';
// import 'package:mindwave/View/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int result = 0;
  // String? _selectedOption;

  // use textEditing Controller

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  // step 1 key 
  final myKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade900
       ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white
                ),
                margin: EdgeInsets.all(26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/MindWavelogo.png',
                      height: 100,
                      width: 150,
                    ),
                  ],
                ),
              ),


              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: UnderlineInputBorder(),  // this line of code creates the underline of the text.
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade900)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)
                  )
                ),
                // keyboardType: TextInputType.numberWithOptions(
                // ),
                controller: emailcontroller,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please enter an email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "PhoneNumber",
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  )
                ),
                // keyboardType: TextInputType.numberWithOptions(),
                controller: phonenumbercontroller,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'please enter your number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade900)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)
                  ),
                ),
                // keyboardType: TextInputType.numberWithOptions(),
                controller: passwordcontroller,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade900)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)
                  ),
                ),
                // keyboardType: TextInputType.numberWithOptions(),
                controller: confirmpasswordcontroller,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'please enter a password';
                  }
                  return null;
                },
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
    
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => LoginScreen()),
                    //   );
                    if (myKey.currentState!.validate())
                    {
                      // Logic
                      int email = int.parse(emailcontroller.text);
                      int password = int.parse(passwordcontroller.text);
                      setState(() {
                        result = email + password;
                      }
                      );
                    }
                  }, 
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                  ),
              ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ]
              ),

            ],
          ),
        ),
      ),
    );
  }
}