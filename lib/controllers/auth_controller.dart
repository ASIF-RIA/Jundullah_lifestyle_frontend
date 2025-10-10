import 'dart:convert';
//import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:jundullha_lifestyle/global_variables.dart';
import 'package:jundullha_lifestyle/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:jundullha_lifestyle/services/manage_http_responses.dart';
import 'package:jundullha_lifestyle/views/screens/authentication_screens/login_screens.dart';
import 'package:jundullha_lifestyle/views/screens/main_screen.dart';
class AuthController{
  Future<void>signUpUsers({
    required context,
    required String email,
    required String fullname,
    required String password,

   })async{
     try{
        User  user=User(
           id:'',
           fullname:fullname,
           email:email,
           state:'',
           city:'',
           locality:'',
           password:password,
           token: '',
           );
     http.Response response =  await http.post(Uri.parse('$uri/api/signup'),
        body:user.toJson(),//covert the user object to json for the request body
        headers: <String, String>{//set the headers for the request
        "Content-Type": 'application/json;charset=UTF-8',//specify the context type as json


        }
        );
        manageHttpResonse(
          response: response, 
          context: context, 
          onSuccess: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginScreens()));
            showSnackBer(context, 'Account has been Created for you');
          });
    }
    catch(e){
      print("Error:$e");
    }

  }
  //signin users function
  Future<void>signInUsers(
    {
      required context,
      required String email,
      required String password})async{
    try{
      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
       body:jsonEncode(
        {
          'email':email,
          'password':password,
        },
       ),
       headers:<String,String>{
        "Content-Type":'application/json; charset=UTF-8',
       });
       manageHttpResonse(
        response: response, 
        context: context, 
        onSuccess:(){
         Navigator.pushAndRemoveUntil(
         context, 
         MaterialPageRoute(builder: (context) =>  MainScreen()), 
         (route) =>false);
         showSnackBer(context, 'Logged In');
       });
       
    }
    catch(e){
      print("Error:$e");
    }
  }
}