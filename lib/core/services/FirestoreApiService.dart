import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreApiService {
  final Firestore firestore = Firestore.instance;
  final String path;
  CollectionReference ref;

  FireStoreApiService(this.path) {
    ref = firestore.collection(path);
  }

  Future<QuerySnapshot> getAllCameraStreams() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> getStreamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getCameraStreamById(String id) {
    return ref.document(id).get();
  }

  Future<void> removeCameraStream(String id) {
    return ref.document(id).delete();
  }

  Future<DocumentReference> addCameraStream(Map data) {
    return ref.add(data);
  }

  Future<void> updateCameraStream(Map data, String id) {
    return ref.document(id).updateData(data);
  }
}
