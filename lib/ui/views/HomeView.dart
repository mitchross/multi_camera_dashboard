import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:muticam_dashboard/core/models/CameraStream.dart';
import 'package:muticam_dashboard/core/viewmodels/CameraStreamsViewModel.dart';
import 'package:muticam_dashboard/ui/widgets/CameraVLCStreamCard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<CameraStream> cameraStreams;

  Uint8List image;
  GlobalKey imageKey;
  VlcPlayer videoView;
  VlcPlayerController _videoViewController;

  @override
  void initState() {
    imageKey = new GlobalKey();
    _videoViewController = new VlcPlayerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cameraStreamProvider = Provider.of<CameraStreamsViewModel>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addCameraStream');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: Container(
        child: StreamBuilder(
            stream: cameraStreamProvider.fetchCameraDataStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                cameraStreams = snapshot.data.documents
                    .map(
                        (doc) => CameraStream.fromMap(doc.data, doc.documentID))
                    .toList();

                return ListView.builder(
                  itemCount: cameraStreams.length,
                  itemBuilder: (buildContext, index) => CameraStreamVLCCard(
                      cameraStreamInfo: cameraStreams[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
  }
}
