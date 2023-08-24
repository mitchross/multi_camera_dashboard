import 'package:flutter/material.dart';
import 'package:muticam_dashboard/core/models/CameraStream.dart';
import 'package:muticam_dashboard/ui/views/CameraStreamDetails.dart';

class CameraStreamCard extends StatelessWidget {
  final CameraStream cameraStreamDetails;

  CameraStreamCard({required this.cameraStreamDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CameraStreamDetails(
                      cameraStream: cameraStreamDetails,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: cameraStreamDetails.id!,
                  child: Image.asset(
                    'assets/camera.svg',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(cameraStreamDetails.cameraStreamTitle ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
