import 'dart:developer';

import 'package:gsheets/gsheets.dart';

const credentials = {
  "type": "service_account",
  "project_id": "inearth",
  "private_key_id": "6f4c6678a98793da67d41f4b1c4bc063eed02cdc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCPaEhG5cdMyGp0\ng5n66kfcwTFPvqPPtYSLoBnG8j+BATdh3tnzNw/afeD1fwnN4t4SqWs31kJZ/flP\n8Q8cIw6gsF/J1uZpunQZvp7+V/m2l6t8Gh17YGH0YTIz3T3f4njYPg76uMFgAKz3\nIFEBGW5HdB2Pfnkimr2go/Y80aLjtkQdxOJ4mryuC6xU2I2S4N7v59ZEKFvo+lGt\nvhIqjHtYPO6zV3d/Klf64Od4UXBtKBjzQT7R1XMGMeAP1//rJjyanfbPJdVBD3cl\nD+s6NvRAiVz8Qwiaamb0ZQ7UDS/s4GfC3pxJMCu7m8iHUtr6J7Y5FlzYyfCNyuR1\n5anFuLiDAgMBAAECggEAEfCbPhdHp+DYhGvkKuH9DG40o4O3TWgpRShJoTwz2okS\n6xDsVgM43f3qUvvJ97IeUtpT2d/ZXBWsByaiW8Q887gsu3zBRU+4b3ILxMivqfpu\nTu+baZBEoMQ5+gf+0g+sS2z0BcRwGHjtKlsmFwud4p1xhz5sm/ocp8hrKO+Wv4Kh\nHtlhgnyjgN1hrFs9PxDY1M/4gMFrv2W0Kt+Ej1vnXYUIMUFi0OSzCpzyiqNntEic\n06s1EJdiq12Fbq8os3+PYK63pfV5Ah+0M/Ui8Y9YzdaBlh9zDCve9ZvJvvGxsMLn\nK2NNly8kYZjRdv23UduT/dEkWfSConVLJlwzRc+cJQKBgQDKby1/tU5F5wXtW3XL\nMGZ8EmiqnL9w3n5CrMBUj237Er58yuM5f5PDtx0lfX3R0SljUQ4PlSivs4Ehi6ij\njzrOqGz8z4sSZsRvT+FPppjMWRQ2YkT9mEoGzzt0CPBia26u0qE6tL3Qv4h5dPNy\nWIYObRsmioT/YWQBSWcKIsvLbQKBgQC1WqRtPjpOiyrTI2Lth0YqS7Zd62O4Ekrc\neqOMdhZQI+IX+GxfBqUF2jFKfmlRdifcZBOHzEv85P2AiyE4JgRJ45MvZ1i4h54g\nVumKZYkxQBSqzhsruoOS8wHQCnBrcbgrLrTpePIUhHoBt5xlwZ/5WEGmpqwXgN5O\nDY4bbbCtrwKBgGfLd5XKnbajzNs2EQC88V9ehQIt2s8BldWUBA2XeTnKE5ei470A\nmAA67Jvja1bgmwsMbVw6C6GDNYvAsxgiAXIi07cQp2so/EFiwND5R9FHP2DfJCav\nJg21xfMp/i9IjHjhEMAsGkNlYZF9ELIph5rwAILTdXwIMKGkREvjKYFFAoGAUnIs\nwkVB+KcoBujVdqrC6UOWWshCg1I9mlJeu+KLbk+B3+feTK0WpLx3ICir9I7EvFr6\nzgfAm+32mVOm/IG7/WNqbGiNWwa8inM4pORYJH2/Z49fpteaLVowfsXgKdh/I5KO\nSH3lgBJh7RnuDgyij5bh8cNgBSde6Rkce7e4VJ0CgYBHzHn4b+sYaqfPjTxj9rzD\nZeNmEDQcBSIgGdkv4tg3MLt377i/BIou8x/kSNIVl/ZwQXg0gJyIEe6E2PDwkYTJ\nDJ991I5ysNJDZGcC7wRiywxtggy0TA3g6kI4MNHzHo4Q/uj0T0pqr6Xyo69QHHlY\nnU7SygdXMk9bqUp7ChjToA==\n-----END PRIVATE KEY-----\n",
  "client_email": "inearth@inearth.iam.gserviceaccount.com",
  "client_id": "112707521507741801984",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/inearth%40inearth.iam.gserviceaccount.com"
};

Future<List<List<String>>> gsheets(title) async {
  try{
    while(true){
      await Future.delayed(const Duration(milliseconds: 500));
      // Stream.periodic(Duration(milliseconds: delay));
      var sheetsId = '1ZQkhKA2Owg-OJFbBsvSlY8Pv6dY2HxA7-4vDNADCRXY';
      final gsheets = GSheets(credentials);
      final ss = await gsheets.spreadsheet(sheetsId);
      var sheet = ss.worksheetByTitle(title);
      var alRows = await sheet!.values.allRows();
      return alRows;
    }
  }
  catch(e){
    throw 'Something is wrong';
  }
}
late List country;
Future<List<String>> gsheetdata() async {
  try{
    while(true){
      await Future.delayed(const Duration(milliseconds: 500));
      // Stream.periodic(Duration(milliseconds: delay));
      var sheetsId = '1ZQkhKA2Owg-OJFbBsvSlY8Pv6dY2HxA7-4vDNADCRXY';
      final gsheets = GSheets(credentials);
      final ss = await gsheets.spreadsheet(sheetsId);
      var sheet = ss.worksheetByTitle('API');
      country = await sheet!.values.row(1);
      // print(country);
      // List.generate(countries.length, (index) => country.add(countries[index].toString()));
      // // value = await sheet.values.row(31);
      // return country.;
    }
  }
  catch(e){
    throw 'Something is wrong';
  }
}