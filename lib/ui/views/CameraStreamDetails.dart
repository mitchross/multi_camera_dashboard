import 'package:flutter/material.dart';
import 'package:muticam_dashboard/core/models/CameraStream.dart';
import 'package:muticam_dashboard/core/viewmodels/CameraStreamsViewModel.dart';
import 'package:muticam_dashboard/ui/views/ModifyCameraStream.dart';
import 'package:provider/provider.dart';

class CameraStreamDetails extends StatelessWidget {
  final CameraStream cameraStream;

  CameraStreamDetails({@required this.cameraStream});

  @override
  Widget build(BuildContext context) {
    var cameraStreamStoreProvider =
        Provider.of<CameraStreamsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Stream Details'),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await cameraStreamStoreProvider
                  .removeCameraStreamByID(cameraStream.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ModifyCameraStream(
                            cameraStream: cameraStream,
                          )));
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: cameraStream.id,
            child: Image.asset(
              'assets/camera.svg',
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            cameraStream.cameraStreamTitle ?? '',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
          Text(
            cameraStream.cameraStreamUrl,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.orangeAccent),
          )
        ],
      ),
    );
  }
}
