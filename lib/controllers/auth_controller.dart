import 'package:jundullha_lifestyle/global_variables.dart';
import 'package:jundullha_lifestyle/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:jundullha_lifestyle/services/manage_http_responses.dart';
class AuthConterller{
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
           password:password);
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
            showSnackBer(context, 'Account has been Created for you');
          });
    }
    catch(e){}

  }
}