import 'package:flutter/material.dart';
import 'package:hotel_booking_app/Providers/hotel_provider.dart';
import 'package:hotel_booking_app/Screens/booking_screen.dart';
import 'package:hotel_booking_app/Screens/discover_screen.dart';
import 'package:hotel_booking_app/Screens/favourite_screen.dart';
import 'package:hotel_booking_app/Screens/message_screen.dart';
import 'package:hotel_booking_app/Services/firebase_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int screenNo = 0;
  
  List<Widget> screenList = const [
    DiscoverScreen(),
    FavouriteScreen(),
    BookingScreen(),
    MessageScreen(),
  ];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseServices.getHotels().then((hotelsData){
      context.read<HotelProvider>().addHotels(hotels: hotelsData);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[screenNo],
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(202, 0, 0, 0)
          ),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNavigationIcon(
                icon:Icons.favorite,iconText: "Discover",index: 0),
              bottomNavigationIcon(
                icon:Icons.favorite,iconText: "Favourite",index: 1),
              bottomNavigationIcon(
                icon:Icons.shopping_bag,iconText: "Booking",index: 2),
              bottomNavigationIcon(
                icon:Icons.ac_unit_outlined,iconText: "Message",index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationIcon(
    {required IconData icon,required String iconText,required int index}){
      return InkWell(
        onTap: (){
          setState(() {
            screenNo = index;
          });
          print(screenNo);
        },
        child: Column(
          children: [
            Icon(
              icon,
              color: screenNo == index? Colors.white:Colors.grey,
              size: screenNo  == index ? 23 : 18,
            ),
            Text(
              iconText,
              style: TextStyle(
                color: screenNo == index ? Colors.white: Colors.grey
              ),
            )
          ],
        ),
      );
    }
}
