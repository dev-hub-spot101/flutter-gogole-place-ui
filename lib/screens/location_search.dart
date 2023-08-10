import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:placesearch/constants.dart';
import 'dart:math' as math;

import 'package:placesearch/widgets/location_list_tile.dart';
import 'package:placesearch/widgets/network_utility.dart';


class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {

  void placeAutocomplate(String query) async{

    Uri uri = Uri.https("maps.googleapis.com",
                        "maps/api/place/autocomplete/json",
                        {
                          "input":query,
                          "key":apiKey
                        });

    String? response =await NetworkUtility.fetchUrl(uri);

    if(response != null){
      print(response);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: Positioned(
           child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            elevation: 0,
            fillColor: secondaryColor10LightTheme,
            child: Transform.rotate(angle: 45* math.pi/180,child: Icon(Icons.navigation, size: 20, color: secondaryColor20LightTheme,),),
            )  
          )
          
         
        ),
        title: const Text("Set Delivery Location", style: TextStyle(color: textColorLightTheme),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: Icon(Icons.clear_rounded, size: 20, color: secondaryColor20LightTheme,),
          ),
        ],
      ),
      body:Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TextFormField(
                onChanged: (value){
                   placeAutocomplate(value);
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Search your location",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.pin_drop_outlined, size: 20, color: secondaryColor20LightTheme,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            )
          ),

          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton.icon(
              onPressed: (){
                placeAutocomplate("India");
              },
              icon: Transform.rotate(angle: 45* math.pi/180,child: Icon(Icons.navigation, size: 20, color: secondaryColor20LightTheme,),),
              label: const Text("Use my Current Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor10LightTheme,
                foregroundColor: textColorLightTheme,
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),

            ),
          ),
          const Divider(
            height: 4,
            thickness: 4,
            color: secondaryColor5LightTheme,
          ),

          LocationListTile(location: "Indore India", press: (){}),
          LocationListTile(location: "Indore vijay nagar india", press: (){}),
          LocationListTile(location: "Bhopal india", press: (){}),
          LocationListTile(location: "Mumbai india", press: (){}),
          LocationListTile(location: "Bengaluru india", press: (){}),
          LocationListTile(location: "Chennai india", press: (){}),
          LocationListTile(location: "Hyderabas india", press: (){}),
          LocationListTile(location: "Jaipur india", press: (){}),
          LocationListTile(location: "Kolkata india", press: (){}),
        ],
      ),
    );
  }
}