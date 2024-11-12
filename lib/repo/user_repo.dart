import '../core.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isLoading = false.obs;
  List<User> userList = [];
  TextEditingController searchText = TextEditingController();
  final picker = ImagePicker();
  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  CroppedFile? cropImage;

  fetchUsers() async {
    try {
      isLoading.value = true;
      final response =
          await http.get(Uri.parse('https://dummyjson.com/users?'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['users'];
        var res = data.map((json) => User.fromJson(json)).toList();
        userList.addAll(res);
      } else {
        throw Exception('Failed to load users');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void onSearchTextChanged() {
    String query = searchText.text;

    var filteredUsers = userList
        .where((user) =>
            user.firstName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    userList = filteredUsers;
    print('USER LIST SEARCH :: $userList');
  }

  pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      cropImage = croppedFile;
      return cropImage;
    } else {
      return null;
    }
  }
}
