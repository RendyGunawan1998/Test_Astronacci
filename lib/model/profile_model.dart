class ProfileModel {
  final String nama;
  final String email;
  final String phone;
  final String address;
  final String user;
  final String pass;

  ProfileModel(
      {required this.nama,
      required this.email,
      required this.phone,
      required this.address,
      required this.pass,
      required this.user});

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'email': email,
        'phone': phone,
        'address': address,
        'pass': pass,
        'user': user,
      };

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      pass: json['pass'],
      user: json['user'],
    );
  }
}
