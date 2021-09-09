import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreApiService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String path;
  CollectionReference ref;

  FireStoreApiService(this.path) {
    ref = firestore.collection(path);
  }

  Future<QuerySnapshot> getAllCameraStreams() {
    return ref.get();
  }

  Stream<QuerySnapshot> getStreamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getCameraStreamById(String id) {
    return ref.doc(id).get();
  }

  Future<void> removeCameraStream(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addCameraStream(Map data) {
    return ref.add(data);
  }

  Future<void> updateCameraStream(Map data, String id) {
    return ref.doc(id).update(data);
  }
}
