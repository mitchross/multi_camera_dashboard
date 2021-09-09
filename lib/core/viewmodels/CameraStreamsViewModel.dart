

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:muticam_dashboard/core/models/CameraStream.dart';
import 'package:muticam_dashboard/core/services/FirestoreApiService.dart';

class CameraStreamsViewModel extends ChangeNotifier {
  FireStoreApiService firestoreAPI = GetIt.I<FireStoreApiService>();
  List<CameraStream> cameraStreams;

  Future<List<CameraStream>> fetchCameraStreams() async {
    var result = await firestoreAPI.getAllCameraStreams();

    cameraStreams = result.docs
        .map((doc) => CameraStream.fromMap(doc.data(), doc.id))
        .toList();
    return cameraStreams;
  }

  Stream<QuerySnapshot> fetchCameraDataStream() {
    return firestoreAPI.getStreamDataCollection();
  }

  Future<CameraStream> getCameraStreambyID(String id) async {
    var doc = await firestoreAPI.getCameraStreamById(id);
    return CameraStream.fromMap(doc.data(), doc.id);
  }

  Future removeCameraStreamByID(String id) async {
    await firestoreAPI.removeCameraStream(id);
    return;
  }

  Future updateCameraStreamByID(CameraStream data, String id) async {
    await firestoreAPI.updateCameraStream(data.toJson(), id);
    return;
  }

  Future addCameraStream(CameraStream data) async {
    var result = await firestoreAPI.addCameraStream(data.toJson());

    return;
  }
}
