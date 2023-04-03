import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

const kMessages = 'Messages';
const kCreatedAt = 'createdAt';
FirebaseFirestore fireStore = FirebaseFirestore.instance;
CollectionReference messages = fireStore.collection(kMessages);
TextEditingController controller = TextEditingController();
final controller1 = ScrollController();
