import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/utilModel.dart';


Future<Map<String, Set>> getUserMessages() async {
  final String? currentAuthUser = await getCurrentUserEmail();
  if (currentAuthUser == null){
    return {};
  }
  
  FirebaseFirestore instance = FirebaseFirestore.instance;
  CollectionReference messageCollection = instance.collection("messages");
  
  QuerySnapshot currentUserSendMessages = await messageCollection.where("message_from", isEqualTo: currentAuthUser).get();
  QuerySnapshot currentUserRecvMessages = await messageCollection.where("message_to", isEqualTo: currentAuthUser).get();

  final List<dynamic> allUserMessages = [];
  allUserMessages.addAll(currentUserSendMessages.docs);
  allUserMessages.addAll(currentUserRecvMessages.docs);

  int conversationAutoIncrement = 0;
  Map<int, String> conversationParticipants = {};

  currentUserSendMessages.docs.forEach((doc) {
    String conversationParticipant = doc['message_to'];
    if (!conversationParticipants.values.contains(conversationParticipant)){
      conversationParticipants[conversationAutoIncrement] = conversationParticipant;
      conversationAutoIncrement++;
    }
  });

  currentUserRecvMessages.docs.forEach((doc) {
    String conversationParticipant = doc['message_from'];
    if (!conversationParticipants.values.contains(conversationParticipant)){
      conversationParticipants[conversationAutoIncrement] = conversationParticipant;
      conversationAutoIncrement++;
    }
  });

  List<String> conversationParticipantList = conversationParticipants.values.toList();

  Map<String, Set> conversationMessages = {};

  conversationParticipantList.forEach((conversationParticipantId){
     conversationMessages[conversationParticipantId] = {};
  });

  allUserMessages.forEach((userMessage){
    if (userMessage['message_from'] == currentAuthUser){
      String msgReciever = userMessage['message_to'];
      conversationMessages[msgReciever]!.add(userMessage);
    }
    if (userMessage['message_to'] == currentAuthUser){
      String msgRecipient = userMessage['message_from'];
      conversationMessages[msgRecipient]!.add(userMessage);
    }
  });

  conversationParticipantList.forEach((conversationPart) {
    Set? messageSet = conversationMessages[conversationPart];
    if (messageSet != null){
      List<dynamic> messageList = messageSet.toList();
      messageList.sort((prev_message, curr_message){
        return prev_message['timestamp'].compareTo(curr_message['timestamp']);
      });
      messageSet = messageList.toSet();
      conversationMessages[conversationPart] = messageSet;
    }
  });

  return conversationMessages;
}