import '../../core.dart';

class LupaPass extends StatefulWidget {
  LupaPass({super.key});

  @override
  State<LupaPass> createState() => _LupaPassState();
}

class _LupaPassState extends State<LupaPass> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Lupa Password'),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textField('Username', user),
              hbox(8),
              textField('Password', pass),
              lupaPass(() {}),
              hbox(15),
              buttonBlue('Change', () {})
            ],
          ),
        ),
      ),
    );
  }
}
