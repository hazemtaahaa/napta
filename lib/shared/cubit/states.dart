import 'package:napta/models/plantsModel/PlantModel.dart';
import 'package:napta/models/user/loginModel.dart';

abstract class AppStates{}
class AppIntialState extends AppStates{}
class GetListState extends AppStates{}
class ChangePlantStates extends AppStates{}
class ChangePlantList extends AppStates{}
class UserLoginLoading extends AppStates{}
class UserLoginSuccess extends AppStates{
   static String token;
   static String email;

   UserLoginSuccess(String str){
     token=str;
   }

}
class ProfileLoading extends AppStates{

  static UserData userData;
  ProfileLoading( UserData user){
    userData=user;
  }
}
class ProfileLoadingSuccess extends AppStates{
  static List<Plant> plants;
  ProfileLoadingSuccess(List<Plant> plantss){
    plants=plantss;
  }
}

class InterestedPlantsUpdated extends AppStates{}