import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/Models/hotel.dart';

class FirebaseServices {

  //Get hotels Document firebase DB and return hotel type data
  static Future<List<Hotel>>getHotels() async{

    //get data from firebase DB 
    CollectionReference hotelCollectionReference = 
        FirebaseFirestore.instance.collection('hotels');
    
    final hotelsDocuments = await hotelCollectionReference.get();

    hotelCollectionReference.get().then((hotelsDocuments){});

    List<Hotel> hotels =[];

    for (var hotelDoc in hotelsDocuments.docs) {
      hotels.add(
        Hotel(title: hotelDoc["title"],
              rating: hotelDoc["rating"],
              prices: hotelDoc["prices"],
              mainImages: hotelDoc["main Image"],
              otherImages: hotelDoc["other images"],
              amanities: hotelDoc["amanities"],
        ),
      );
    }
    return hotels;
  }
}