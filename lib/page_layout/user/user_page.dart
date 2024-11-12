import '../../core.dart';

class UserScreen extends StatefulWidget {
  UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    userController.fetchUsers();
  }

  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    userController.userList.clear();
    userController.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarUser(context),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            textFieldSearch('Search name...', userController.searchText, () {
              if (mounted) {
                setState(() {
                  userController.onSearchTextChanged();
                });
              }
            }, () {
              if (mounted) {
                setState(() {
                  refresh();
                });
              }
            }),
            Expanded(child: Obx(() {
              if (userController.isLoading.value == true) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    hbox(10),
                    Text('Loading...')
                  ],
                );
              } else {
                if (userController.userList.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_copy, size: 60),
                      hbox(10),
                      Text('No User File...'),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: userController.userList.length,
                    itemBuilder: (context, index) {
                      final user = userController.userList[index];
                      return cardData(user);
                    },
                  );
                }
              }
            })),
          ],
        ),
      ),
    );
  }
}
