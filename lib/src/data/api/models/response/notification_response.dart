class NotificationRespone {
/*
{
  "title": "Received 2000",
  "message": "You have received 2000 from Test Ne",
  "url": null,
  "type": 0,
  "id": 5,
  "createdAt": "2022-12-16T05:10:46.062637",
  "modifiedAt": "0001-01-01T00:00:00"
}
*/

  String? title;
  String? message;
  String? url;
  String? type;
  String? id;
  String? createdAt;
  String? modifiedAt;

  NotificationRespone({
    this.title,
    this.message,
    this.url,
    this.type,
    this.id,
    this.createdAt,
    this.modifiedAt,
  });
  NotificationRespone.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    message = json['message']?.toString();
    url = json['url']?.toString();
    type = json['type']?.toString();
    id = json['id']?.toString();
    createdAt = json['createdAt']?.toString();
    modifiedAt = json['modifiedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['url'] = url;
    data['type'] = type;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}
