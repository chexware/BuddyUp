class Message {
  final String senderId;
  final String requestId;
  final DateTime createdAt;
  final String text;
 
  Message(this.requestId, this.senderId, this.createdAt, this.text);
}