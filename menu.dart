enum Date { Monday, Tuesday, Wednesday, Thursday, Friday }

extension ParseToString on Date {
  String str() {
    return this.toString().split('.').last;
  }
}

final List<Menu> data = [
  Menu(Date.Monday, [
    MenuItem('Chicken Burrito Wrap',
        '/Users/mattkad/flutter_application_1/assets/burritto.webp'),
    MenuItem('Crisp Potato Chips',
        '/Users/mattkad/flutter_application_1/assets/chips.jpeg'),
    MenuItem('Freshly Squeezed Lemonade',
        '/Users/mattkad/flutter_application_1/assets/lemonade.webp'),
  ]),
  Menu(Date.Tuesday, [
    MenuItem('Freshly Grilled Cheese Sanddwhich',
        '/Users/mattkad/flutter_application_1/assets/GrilledCheese.webp'),
    MenuItem(
        'Tomato Soup', '/Users/mattkad/flutter_application_1/assets/soup.jpeg'),
  ]),
  Menu(Date.Wednesday, [
    MenuItem('Mince Beef Burger',
        '/Users/mattkad/flutter_application_1/assets/burger.jpeg'),
    MenuItem('Lightly Salted Potato Fries',
        '/Users/mattkad/flutter_application_1/assets/fries.jpg'),
    MenuItem('Fruit Milkshake',
        '/Users/mattkad/flutter_application_1/assets/milkshake.jpeg'),
  ]),
  Menu(Date.Thursday, [
    MenuItem('Wings', '/Users/mattkad/flutter_application_1/assets/wings.webp'),
    MenuItem(
        'Celery', '/Users/mattkad/flutter_application_1/assets/celery.jpeg'),
    MenuItem('Milk', '/Users/mattkad/flutter_application_1/assets/milk.jpeg')
  ]),
  Menu(Date.Friday, [
    MenuItem('Pizza', '/Users/mattkad/flutter_application_1/assets/pizza.jpeg'),
    MenuItem('Breaded Garlic Knots',
        '/Users/mattkad/flutter_application_1/assets/knots.jpeg'),
    MenuItem('Fountain Soda',
        '/Users/mattkad/flutter_application_1/assets/soda.jpeg'),
  ])
];

class MenuItem {
  late String label, image;

  MenuItem(String label, String image) {
    this.label = label;
    this.image = image;
  }
  @override
  String toString() {
    return label;
  }
}

class Menu {
  final Date day;
  final List<MenuItem> items;
  final int feat;

  Menu(this.day, [this.items = const [], this.feat = 0]);

  String getDay() {
    return day.str();
  }

  MenuItem getFeat() {
    return items[feat];
  }
}
