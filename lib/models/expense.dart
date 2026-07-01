import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

final uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
};

class Expense {
  Expense({
    required this.title,
    required this.ammount,
    required this.category,
    required this.date,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double ammount;
  final Category category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
