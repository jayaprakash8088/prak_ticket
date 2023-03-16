import 'package:park_proj/app/utils/my_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppSharedPref{
   String token=tokenKey;
   String id=idKey;
   String venue=venueId;
   String venueValue=venueVal;
   String isLogged=logged;
   String shift=myShift;
   // save token
 Future saveToken(String value)async{
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   sharedPreferences.setString(token, value);
 }
 // get token
Future getToken()async{
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   return sharedPreferences.getString(token)??'';
}
   // save id
   Future saveId(String value)async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.setString(id, value);
   }
   // get token
   Future getId()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     return sharedPreferences.getString(id)??'';
   }

   // save venue
   Future saveVenue(String value)async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.setString(venue, value);
   }
   // get venue
   Future getVenue()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     return sharedPreferences.getString(venue)??'';
   }
   // save venue val
   Future saveVenueVal(String value)async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.setString(venueValue, value);
   }
   // get venue val
   Future getVenueVal()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     return sharedPreferences.getString(venueValue)??'';
   }
   // save logged in
Future saveLogged(bool val)async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setBool(isLogged, val);
}
   // get token
   Future getIsLogged()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     return sharedPreferences.getBool(isLogged)??false;
   }
   // save shift
   Future saveShift(String val)async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.setString(shift, val);
   }
   // get token
   Future getShift()async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     return sharedPreferences.getString(shift)??'';
   }
}