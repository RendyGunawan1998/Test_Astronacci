import '../../core.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  final LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: ,),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(),
                hbox(40),
                textField('Username', user),
                hbox(8),
                textField('Password', pass),
                lupaPass(() {
                  Get.to(() => LupaPass());
                }),
                createAccount(() {
                  Get.to(() => RegistrationPage());
                }),
                hbox(10),
                buttonBlue('Login', () {
                  loginController.loginAdmin();
                  // Get.to(() => UserScreen());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
