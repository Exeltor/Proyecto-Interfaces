import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  bool isLoggedIn = false;
  List<Map<String, dynamic>> users = [
    {'email': 'jorge@mail.com', 'password': 'jorgeM', 'metas': []},
    {'email': 'alexey@mail.com', 'password': 'alexey', 'metas': []},
  ];

  List<Map<String, dynamic>> products = [
    {
      "titulo": "iPhone 11 Pro",
      "descripcion": "El ultimo iPhone de Apple. Descubre su impresionante camara y modo nocturno.",
      "precio": 1159,
      "imagen": "https://ss7.vzw.com/is/image/VerizonWireless/iphone-11-pro-max-space-gray-lg-34?\$png8alpha256\$&hei=520"
    }, 
    {
      "titulo": "PlayStation 4",
      "descripcion": "La ultima consola de Sony con un procesador de ocho nucleos que permite experiencias unicas.",
      "precio": 250,
      "imagen": "https://media.playstation.com/is/image/SCEA/playstation-4-slim-vertical-product-shot-01-us-07sep16?\$native_t\$"
    },
    {
      "titulo": "Cajonera Alex - Ikea",
      "descripcion": "La cajonera Alex de Ikea tiene varios colores y permite tener un completo mueble de almacenaje.",
      "precio": 70,
      "imagen": "https://www.ikea.com/es/es/images/products/alex-drawer-unit-blue__0614627_PE686982_S5.JPG?f=s"
    },
    {
      "titulo": "Altavoces Harman Kardon V7",
      "descripcion": "Altavoces con sonido Dolby Surround y un doble amplicador con un diafragma de 70cm.",
      "precio": 95,
      "imagen": "https://images-na.ssl-images-amazon.com/images/I/61SYj85ndCL._AC_SX425_.jpg"
    },
    {
      "titulo": "iMac 27 5k Retina",
      "descripcion": "El nuevo iMac de 27 pulgadas presenta la ultima tecnologia de intel y una pantalla con un alto rango de colores.",
      "precio": 1800,
      "imagen": "https://www.macnificos.com/sites/files/styles/product_page_zoom/public/images/product/imac-21-cto-v1.jpg?itok=CQGeIEUn"
    },
    {
      "titulo": "Monitor IPS Asus 27 2k Diseñador",
      "descripcion": "Monitor IPS de la marca Asus con una representación de colores de 10 bits nativos HDR.",
      "precio": 545,
      "imagen": "https://www.asus.com/media/global/products/68Zd0ZZfOy6gAiXw/P_setting_fff_1_90_end_500.png"
    },
    {
      "titulo": "Apple TV 4k",
      "descripcion": "El ultimo TV Box de Apple con un procesador A10X para dar vida a tus contenidos.",
      "precio": 200,
      "imagen": "https://i0.wp.com/discountsqatar.com/wp-content/uploads/2017/11/Untitled-design-33.png?fit=500%2C500&ssl=1"
    },
    {
      "titulo": "Toshiba HDD 2 TB",
      "descripcion": "Disco duro de la marca Toshiba con 2 TeraBytes de almacenamiento.",
      "precio": 65,
      "imagen": "https://c1.neweggimages.com/ProductImage/22-149-680-V05.jpg"
    },
    {
      "titulo": "Lampara Cajonera Ikea",
      "descripcion": "Lampara para proporcionar una iluminacion ideal.",
      "precio": 70,
      "imagen": "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_500/https://www.tiendahomestaging.com/wp-content/uploads/2018/12/lampara-pie-ikea.jpg"
    },
    {
      "titulo": "Mesa Madera Industrial Maisons du Monde",
      "descripcion": "Mesa de madera con toques industriales en los soportes perfecta para 7 comensales.",
      "precio": 890,
      "imagen": "https://medias.maisonsdumonde.com/image/upload/q_auto,f_auto/w_500/img/mesa-de-comedor-de-madera-de-maciza-de-palo-rosa-l-180-1000-2-7-140473_2.jpg"
    },
    {
      "titulo": "Cactus Saguaru Sonora",
      "descripcion": "Cactus de 70 cm de altura propio del desierto de Sonora.",
      "precio": 70,
      "imagen": "https://ae01.alicdn.com/kf/HTB17u22KpXXXXaTaXXXq6xXFXXXz/Gran-venta-10-bons-i-Paquete-de-cactus-Rebutia-variedad-floreada-cactus-raro-jard-n.jpg_q50.jpg"
    }
  ];

  int currentUser;

  login(int index) {
    this.isLoggedIn = true;
    currentUser = index;
    notifyListeners();
  }

  addToFavorites(int user, int product) {
    this.users[user]['metas'].add(product);
    notifyListeners();
  }

  removeFavorites(int user, int product) {
    this.users[user]['metas'].remove(product);
    notifyListeners();
  }

  logout() {
    this.isLoggedIn = false;
    currentUser = null;
    notifyListeners();
  }
}
