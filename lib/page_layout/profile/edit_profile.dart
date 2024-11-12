import 'dart:io';

import '../../core.dart';

class EditProfileScreen extends StatefulWidget {
  final LoginModel user;
  EditProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final LoginController loginController = Get.put(LoginController());
  final UserController userController = Get.put(UserController());
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  LoginModel? user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    first.text = user!.firstName;
    last.text = user!.lastName;
    email.text = user!.email;
    username.text = user!.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Edit Profile',
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 115,
                width: 115,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child:
                          // userController.pickedImage.value?.path != null
                          userController.cropImage?.path != null
                              ? Image.file(File(userController.cropImage!.path))
                              : Image.network(
                                  user!.image,
                                ),
                    ),
                    Positioned(
                        bottom: -5,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            await userController.pickImage();
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              hbox(20),
              textField('First Name', first),
              hbox(8),
              textField('Last Name', last),
              hbox(8),
              textField('Username', username),
              hbox(8),
              textField('Email', email),
              hbox(50),
              buttonBlue('Update', () {
                final udpateData = LoginModel(
                    accessToken: user!.accessToken,
                    gender: user!.gender,
                    id: user!.id,
                    refreshToken: user!.refreshToken,
                    username: username.text,
                    email: email.text,
                    firstName: first.text,
                    lastName: last.text,
                    image: userController.pickedImage.value == null
                        ? user!.image
                        : userController.pickedImage.value!.path);
                loginController.updateDataLogin(model: udpateData);
              })
            ],
          ),
        ),
      ),
    );
  }
}
