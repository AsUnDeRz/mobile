

class User {
  final int id;
  final String avatar;
  final String username;
  final String name;
  final bool isFollow;
  final String phoneNumber;
  final String sex;
  final DateTime birthday;
  final String country;
  final String city;

  User({
     this.id,
     this.avatar,
     this.username,
     this.name,
     this.isFollow,
     this.phoneNumber,
     this.sex,
     this.birthday,
     this.country,
     this.city,
  });


  User copyWith({username, avatar, isFollow, name, birthday, sex}) {
    return User(
      id: id,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      name: name ?? this.name,
      isFollow: isFollow ?? this.isFollow,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      sex: sex ?? this.sex,
      birthday: birthday ?? this.birthday,
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }

  User copyNull({
    username,
    name,
    avatar,
    isFollow,
    phoneNumber,
    sex,
    birthday,
    city,
    deviceLanguage,
    currencyCountry,
    currentCountry,
    deviceInfo,

  }) {
    return User(
      id: id,
      name: name,
      avatar: avatar,
      username: username,
      isFollow: isFollow,
      phoneNumber: phoneNumber,
      sex: sex,
      birthday: birthday,
      city: city,
    );
  }
}
