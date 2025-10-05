import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void manageHttpResonse({
  required http.Response response,//the http response fron the request
  required BuildContext context,//the context is show snackbar
  required VoidCallback onSuccess,//the callback to excute on a successfull response

})
{
  //Switch statement to handle different http status codes
  switch(response.statusCode){
    case 200://status code 200 indicates a successfull request
     onSuccess();
     break;

  case 400://status code 400 indicate bad request 
     showSnackBer(context, json.decode(response.body)['msg']);
      break;

  case 500://ststus code 500 indicates a server error
     showSnackBer(context, json.decode(response.body)['error']);
     break;

  case 201://status code 201 indicates a resourse was created successfully
     onSuccess();
     break;  

  }
}

void showSnackBer(BuildContext context,String title){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(title)));


}

