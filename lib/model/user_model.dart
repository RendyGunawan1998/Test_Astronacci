import '../core.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  List<User> users;

  UserModel({
    required this.users,
  });

  UserModel copyWith({
    List<User>? users,
  }) =>
      UserModel(
        users: users ?? this.users,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  String birthDate;
  String image;
  String bloodGroup;
  double height;
  double weight;
  String eyeColor;
  Hair hair;
  String ip;
  Address address;
  String macAddress;
  String university;
  Bank bank;
  Company company;
  String ein;
  String ssn;
  String userAgent;
  Crypto crypto;
  String role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? bloodGroup,
    double? height,
    double? weight,
    String? eyeColor,
    Hair? hair,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
    String? role,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        maidenName: maidenName ?? this.maidenName,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        password: password ?? this.password,
        birthDate: birthDate ?? this.birthDate,
        image: image ?? this.image,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        eyeColor: eyeColor ?? this.eyeColor,
        hair: hair ?? this.hair,
        ip: ip ?? this.ip,
        address: address ?? this.address,
        macAddress: macAddress ?? this.macAddress,
        university: university ?? this.university,
        bank: bank ?? this.bank,
        company: company ?? this.company,
        ein: ein ?? this.ein,
        ssn: ssn ?? this.ssn,
        userAgent: userAgent ?? this.userAgent,
        crypto: crypto ?? this.crypto,
        role: role ?? this.role,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        birthDate: json["birthDate"],
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        eyeColor: json["eyeColor"],
        hair: Hair.fromJson(json["hair"]),
        ip: json["ip"],
        address: Address.fromJson(json["address"]),
        macAddress: json["macAddress"],
        university: json["university"],
        bank: Bank.fromJson(json["bank"]),
        company: Company.fromJson(json["company"]),
        ein: json["ein"],
        ssn: json["ssn"],
        userAgent: json["userAgent"],
        crypto: Crypto.fromJson(json["crypto"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate": birthDate,
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hair": hair.toJson(),
        "ip": ip,
        "address": address.toJson(),
        "macAddress": macAddress,
        "university": university,
        "bank": bank.toJson(),
        "company": company.toJson(),
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
        "crypto": crypto.toJson(),
        "role": role,
      };
}

class Address {
  String address;
  String city;
  String state;
  String stateCode;
  String postalCode;
  Coordinates coordinates;
  String country;

  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates? coordinates,
    String? country,
  }) =>
      Address(
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        stateCode: stateCode ?? this.stateCode,
        postalCode: postalCode ?? this.postalCode,
        coordinates: coordinates ?? this.coordinates,
        country: country ?? this.country,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        stateCode: json["stateCode"],
        postalCode: json["postalCode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "state": state,
        "stateCode": stateCode,
        "postalCode": postalCode,
        "coordinates": coordinates.toJson(),
        "country": country,
      };
}

class Coordinates {
  double lat;
  double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  Coordinates copyWith({
    double? lat,
    double? lng,
  }) =>
      Coordinates(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Bank {
  String cardExpire;
  String cardNumber;
  String cardType;
  String currency;
  String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  Bank copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) =>
      Bank(
        cardExpire: cardExpire ?? this.cardExpire,
        cardNumber: cardNumber ?? this.cardNumber,
        cardType: cardType ?? this.cardType,
        currency: currency ?? this.currency,
        iban: iban ?? this.iban,
      );

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
      );

  Map<String, dynamic> toJson() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
      };
}

class Company {
  String department;
  String name;
  String title;
  Address address;

  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  Company copyWith({
    String? department,
    String? name,
    String? title,
    Address? address,
  }) =>
      Company(
        department: department ?? this.department,
        name: name ?? this.name,
        title: title ?? this.title,
        address: address ?? this.address,
      );

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        department: json["department"],
        name: json["name"],
        title: json["title"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "department": department,
        "name": name,
        "title": title,
        "address": address.toJson(),
      };
}

class Crypto {
  String coin;
  String wallet;
  String network;

  Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  Crypto copyWith({
    String? coin,
    String? wallet,
    String? network,
  }) =>
      Crypto(
        coin: coin ?? this.coin,
        wallet: wallet ?? this.wallet,
        network: network ?? this.network,
      );

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        coin: json["coin"],
        wallet: json["wallet"],
        network: json["network"],
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "wallet": wallet,
        "network": network,
      };
}

class Hair {
  String color;
  String type;

  Hair({
    required this.color,
    required this.type,
  });

  Hair copyWith({
    String? color,
    String? type,
  }) =>
      Hair(
        color: color ?? this.color,
        type: type ?? this.type,
      );

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "type": type,
      };
}
