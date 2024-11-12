import '../../core.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  final LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Create Account'),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textField('First Name', first),
                hbox(8),
                textField('Last Name', last),
                hbox(8),
                textFieldType('Email', email, TextInputType.emailAddress),
                hbox(8),
                textFieldType('Phone', phone, TextInputType.number),
                hbox(8),
                textField('Age', age),
                hbox(8),
                textField('Username', user),
                hbox(8),
                textField('Password', pass),
                hbox(15),
                controller.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : buttonBlue('Registration', () {
                        if (mounted) {
                          setState(() {
                            controller.addData(
                                first: first.text,
                                last: last.text,
                                email: email.text,
                                phone: phone.text,
                                age: age.text,
                                pass: pass.text,
                                user: user.text);
                          });
                        }
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
