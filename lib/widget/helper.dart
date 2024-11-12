import 'package:astronaci_recruitment/core.dart';

hbox(double h) {
  return SizedBox(
    height: h,
  );
}

wbox(double w) {
  return SizedBox(
    width: w,
  );
}

textField(String hint, TextEditingController cont) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(15, 6, 12, 6),
      child: TextField(
        controller: cont,
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
      ),
    ),
  );
}

textFieldType(String hint, TextEditingController cont, TextInputType type) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(15, 6, 12, 6),
      child: TextField(
        keyboardType: type,
        controller: cont,
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
      ),
    ),
  );
}

textFieldSearch(String hint, TextEditingController cont, Function() func1,
    Function() func2) {
  return Padding(
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width * 0.75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 2, 12, 2),
            child: TextField(
              controller: cont,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          ),
        ),
        InkWell(
          onTap: func1,
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        wbox(10),
        InkWell(
          onTap: func2,
          child: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        )
      ],
    ),
  );
}

buttonBlue(String text, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blue[400]),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

bottomButtonBlue(String text, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      width: Get.width,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blue[400]),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

lupaPass(Function() func) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
          onPressed: func,
          child: Text(
            'Lupa pass?',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w800),
          )),
    ],
  );
}

logo() {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Icon(
          Icons.person_2,
          size: 120,
        ),
      ),
    ),
  );
}

createAccount(Function() func) {
  return InkWell(
    onTap: func,
    child: RichText(
      text: TextSpan(
        text: 'Belum punya akun? ',
        style: TextStyle(color: Colors.black87),
        children: <TextSpan>[
          TextSpan(text: 'Buat Akun!', style: TextStyle(color: Colors.blue))
        ],
      ),
    ),
  );
}

imageProfile(String name, num number) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      topLeft: Radius.circular(15),
    ),
    child: Image.network(
      name,
      fit: BoxFit.fitHeight,
      width: Get.width * number,
    ),
  );
}

userData(int flex, String judul1, String judul2, String judul3) {
  return Expanded(
    flex: flex,
    child: Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul1),
          Text(judul2),
          Text(judul3),
        ],
      ),
    ),
  );
}

cardData(User user) {
  return InkWell(
    onTap: () {
      Get.to(() => DetailUserScreen(user: user));
    },
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imageProfile(user.image, 0.3),
            userData(
              7,
              '${user.firstName}  ${user.lastName}',
              'Age : ${user.age}',
              'Gender: ${user.gender}',
            ),
          ],
        ),
      ),
    ),
  );
}

appbarUser(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue,
    title: Text('User List'),
    leading: IconButton(
        onPressed: () {
          Get.to(() => ProfileScreen());
        },
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Center(
              child: Icon(
                Icons.person_4,
                color: Colors.black87,
                size: 18,
              ),
            ),
          ),
        )),
    actions: [
      IconButton(
          onPressed: () {
            showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout?'),
                    content: Text('Are you sure want to logout from app?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Logout'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Get.to(() => LoginScreen());
                        },
                      ),
                    ],
                  );
                });
          },
          icon: Icon(Icons.logout, size: 28, color: Colors.red))
    ],
  );
}
