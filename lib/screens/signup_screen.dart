import 'package:flutter/material.dart';
import '../components/actionbutton.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.1,
            vertical: 0,
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
             height: 28.42,
            ),
            Center(child: Image.asset('assets/carrot.png')),
            SizedBox(
              height: 100.21,
            ),
            Text('Signup' , style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight(600),
              color: Color(0xff030303)
            ),),
            SizedBox(
                height: 15,
              ),
            Text('Enter your credentials to continue' , style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff7C7C7C),
              ),),
              SizedBox(
                height: 30,
              ), 
              TextFormField(
                onTapOutside: (value){
                FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText: 'username',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE2E2E2)
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff53B175)
                    )
                  )
                )
              ),
               SizedBox(
                height: 30,
              ),
              TextFormField(
                onTapOutside: (value){
                FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE2E2E2)
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff53B175)
                    )
                  )
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                return 'Please enter your email';
                }

                if (!value.contains('@')) {
                return 'Please enter a valid email';
                }

                 return null;
                },
              ),
              SizedBox(
               height: 30,
              ),
              TextFormField(
                onTapOutside: (value){
                FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText: 'password',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE2E2E2)
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff53B175)
                    )
                  ),
                  suffix: Icon(Icons.visibility , color: Color(0xff7C7C7C),),
                  ),
                   validator: (value) {
                   if (value == null || value.isEmpty) {
                   return 'Please enter your password';
                  }

                   if (value.length < 8) {
                   return 'Password must be at least 8 characters';
                  }

                   return null;
                  },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('By continuing you agree to our ', style: TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: 14,
                      fontWeight: FontWeight(600),
                 
                    ),),
                    Text('Terms of Service', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight(600),
                      color: Color(0xff53B175),
                    ),),
                    
                  ],
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('and ', style: TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: 14,
                      fontWeight: FontWeight(600),
                 
                    ),),
                    Text('Privacy Policy', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight(600),
                      color: Color(0xff53B175),
                    ),),
                    
                  ],
                 ),
                SizedBox(
                 height: 30,
                ),

                PrimaryActionButton(
                 label: 'Sign Up',
                 onPressed: () {
                 Navigator.pushReplacementNamed(context, '/home');
                },
                ),
             SizedBox(
                height: 25,
               ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(
                'Already have an account?',
                 style: TextStyle(
                 color: Color(0xff181725),
                 fontSize: 14,
                 fontWeight: FontWeight.w600,
                ),
              ),

              InkWell(
                onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                ' login',
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff53B175),
              ),
           ),
        ),
       ],
       ),
          ],
          ),
        ),
      ) ,
    );
      
      
   
    
  }
}