import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { health, career, nutrition, business, spirituality, leisure }

const categoryIcons = {
  Category.health: Icons.health_and_safety,
  Category.career: Icons.work,
  Category.nutrition: Icons.lunch_dining,
  Category.business: Icons.business,
  Category.spirituality: Icons.sports_gymnastics,
  Category.leisure: Icons.movie
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return DateFormat.yMMMd().format(date);
  }


  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
}
