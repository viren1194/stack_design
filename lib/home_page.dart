// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [

        ListView.builder(shrinkWrap: true,itemCount: 2,itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            height: 300,
            width: double.infinity,
            color: Colors.blue,
            child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 5,itemBuilder: (context, index) {
              return Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(borderRadius: BorderRadius.circular(20),
                  child:  Stack(
                    children: [
                      Container(
                          width: 250,
                          color: Colors.amber,
                        ),
                        Positioned(child:ClipRRect(borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 240,
                            width: 250,
                            color: Colors.black,
                            child: Image.network('https://images.pexels.com/photos/17715610/pexels-photo-17715610/free-photo-of-art-building-architecture-historical.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',fit: BoxFit.cover,),
                          ),
                        ), ),
                        const Positioned(bottom: 0,child: Text("data")),
                        const Positioned(right: 0,bottom: 0,child: Text("data"))
                    ],
                  ),
                  
                ),
              );
            },)
          );
        },),
        // Container(
        //   height: 500,
        //   width: double.infinity,
        //   color: Colors.red,
        //   child: Image.network('https://images.pexels.com/photos/17715610/pexels-photo-17715610/free-photo-of-art-building-architecture-historical.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
        // ),
        ElevatedButton(onPressed: () async {
            int location = WallpaperManager.BOTH_SCREEN;
                          dynamic file = await DefaultCacheManager()
                              .getSingleFile('https://images.pexels.com/photos/17715610/pexels-photo-17715610/free-photo-of-art-building-architecture-historical.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load');
                          bool result =
                              await WallpaperManager.setWallpaperFromFile(
                                  file.path, location);
                          print('================================');
                          print(result);
        }, child: const Text("Set Wallpaper"))
      ]),
    );
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WallpaperManager.clearWallpaper();
  }

}