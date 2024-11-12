import 'dart:io';

import '../../core.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LoginController loginController = Get.put(LoginController());
  final UserController userController = Get.put(UserController());
  LoginModel? user;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    user = await loginController.loadData();
    if (mounted) {
      setState(() {
        print('USER :: ${user!.image}');
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: InkWell(
            onTap: () {
              Get.offAll(() => UserScreen());
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'Profile',
        ),
      ),
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: userController.pickedImage.value?.path != null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(File(
                                      userController.pickedImage.value!.path)),
                                )
                              : Image.network(
                                  user!.image,
                                ),
                        ),
                      ),
                    ),
                    hbox(20),
                    Text('Name : ${user!.firstName} ${user!.lastName}'),
                    hbox(8),
                    Text('Gender : ${user!.gender}'),
                    hbox(8),
                    Text('Email : ${user!.email}'),
                    hbox(8),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: loading == true
          ? hbox(0)
          : Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: bottomButtonBlue('Edit Profile', () {
                Get.to(() => EditProfileScreen(
                      user: user!,
                    ));
              }),
            ),
    );
  }
}
