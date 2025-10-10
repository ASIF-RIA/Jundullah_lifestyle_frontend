

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jundullha_lifestyle/controllers/auth_controller.dart';
import 'package:jundullha_lifestyle/views/screens/authentication_screens/register_screens.dart';

class LoginScreens  extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState()=>_LoginScreenState();
}
class _LoginScreenState extends State<LoginScreens>{
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  final AuthController _authController=AuthController();
  late String email;
  late String password;
  bool isLoading = false;


  loginUser() async{
    setState(() {
      isLoading=true;
    });
     await _authController.signInUsers(
       context:context,
       email:email,
       password:password,
     )
       .whenComplete( (){
        setState(() {
          isLoading=false;
          
        });

       });

        
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white.withValues(alpha: 0.10),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column ( 
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                       "Login Your Account",
                       style:GoogleFonts.getFont(
                         'Lato',
                         color:Color(0xFF0d120E),
                         fontWeight: FontWeight.bold,
                         letterSpacing: 0.2,
                         fontSize: 23,
                         ),
                      ),
                    Text(
                         "To Explore the world exclusives",
                         style:GoogleFonts.getFont(
                           'Lato',
                           color: Color(0xFF0d120E),
                           fontSize: 14,
                           letterSpacing: 0.2,
                           ),
                       ),
              
                       Image.asset('assets/images/Illustration.png',
                         width:200,
                         height:200
                          ),
              
                    Align(
                       alignment: Alignment.topLeft,
                       child: Text(
                         'Email',
                         style:GoogleFonts.getFont(
                           'Nunito Sans',
                           fontWeight: FontWeight.w600,
                           letterSpacing: 0.2,
                           ) ,
                        ),
                     ),
              
                    TextFormField(
                      onChanged:  (value){
                        email=value;
                      },
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'enter your email';
                          
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(9),
                             ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'enter your email',
                          labelStyle: GoogleFonts.getFont(
                             "Nunito Sans",
                             fontSize: 14,
                             letterSpacing: 0.1,
                            ),
              
                          prefixIcon:Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Image.asset(
                             'assets/icons/email.png',
                             width:20,
                             height: 20,
                              ),
                           )   
                       ) 
                    ),
              
              
                    SizedBox(
                        height:20,
                        ),
                    TextFormField(
                       onChanged:  (value){
                        password=value;
                      },
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'enter your password';
                          
                        }
                        else{
                          return null;
                        }
                      },
                       decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(9),
                             ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'enter your password   ',
                          labelStyle: GoogleFonts.getFont(
                             "Nunito Sans",
                             fontSize: 14,
                             letterSpacing: 0.1,
                             ),
              
                          prefixIcon:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/icons/password.png',
                              width:20,
                              height: 20,
                             ),
                           ),
              
                          suffixIcon: Icon(Icons.visibility),
              
                        )
                      ),
              
                    SizedBox(height: 20,),
              
                    InkWell(
                      onTap: ()async{
                        if(_formkey.currentState!.validate()){
                          loginUser();  
                        }
                        else{
                         
                        }
                      },
                      child: Container(
                         width: 319,
                         height: 50,
                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors:[ 
                               Color(0xFF102DE1),
                               Color(0xCC0D6EFF),
                               ],
                            ),
                         ),
                                  
                         child: Center(
                           child:isLoading? const CircularProgressIndicator(color: Colors.white,): Text(
                             'Sign in',
                             style: GoogleFonts.getFont(
                               'Lato',
                               fontSize: 17,
                               fontWeight:FontWeight.bold,
                               color:Colors.white, 
                               ),
                            ),
                         ),
                       ),
                    ),
                    SizedBox(
                      height: 20,
                      ),
              
                    Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                          Text(
                             'Need an Account?',
                             style: GoogleFonts.roboto(
                               fontWeight: FontWeight.w500,
                               letterSpacing: 1,
                               ),
                            ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                 MaterialPageRoute(builder: (context){
                                   return RegisterScreen();
                                   }
                                 )
                               );
                             },
                          
                          
                            child: Text(
                               'Sign Up',
                               style: GoogleFonts.roboto(
                                 color: Color(0xFF103DE5),
                                 fontWeight: FontWeight.bold,
                               ),
                            )
                            )
                        ],
                     )
                  ],
               ),
            ),
          ),
        ),
      )
    );
  }
}