import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napta/models/Fartlization/FartlizationModel.dart';
import 'package:napta/models/plantsModel/PlantModel.dart';
import 'package:napta/models/user/loginModel.dart';
import 'package:napta/modules/profile/profile.dart';
import 'package:napta/modules/update/nterstedPlants.dart';
import 'package:napta/shared/cubit/states.dart';
import 'package:napta/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<MyInterstedPlants> getMyInterstedPlants() {
    //emit(GetListState());
    return _myInterstedPlants;
  }

  static List<MyInterstedPlants> gettttttttttttttttttMyInterstedPlants() {
    //emit(GetListState());
    return _myInterstedPlants;
  }

  void changePlantStats({@required bool states, @required int index}) {
    _myInterstedPlants[index].plantStatus = states;
    emit(ChangePlantStates());
  }
 String SelectNationality(
   @required String SelectedNationality
     ){
    emit(SelectNationalityState());
    return SelectedNationality;
 }

 bool changePasswordVisablity(bool state){
    emit(PasswordVisibleState());
    return !state;
 }

  static List<MyInterstedPlants> _myInterstedPlants = [
    MyInterstedPlants(1, 'Tomato', false, "assets/images/tomato2.jpg"),
    MyInterstedPlants(2, 'Apple', false, ("assets/images/Apple.jpg")),
    MyInterstedPlants(3, 'Grape', false, ("assets/images/Grape.png")),
    MyInterstedPlants(7, 'Orange', false, ("assets/images/orange.jpg")),
    MyInterstedPlants(8, 'Soybean', false, ("assets/images/Soybean.jpg")),
    MyInterstedPlants(9, 'Squash', false, ("assets/images/Squash.jpg")),
    MyInterstedPlants(10, 'Potato', false, ("assets/images/Potato.jpg")),
    MyInterstedPlants(11, 'Corn', false, ("assets/images/Corn_(maize).jpg")),
    MyInterstedPlants(12, 'Strawberry', false, ("assets/images/Strawberry.jpg")),
    MyInterstedPlants(13, 'Peach', false, ("assets/images/Peach.jpg")),
    MyInterstedPlants(14, 'Blueberry', false, ("assets/images/Blueberry.jpg")),
    MyInterstedPlants(15, 'Cherry', false, ("assets/images/Cherry_(including_sour).jpg")),
    MyInterstedPlants(16, 'Pepper', false, ("assets/images/Pepper.jpg")),
    MyInterstedPlants(17, 'Raspberry', false, ("assets/images/Raspberry.jpg")),
  ];

  // void getPlants() {
  //   DioHelper.getData(url: '/api/plants', query: null).then((value) {
  //     //print(value.data.toString());
  //     Plantss = value.data;
  //     if (value.statusCode == 200) print("yeeeeeeeeeeeeeeeeeeeeeeees");
  //     print(Plantss);
  //   }).catchError((error) {
  //     print(error.data.toString());
  //   });
  // }
  static String userName;
  static List<Plant> Plants = [];
  static UserData userData;
  static String Token;


  void getPlants() {
    DioHelper.getData(
      url: 'api/userplants/plants?email=$userName',
    ).then((value) {
      List<dynamic> list = value.data;
      print("heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      List<Plant> plants = [];
      list.forEach((element) {
        plants.add(Plant.fromJson(element));
        print('${plants.last.Id} ${plants.last.Name}');
      });

      emit(ProfileLoadingSuccess(plants));
    }).catchError((error) {
      print(error.toString());
    });
  }


  void postPlants(
      {@required List<Map<String, dynamic>> plants}) {
    DioHelper.postPlant(
        url: 'api/userplants/addlist?email=$userName',
        data:plants
    ).then((value) {
      print(value.toString());
      emit(InterestedPlantsUpdated());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void putUser(
      {@required Map<String, dynamic> User}) {
    DioHelper.put(
      url: 'api/Users/update',
      data:User,
    ).then((value) {
      print(value.toString());
      emit(UserDataUpdated());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void postUser(
      {@required Map<String, dynamic> User}) {
    print('Post user data is  : $User');
    DioHelper.initialize();
    DioHelper.postUser(
        url: 'api/accounts/register',
        data:User,
        query: null
    ).then((value) {
      print(value.toString());
      emit(RegisteredSuccessfully());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(UserLoginLoading());
    DioHelper.postData(url: 'login', data: {
      'username': email,
      'password': password,
      'grant_type': 'password'
    }).then((value) {

      emit(UserLoginSuccess(value.data['access_token'].toString()));
    }).catchError((error) {
      emit(UserLoginFailed());
      print(error.data.toString());
    });
  }


  void changePassword({
    @required String oldPassword,
    @required String newpassword,
    @required String confirmPassword,
  }) {
    DioHelper.put(url: 'api/accounts/changepassword', data: {
      'oldPassword': oldPassword,
      'NewPassword': newpassword,
      'ConfirmPassword': confirmPassword
    }).then((value) {
      emit(PasswordChangedSuccessfully());
      print('ddddddddddddddddddddddddd');

      print(value.toString());
    }).catchError((error) {
      print(error.data.toString());
    });
  }

  void getUserData() {
    DioHelper.Token = Token;
    DioHelper.DoSomething();
    print('Token from get user data$Token');
    print('username = $userName');
    DioHelper.getData(
      url: 'api/users/getdata?email=$userName',
    ).then((value) {
      print(value.toString());
      UserData userData;
      userData = UserData.fromJson(value.data);
      emit(ProfileLoading(userData));
      // emit(ProfileLoadingSuccess());
    }).catchError((error) {
      print(error.toString());
    });
  }
  void getPlans(int plantID) {
    DioHelper.initialize();
    DioHelper.getFertPlans(
      url: 'api/PlansDescription/FertPlans?id=$plantID',
    ).then((value) {
      List<dynamic> list = value.data;
      print("Plaaaaaaaaaaaans");
      List<Plan> plans = [];
      list.forEach((element) {
        plans.add(Plan.fromJson(element));
        print('Week num : ${plans.last.FertQuntities.last.Quantity}');
      });

      //emit(ProfileLoadingSuccess(plants));
    }).catchError((error) {
      print(error.toString());
    });
  }

}



class MyInterstedPlants {
  String plantName;
  bool plantStatus;
  String plantImage;
  int id;

  MyInterstedPlants(id, plantName, plantStatus, plantImage) {
    this.plantName = plantName;
    this.plantStatus = plantStatus;
    this.plantImage = plantImage;
    this.id = id;
  }

}


