import 'package:napta/models/DiseasModel/Diseas.dart';
import 'package:napta/models/PostModel/PostModel.dart';
import 'package:napta/models/plantsModel/PlantModel.dart';
import 'package:napta/models/user/loginModel.dart';

abstract class AppStates {}

class AppIntialState extends AppStates {}

class GetListState extends AppStates {}

class ChangePlantStates extends AppStates {}

class ChangePlantList extends AppStates {}

class UserLoginLoading extends AppStates {}

class UserLoginSuccess extends AppStates {
  static String token;
  static String email;

  UserLoginSuccess(String str) {
    token = str;
  }
}

class UserLoginFailed extends AppStates {}

class ProfileLoading extends AppStates {
  static UserData userData;

  ProfileLoading(UserData user) {
    userData = user;
  }
}

class ProfileLoadingSuccess extends AppStates {
  static List<Plant> plants;

  ProfileLoadingSuccess(List<Plant> plantss) {
    plants = plantss;
  }
}

class InterestedPlantsUpdated extends AppStates {}

class UserDataUpdated extends AppStates {}

class RegisteredSuccessfully extends AppStates {}

class SelectNationalityState extends AppStates {}

class PasswordChangedSuccessfully extends AppStates {}

class PasswordVisibleState extends AppStates {}

class IncrementState extends AppStates {}

class DecrementState extends AppStates {}

class SelectPlantState extends AppStates {}

class PlansSuccessState extends AppStates {
  static int Id;

  PlansSuccessState(int id) {
    Id = id;
  }
}

class PostImagePickedSuccess extends AppStates {}

class PostImagePickedError extends AppStates {}

class GetPostsSuccessfullyState extends AppStates {
  static List<Post> posts;

  GetPostsSuccessfullyState(List<Post> theposts) {
    posts = theposts;

  }
}

class LikeIsPressedState extends AppStates {}

class PostCreatedSuccessState extends AppStates {}

class CommentUploadedSuccessfully extends AppStates {
  static List<Comment> comments;

  CommentUploadedSuccessfully(List<Comment> thecomments) {
    comments = thecomments;
  }
}

class CommentCreatedSuccessState extends AppStates {}

class PlanDescriptionSuccessState extends AppStates {}

class PostImageSelectedSuccessState extends AppStates {}

class DiseaseResultSuccessState extends AppStates {
  static Diseas disRes;

  DiseaseResultSuccessState(Diseas dd) {
    disRes = dd;
  }


}
class ImageUploadedSuccecssfully extends AppStates {}
class ImageNotRecognizedState extends AppStates {}

