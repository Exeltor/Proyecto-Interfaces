import 'package:flutter/material.dart';

enum Plazo {
  inmediato,
  corto,
  largo,
  error,
}

class DataProvider with ChangeNotifier {
  bool isLoggedIn = false;
  List<Map<String, dynamic>> users = [
    {
      'email': 'jorge@mail.com',
      'password': 'jorgeM',
      'metas': {'inmediato': [], 'corto': [], 'largo': []},
      'ingresoMensual': 50,
      'plazos': {'inmediato': 0, 'corto': 1, 'largo': 4},
    },
    {
      'email': 'alexey@mail.com',
      'password': 'alexey',
      'metas': {'inmediato': [], 'corto': [], 'largo': []},
      'ingresoMensual': 90,
      'plazos': {'inmediato': 0, 'corto': 1, 'largo': 4},
    },
  ];

  List<Map<String, dynamic>> products = [
    {
      "titulo": "iPhone 11 Pro",
      "descripcion":
          "El ultimo iPhone de Apple. Descubre su impresionante camara y modo nocturno.",
      "precio": 1159,
      "imagen":
          "https://ss7.vzw.com/is/image/VerizonWireless/iphone-11-pro-max-space-gray-lg-34?\$png8alpha256\$&hei=520"
    },
    {
      "titulo": "PlayStation 4",
      "descripcion":
          "La ultima consola de Sony con un procesador de ocho nucleos que permite experiencias unicas.",
      "precio": 250,
      "imagen":
          "https://media.playstation.com/is/image/SCEA/playstation-4-slim-vertical-product-shot-01-us-07sep16?\$native_t\$"
    },
    {
      "titulo": "Cajonera Alex - Ikea",
      "descripcion":
          "La cajonera Alex de Ikea tiene varios colores y permite tener un completo mueble de almacenaje.",
      "precio": 70,
      "imagen":
          "https://www.ikea.com/es/es/images/products/alex-drawer-unit-blue__0614627_PE686982_S5.JPG?f=s"
    },
    {
      "titulo": "Altavoces Harman Kardon V7",
      "descripcion":
          "Altavoces con sonido Dolby Surround y un doble amplicador con un diafragma de 70cm.",
      "precio": 95,
      "imagen":
          "https://images-na.ssl-images-amazon.com/images/I/61SYj85ndCL._AC_SX425_.jpg"
    },
    {
      "titulo": "iMac 27 5k Retina",
      "descripcion":
          "El nuevo iMac de 27 pulgadas presenta la ultima tecnologia de intel y una pantalla con un alto rango de colores.",
      "precio": 1800,
      "imagen":
          "https://www.macnificos.com/sites/files/styles/product_page_zoom/public/images/product/imac-21-cto-v1.jpg?itok=CQGeIEUn"
    },
    {
      "titulo": "Monitor IPS Asus 27 2k Diseñador",
      "descripcion":
          "Monitor IPS de la marca Asus con una representación de colores de 10 bits nativos HDR.",
      "precio": 545,
      "imagen":
          "https://www.asus.com/media/global/products/68Zd0ZZfOy6gAiXw/P_setting_fff_1_90_end_500.png"
    },
    {
      "titulo": "Apple TV 4k",
      "descripcion":
          "El ultimo TV Box de Apple con un procesador A10X para dar vida a tus contenidos.",
      "precio": 200,
      "imagen":
          "https://i0.wp.com/discountsqatar.com/wp-content/uploads/2017/11/Untitled-design-33.png?fit=500%2C500&ssl=1"
    },
    {
      "titulo": "Toshiba HDD 2 TB",
      "descripcion":
          "Disco duro de la marca Toshiba con 2 TeraBytes de almacenamiento.",
      "precio": 65,
      "imagen": "https://c1.neweggimages.com/ProductImage/22-149-680-V05.jpg"
    },
    {
      "titulo": "Lampara Cajonera Ikea",
      "descripcion": "Lampara para proporcionar una iluminacion ideal.",
      "precio": 70,
      "imagen":
          "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_500/https://www.tiendahomestaging.com/wp-content/uploads/2018/12/lampara-pie-ikea.jpg"
    },
    {
      "titulo": "Mesa Madera Industrial Maisons du Monde",
      "descripcion":
          "Mesa de madera con toques industriales en los soportes perfecta para 7 comensales.",
      "precio": 890,
      "imagen":
          "https://medias.maisonsdumonde.com/image/upload/q_auto,f_auto/w_500/img/mesa-de-comedor-de-madera-de-maciza-de-palo-rosa-l-180-1000-2-7-140473_2.jpg"
    },
    {
      "titulo": "Cactus Saguaru Sonora",
      "descripcion": "Cactus de 70 cm de altura propio del desierto de Sonora.",
      "precio": 70,
      "imagen":
          "https://ae01.alicdn.com/kf/HTB17u22KpXXXXaTaXXXq6xXFXXXz/Gran-venta-10-bons-i-Paquete-de-cactus-Rebutia-variedad-floreada-cactus-raro-jard-n.jpg_q50.jpg"
    }
  ];

  int currentUser;

  login(int index) {
    this.isLoggedIn = true;
    currentUser = index;
    notifyListeners();
  }

  Plazo addGoal(int userId, int productIndex) {
    final int userIncome = users[userId]['ingresoMensual'];
    final int productCost = products[productIndex]['precio'];

    final double ratio = productCost / userIncome;

    if (users[userId]['metas']['inmediato'].contains(productIndex) ||
        users[userId]['metas']['corto'].contains(productIndex) ||
        users[userId]['metas']['largo'].contains(productIndex)) return null;

    if (ratio <= 1) {
      users[userId]['metas']['inmediato'].add(productIndex);
      notifyListeners();
      return Plazo.inmediato;
    } else if (ratio > 1 && ratio <= users[userId]['plazos']['largo']) {
      users[userId]['metas']['corto'].add(productIndex);
      notifyListeners();
      return Plazo.corto;
    } else {
      users[userId]['metas']['largo'].add(productIndex);
      notifyListeners();
      return Plazo.largo;
    }
  }

  register(String email, String password) {
    users.add({
      'email': email,
      'password': password,
      'metas': {'inmediato': [], 'corto': [], 'largo': []},
      'ingresoMensual': 50,
      'plazos': {'inmediato': 0, 'corto': 1, 'largo': 4},
    });
  }

  deleteGoal(int goalId, String goalTerm) {
    users[currentUser]['metas'][goalTerm].remove(goalId);
    notifyListeners();
  } 

  logout() {
    this.isLoggedIn = false;
    currentUser = null;
    notifyListeners();
  }
}
