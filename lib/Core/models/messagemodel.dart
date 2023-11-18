class MessageModel {
  late String? senderid, receiverid, datetime, text;
  String? image;
  MessageModel(
      {this.senderid, this.receiverid, this.datetime, this.text, this.image});

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderid = json['senderid'];
    receiverid = json['receiverid'];
    datetime = json['datetime'];
    text = json['text'];
    image = json['Image'];
  }

  Map<String, dynamic> tomap() {
    return {
      'senderid': senderid,
      'receiverid': receiverid,
      'datetime': datetime,
      'text': text,
      'Image': image??"",
    };
  }
}
