import 'package:flutter/material.dart';

Widget storeItem(String imagePath,String nameStore,String locationCity,bool add){
  return Padding(
    padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0)
   ,child:InkWell(
    onTap: () {
      
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget> [
        // ignore: avoid_unnecessary_containers
        Container(
          child: Row(
            
            children: <Widget>[
           
              ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child:  Image(image: AssetImage(imagePath),
                              height: 75.0,
                              width: 75.0,
                              fit:BoxFit.cover, //change image fill type
                          ),
                         ),
              const SizedBox(width: 10.0,)
              ,Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Text(
                  nameStore,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                 ) ,
                  Text(
                  locationCity,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  ),
                 ) 
                ],
              )
            ],
          ),
        ),
        if (add)
        IconButton(onPressed: () {
          
        },
         icon: const Icon(Icons.add),color: Colors.black,)
      ],
    ),
    
   ) ,
  );
}