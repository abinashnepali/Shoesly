class RegisterParams {
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? confirmPassword;
  String? contactNumber;

  RegisterParams({this.email, this.password});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['firstname'] = firstName;
    map['lastname'] = lastName;
    map['password'] = password;
    map['phoneno'] = contactNumber;

    return map;
  }
}
