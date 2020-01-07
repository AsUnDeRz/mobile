import 'dart:math';

import 'package:social_network/domain/model/post.dart';
import 'package:social_network/domain/model/user.dart';


class FixtureUtil {

  static List<Post> randomPosts({int itemsPerPage = 10}) {
    final List<Post> listPosts = List<Post>();
    for (int i = 1; i <= itemsPerPage; ++i) {
        listPosts.add(Post(
          id: i,
          fileUrl: "http://lorempixel.com/1080/1920/?${Random().nextInt(4200000000)}",
          description: comments[Random().nextInt(comments.length)],
          date: DateTime.now().subtract(Duration(days: 2 * i)),
          likesAmount: Random().nextInt(4200000000),
          viewsAmount: Random().nextInt(4200000000),
          sharesAmount: Random().nextInt(4200000000),
          creator: randomUser(),
        ));
      }
    return listPosts;
  }

  static User randomUser() {
    return User(
      id: Random().nextInt(0xffff),
      avatar: photos[Random().nextInt(photos.length)],
      username: names[Random().nextInt(names.length)],
      phoneNumber: phones[Random().nextInt(phones.length)],
      sex: genders[Random().nextInt(genders.length)],
      birthday: DateTime(1970, 1, 1).add(Duration(days: Random().nextInt(12000))),
      country: countries[Random().nextInt(countries.length)],
      city: cities[Random().nextInt(cities.length)],
    );
  }

  static User getTestUser() {
    return User(
      id: null,
      avatar: "http://www.radionetplus.ru/uploads/posts/2014-07/1405019019_oboi-6.jpg",
      username: "Test",
      phoneNumber: "+7999999999",
      sex: "male",
      birthday: DateTime(2019, 1, 2),
      country: "Russia",
      city: "Barnaul",
    );
  }

  static const List<String> comments = <String>[
    'Sed quis nunc erat.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis viverra lectus sed pellentesque egestas. Integer lobortis in dolor iaculis convallis. ',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis viverra lectus sed pellentesque egestas. Integer lobortis in dolor iaculis convallis. Nullam quis enim rhoncus justo suscipit lobortis. Pellentesque cursus venenatis rhoncus. Donec magna nisl, sodales ac tincidunt vel, eleifend non quam. ',
  ];

  static const List<String> names = <String>[
    'John',
    'Peter',
    'Ashish Rawat',
    'Dane Mackier',
  ];

  static const List<String> photos = <String>[
    'https://i.pinimg.com/originals/32/5e/4a/325e4ac5122d462d05bbc052092038d0.jpg',
    'https://frebers.com/wp-content/uploads/2016/03/panda-frebers.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51jtQwAOTcL._SY355_.jpg',
    'https://cdn1.iconfinder.com/data/icons/panda-face-1/1000/panda_face_emoticon-09-512.png',
  ];

  static const List<String> phones = <String>[
    '+71233454545',
    '+78888362522',
    '+72138743849',
    '+79832948932',
  ];

  static const List<String> genders = <String>[
    'male',
    'female',
  ];

  static const List<String> countries = <String>[
    'Russia',
    'Ukraine',
    'China',
    'US',
  ];

  static const List<String> cities = <String>[
    'Barnaul',
    'Moscow',
    'Kiev',
    'Beijing',
  ];

  static const List<String> languages = <String>[
    'ru',
    'en',
    'cn',
  ];
}