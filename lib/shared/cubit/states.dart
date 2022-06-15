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
class UserLoginFailed extends AppStates{}
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

class UserDataUpdated extends AppStates{}
class RegisteredSuccessfully extends AppStates{}

class SelectNationalityState extends AppStates{}
class PasswordChangedSuccessfully extends AppStates{}
class PasswordVisibleState extends AppStates{}
class IncrementState extends AppStates{}
class DecrementState extends AppStates{}
class SelectPlantState extends AppStates{}
class PlansSuccessState extends AppStates{}