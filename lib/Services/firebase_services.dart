import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static getHotels() async{
    CollectionReference hotelCollectionReference = FirebaseFirestore.instance.collection('hotels');
    
    final hotels = await hotelCollectionReference.get();
    
    

    for (var hotels in hotels.docs) {
      print(hotels["title"]);
    }

    print(hotels.docs[0]["prices"]);
  }
}