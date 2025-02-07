import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<String> profileImages = [
    "https://cdn-icons-png.flaticon.com/128/3048/3048122.png",
    "https://cdn-icons-png.flaticon.com/128/16683/16683419.png",
    "https://cdn-icons-png.flaticon.com/128/16683/16683451.png",
    "https://cdn-icons-png.flaticon.com/128/18479/18479697.png",
    "https://cdn-icons-png.flaticon.com/128/18760/18760780.png",
    "https://cdn-icons-png.flaticon.com/128/702/702010.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Social Dashboard",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Profiles",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 600,
                child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).orientation==Orientation.portrait?3:3,crossAxisSpacing: 5,mainAxisSpacing: 20),
                    itemCount: profileImages.length,
                    itemBuilder: (context,int index){
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(profileImages[index]),
                          ),
                          Positioned(
                            bottom:45,
                            right:45,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,

                            ),
                          ),

                        ],

                      );

                    }

                ),
              ),
              Text(
                "Featured post",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 800,
                    height: 350,
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm4Vt4k_y2_-Iyb_9bl4s8kGlbl3danPxlgw&s",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.black.withOpacity(0.5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " Amazing View!",
                        style: TextStyle(
                          color: Colors.white, // Text color to ensure visibility
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100,),
              Row(
                children: [
                  Text("Likes:$counter",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  SizedBox(width: 500,),
                  Text("Like ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  IconButton(onPressed: (){setState(() {
                    counter++;
                  });}, icon:Icon( Icons.back_hand)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
