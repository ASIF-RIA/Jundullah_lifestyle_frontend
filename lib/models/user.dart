import 'dart:convert';

class User{
  final String id;
  final String fullname;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;
  final String token;

  User({
    required this.id, 
    required this.fullname, 
    required this.email, 
    required this.state, 
    required this.city, 
    required this.locality, 
    required this.password,
    required this.token,
    });
  
  //Serialization:convert user object to a map
  //map:a map is a collection of key value pairs
  //why: converting to a map is an intermediate step that makes it easier to serialized
  //the object to formates like json for storage or transmission

  Map<String,dynamic>toMap(){
    return<String,dynamic>{
      "id":id,
      'fullname':fullname,
      'email':email,
      'state':state,
      'city':city,
      'locality':locality,
      'password':password,
      'token':token,
    };
  }

  //serialixation : convert map to a json String
  //this method directly encodes the data fron the map into a json string

  //the json.encode() function converts a dart object (such as map or list)
  //into  a json string representation, making it suitable for communication
  //between different system

  String toJson() =>json.encode(toMap());

  //Deserialization : convert a map to user object
  //purpus - manipulation and user: Once the data is converted a to a user object
  //it can be easily manipulated and use within the application .For example
  //We might want to display the user's fullname,email,ect on the UI. or we might
  //want to save the data locally.


  //The factory contructor takes a map (usually obtained form a json object)
  //and coverts it into a user object .if a field is not present in the
  //it defaults to an empty string.


  //forMap:this contructor take a Map<String,dynamic> and coverts into a User oblect
  //its usefull when you already have the data in map format
  factory User.fromMap(Map<String,dynamic>map){
    return User (
      id:map['_id'] as String? ??"",
      fullname:map['fullname'] as String? ??"",
      email:map['email'] as String? ??"",
      state:map['state'] as String? ??"",
      city:map['city'] as String? ??"",
      locality: map['locality'] as String? ??"",
      password: map['password '] as String? ??"",
      token: map['token '] as String? ??"",
    );
  }

  //fromJson: This factory contructor takes Json String ,and decodes into a Map<String,dynamic>
  //and then user fromMap to covert the Map into a user object

  factory User.fronJson(String source)=> User.fromMap(json.decode(source)as Map<String,dynamic>);
}