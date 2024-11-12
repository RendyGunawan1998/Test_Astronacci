import '../../core.dart';

class DetailUserScreen extends StatefulWidget {
  final User user;
  DetailUserScreen({super.key, required this.user});

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
      ),
      body: Container(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: Colors.grey.withOpacity(0.4), width: 0.7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageProfile(user!.image, 1),
                  hbox(10),
                  Text('${user!.firstName}  ${user!.lastName}'),
                  hbox(6),
                  Text('Age : ${user!.age}'),
                  hbox(6),
                  Text('Gender: ${user!.gender}'),
                  hbox(6),
                  Text('Email : ${user!.email}'),
                  hbox(6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
