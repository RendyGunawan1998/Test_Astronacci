import '../core.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final memo = GetStorage();
  var login = <LoginModel>[].obs;
  var isLoading = false.obs;

  addData(
      {required String first,
      required String last,
      required String email,
      required String phone,
      required String age,
      required String pass,
      required String user}) async {
    try {
      isLoading.value = true;
      final response =
          await http.post(Uri.parse('https://dummyjson.com/users/add'),
              body: json.encode({
                "firstName": first,
                "lastName": last,
                "age": age,
                "email": email,
                "phone": phone,
                "username": user,
                "password": pass
              }));
      print('RES REGIS :: ${response.statusCode}');
      if (response.statusCode == 201) {
        print('LOGIN REGIS');
        Get.snackbar('Success', "Account Created");
        Get.to(() => LoginScreen());
      } else {
        print('ERROR REGIS :: ${response.statusCode}');
        Get.snackbar('Fail', 'Failed to registration...');
        isLoading.value = true;
      }
    } catch (e) {
      print('ERROR REGIS :: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginAdmin() async {
    print('LOGIN');
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode({
          "username": "emilys",
          "password": "emilyspass",
          "expiresInMins": 60
        }),
      );
      print('RES LOGIN :: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('LOGIN SUCCESS');
        var res = json.decode(response.body);
        LoginModel data = LoginModel.fromJson(res);
        addDataLogin(model: data);
        Get.to(() => UserScreen());
      } else {
        print('ERROR LOGIN :: ${response.statusCode}');
        Get.snackbar('Fail', 'Failed to login...');
        isLoading.value = true;
      }
    } catch (e) {
      print('ERROR LOGIN :: $e');
    } finally {
      isLoading.value = false;
    }
  }

  addDataLogin({
    required LoginModel model,
  }) {
    print('CALL ADD DATA LOGIN');
    final data = LoginModel(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        id: model.id,
        username: model.username,
        email: model.email,
        firstName: model.firstName,
        lastName: model.lastName,
        gender: model.gender,
        image: model.image);
    memo.write('login', data.toJson());
  }

  updateDataLogin({
    required LoginModel model,
  }) async {
    print('CALL UPDATE DATA LOGIN');
    final storedData = memo.read<Map<String, dynamic>>('login');

    final mergeData = storedData ?? {};
    mergeData.addAll(model.toJson());
    await memo.write('login', mergeData);
    Get.to(() => ProfileScreen());
  }

  loadData() {
    final data = memo.read<Map<String, dynamic>>('login');
    // print('data load ::$data');
    if (data != null) {
      return LoginModel.fromJson(data);
    }
  }
}
