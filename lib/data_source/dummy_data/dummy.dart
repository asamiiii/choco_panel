import 'package:choco_panel/models/announ_model.dart';
import 'package:choco_panel/models/item_model.dart';

class DummyData{
  static var filteredChocoList=[];

  static List<ItemModel> chocoList=[
    // ItemModel(
    //   branch:'benha,benha2',
    //   category: 'cat1,all',
    //   discount: '',
    //   discription: ' discription discription discription discription discription',
    //   id: '1',
    //   image: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   imagesList: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg,https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   ingredients: 'ingredients igredients,ingredients:ingredients ingredients ingredients,ingredients ingredients ingredients ingredients,ingredients ingredients ingredients ingredients,ingredientsi ngredients ingredients ingredients,ingredients ingredients',
    //   name: 'Choco1',
    //   price: '10',
    //   nutritionDeclaration: 'Salt:0,08 g-Salt:0,08 g-Salt:0,08 g-Salt:0,08 g-Salt:0,08 g'
    //   ),
    //   ItemModel(
    //   branch:'benha',
    //   category: 'cat2,all',
    //   discount: '10 %',
    //   discription: ' discription discription discription discription discription',
    //   id: '2',
    //   image: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   imagesList: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg,https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   ingredients: 'ingredients ingredients,ingredients ingredients ingredients ingredients,ingredients ingredients ingredients ,ingredients,ingredients:ingredients ingredients  ingredients,ingredients:ingredients',
    //   name: 'Choco2',
    //   price: '10',
    //   nutritionDeclaration: 'Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g'
    //   ),
    //   ItemModel(
    //   branch:'benha',
    //   category: 'cat3,all',
    //   discount: '',
    //   discription: ' discription discription discription discription discription',
    //   id: '3',
    //   image: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   imagesList: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg,https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   ingredients: 'ingredients ingredients,ingredients ingredients ingredients ingredients,ingredients ingredients ingredients ,ingredients,ingredients:ingredients ingredients  ingredients,ingredients:ingredients',
    //   name: 'Choco3',
    //   price: '10',
    //   nutritionDeclaration: 'Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g'
    //   ),
    //   ItemModel(
    //   branch:'benha',
    //   category: 'cat3,all',
    //   discount: '',
    //   discription: ' discription discription discription discription discription',
    //   id: '4',
    //   image: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   imagesList: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg,',
    //   ingredients: 'ingredients ingredients,ingredients:ingredients',
    //   name: 'Choco3',
    //   price: '10',
    //   nutritionDeclaration: 'Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g'
    //   ),
    //   ItemModel(
    //   branch:'benha',
    //   category: 'cat1,all',
    //   discount: '',
    //   discription: ' discription discription discription discription discription',
    //   id: '5',
    //   image: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   imagesList: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg,https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   ingredients: 'ingredients ingredients,ingredients ingredients ingredients ingredients,ingredients ingredients ingredients ,ingredients,ingredients:ingredients ingredients  ingredients,ingredients:ingredients',
    //   name: 'Choco1',
    //   price: '10',
    //   nutritionDeclaration: 'Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g - Salt:0,08 g'
    //   ),
    //   ItemModel(
    //   branch:'benha',
    //   category: 'cat3,all',
    //   discount: '',
    //   discription: ' discription discription discription discription discription',
    //   id: '6',
    //   image: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   imagesList: 'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg,https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
    //   ingredients: 'Socker, kakaomassa, kakaosmör, glukossirap, MJÖLKPULVER, vegetabiliska oljor (palm, solros), vatten, invertsockersirap, etanol, ÄGGLIKÖR (0,82%), LAKTOS; torkad ÄGGULA (0,6%), naturlig arom, emulgeringsmedel (SOJALECITIN, lecitin), SKUMMJÖLKSPULVER, naturlig morotsarom, majsstärkelse, salt, invertas, naturlig vaniljarom, surhetreglerande medel (E330).',
    //   name: 'Choco3',
    //   price: '10',
    //   nutritionDeclaration: 'Energi Kj: 2082 kJ - Energi: 498 kcal - Fett: 26,5 g - Varav mättat fett: 15,8 g - Kolhydrat: 55,4 g - Varav sockerarter: 50,7 g - Protein: 4,6 g - Salt: 0,08 g'
    //   ),
  ];

  static List<Announcment> announcments=[
    // Announcment(id: '1',txt: 'The best types of chocolate',branch: 'b2'),
    // Announcment(id: '1',txt: 'Exclusive offers for our customers',branch: 'b1'),
    // Announcment(id: '1',txt: 'hi klkhlh hkjh ',branch: 'b1'),
    // Announcment(id: '1',txt: 'hi klkhlh hkjh ',branch: 'b1'),
  ];

 static List<String> branches = ['benha','benha2','benha3'];
}