import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class vide extends StatefulWidget {
  const vide({super.key});

  @override
  State<vide> createState() => _videState();
}

class _videState extends State<vide> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.networkUrl(Uri.parse
          (  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4" ),
        ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.cast),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.perm_contact_calendar_sharp),
              )
            ],
          )
        ],
      ),
      body:
         Column(
          children: [
            Container(
              height: 150,
              width: 400,
              child: FlickVideoPlayer(
                flickManager: flickManager,
                flickVideoWithControls: FlickVideoWithControls(
                  closedCaptionTextStyle: TextStyle(fontSize: 8),
                  controls: FlickPortraitControls(),),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Stolen",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.shopping_bag,color: Colors.red,),
                  Text("Watch with a Prime membership")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: (){}, child: Text("Watch with Prime",style: TextStyle(color: Colors.purple),)),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (BuildContext context,int index)
                  {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.video_collection_outlined,size: 30,),
                              Text("Trailer")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.add,size: 30,),
                              Text("Watchlist")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.thumb_up_alt_outlined,size: 30,color: Colors.black,),
                              Text("Like")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.thumb_down_alt_outlined,size: 30,),
                              Text("Not for me")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.share,size: 30,),
                              Text("Share")
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("she saw him accross the book store aisle,the fingers brushed they reached for same novel from that spark,a thousand un written chapters begin CLICK TO SEE"),
            ),
            SizedBox(width:350,child: Text("IMDb 7.5")),
            SizedBox(width:350,child: Text("2023 2 hrs 15 min ")),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Text("NEW MOVIE",style: TextStyle(color: Colors.black),),

                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),

    );
  }
}