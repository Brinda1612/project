import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();

class Item
{
  Item({
    required this.title,
    required this.amount,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final int amount;


}
