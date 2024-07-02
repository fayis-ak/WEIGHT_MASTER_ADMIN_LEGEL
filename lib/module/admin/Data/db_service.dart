import 'dart:developer';
import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/buy_product_model.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/cartmodel.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/feedback_model.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/product_model.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/service_model.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/user_model.dart';
import 'package:weigh_master_admin/module/admin/Data/Model/warrenty_claim_model.dart';

class DbService with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  Uint8List? imageBytes;
  bool processingImage = false;
  FirebaseStorage fs = FirebaseStorage.instance;
  SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
  final now = DateTime.now();
  Blob? blob;
  String? imageurl;
  pickImageinWeb() {
    print("In");
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    processingImage = true;
    notifyListeners();
    FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';

    input.click();

    input.onChange.listen((event) {
      final file = input.files?.first;
      if (file != null) {
        final reader = FileReader();

        reader.readAsArrayBuffer(file);

        reader.onLoadEnd.listen((event) async {
          Uint8List data = Uint8List.fromList(reader.result as List<int>);

          imageBytes = data;

          // blob = Blob(data);
          log(blob.toString());
          processingImage = false;
          notifyListeners();
          try {
            print("1111111111111111111");
            final now = DateTime.now();
            var snapshot = await fs
                .ref()
                .child("productImage/$now")
                .putData(data, metadata);
            print("2222222222222222");
            String downloadUrl = await snapshot.ref.getDownloadURL();
            print("33333333333333333333");
            imageurl = downloadUrl;
            print("=====${imageurl}====");
            print(downloadUrl);
          } catch (error) {
            print('Error uploading image to Firebase Storage: $error');
          }
        });
      }
    });
  }

  Future storeProduct(ProductModel productModel) async {
    final doc = db.collection("Product Data").doc();

    doc.set(productModel.toHson(doc.id));
  }

//---------------------------------
// Future addUser(uid, UserModel userModel) async {
//     db.collection("User Collection").doc(uid).set(userModel.toJson());
//   }

  getProducts(String type) {
    return db
        .collection("Product Data")
        .where("type", isEqualTo: type)
        .snapshots();
  }

  List<ProductModel> productLists = [];
  Future<QuerySnapshot<Map<String, dynamic>>> getAllProduct() async {
    return await db.collection("Product Data").get();
    // log(snapho.docs.length.toString());
    // productLists =
    //     snapho.docs.map((e) => ProductModel.fromJson(e.data())).toList();
  }

  // List<BuyProductModel> listOfBuy = [];
  List<Map<String, dynamic>> listOfBuy = [];
  Future getAllBroughtProduct() async {
    final snapshot = await db.collection("My Orders").get();

    listOfBuy = snapshot.docs.map((e) {
      return e.data();
    }).toList();
  }

  // addFeedBack(FeedbackModel feedbackModel) async {
  //   final docs = db.collection("Feedback").doc();
  //   docs.set(feedbackModel.toJson(docs.id));
  // }

  List<FeedbackModel> listOFFeedback = [];
  Future getAllFeedBack() async {
    Stream<QuerySnapshot> snapshot = db.collection("Feedback").snapshots();
    // List<FeedbackModel> list = [];
    return snapshot.listen((event) {
      listOFFeedback = event.docs.map((doc) {
        return FeedbackModel.fromjson(doc.data() as Map<String, dynamic>);
      }).toList();
      // notifyListeners();
      // listOFFeedback = List.from(list);
    });
  }

  deletReview(id) async {
    await db.collection("Feedback").doc(id).delete();
    notifyListeners();
  }

  // Future addNewWarrenty(WarrentyClaimModel warrentyClaimModel, buyId) async {
  //   await db.collection("Warrenty Claim").doc(buyId).set(
  //       warrentyClaimModel.toJson(buyId, warrentyClaimModel.buymodel.buyId));
  // }

  // List<WarrentyClaimModel> warrentyHistory = [];
  List<Map<String, dynamic>> warrentyHistory = [];
  Future getWarrentyHistory() async {
    final snapshot = await db.collection("Warrenty Claim").get();
    // log(snap.docs.length.toString());
    // warrentyHistory =
    //     snap.docs.map((e) => WarrentyClaimModel.fromjson(e.data())).toList();
    warrentyHistory = snapshot.docs.map((e) {
      return e.data();
    }).toList();
  }

  // Future addAppoinment(ServiceModel serviceModel, buyId) async {
  //   await db
  //       .collection("Service Appoinments")
  //       .doc(buyId)
  //       .set(serviceModel.toJson(buyId, serviceModel.buymodel.buyId));
  // }

  // List<ServiceModel> serviceHistory = [];
  List<Map<String, dynamic>> serviceHistory = [];
  Future getServiceHistory() async {
    final snapshot = await db.collection("Service Appoinments").get();

    serviceHistory = snapshot.docs.map((e) {
      return e.data();
    }).toList();
  }

  Stream<QuerySnapshot> getAllusers() {
    return db.collection('User Collection').snapshots();
  }

  // Stream<QuerySnapshot> getService() {
  //   return db.collection('Service Appoinments').snapshots();
  // }
  List<Map<String, dynamic>> servicemap = [];
  Future getService() async {
    final snapshot = await db.collection('Service Appoinments').get();

    servicemap = snapshot.docs.map((e) {
      return e.data();
    }).toList();
  }

  List<BuyProductModel> userlistproduct = [];
  List<Map<String, dynamic>> userlistproMap = [];
  Future getMyBroughtProduct(doc) async {
    final snapshot =
        await db.collection("My Orders").where("uid", isEqualTo: doc).get();

    // log(snapshot.docs.length.toString());

    userlistproMap = snapshot.docs.map((e) {
      log("hhhhh");
      print(e.data().toString());
      return e.data();
    }).toList();
    log("========================${userlistproMap.length}");
  }

  List<Map<String, dynamic>> warentymap = [];
  Future getWarenty() async {
    final snapshot = await db.collection('Warrenty Claim').get();

    warentymap = snapshot.docs.map((e) {
      return e.data();
    }).toList();
  }

  Future updateStatus(docid) async {
    FirebaseFirestore.instance.collection('Warrenty Claim').doc(docid).update({
      'status': 'Accept',
    });
    notifyListeners();
  }

   Future updateService(docid) async {
    FirebaseFirestore.instance.collection('Service Appoinments').doc(docid).update({
      'status': 'Accept',
    });
    notifyListeners();
  }
}
