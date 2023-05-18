import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpenseHandler, {Key? key}) : super(key: key);
  final Function addExpenseHandler;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.business;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitExpenseData() {
    final inputTitle = _titleController.text.trim();
    final inputAmt = double.parse(_amountController.text);

    if (inputTitle.isEmpty || inputAmt <= 0 || _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text(
                  "Invalid Input",
                  textAlign: TextAlign.center,
                ),
                content: const Text(
                  "Please enter valid expense amount with motif and pick a date",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }


    widget.addExpenseHandler(Expense(title: _titleController.text,
        amount: double.parse(_amountController.text), date: _selectedDate!, category: _selectedCategory));
    Navigator.of(context).pop();
  }

  void _datePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Expense motif")),
            controller: _titleController,
            onSubmitted: (_) => _submitExpenseData(),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', label: Text("Expense amount")),
                  controller: _amountController,
                  onSubmitted: (_) => _submitExpenseData(),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No date Selected"
                          : DateFormat.yMMMd().format(_selectedDate!),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(
                        Icons.date_range,
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text(
                  'Add Expense',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
