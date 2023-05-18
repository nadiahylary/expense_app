import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final inputTitle = _titleController.text;
    final inputAmt = double.parse(_amountController.text);
    //final amtIsInvalid = inputAmt == null;
    if (inputTitle.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Invalid Input!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.changa(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    )),
                content: Text(
                  "Please enter valid expense amount with motif and pick a date.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Okay',
                          style: GoogleFonts.changa(
                            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 20
                            ),
                          )))
                ],
              )
      );
      return;
    }

    widget.addExpenseHandler(Expense(
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        date: _selectedDate!,
        category: _selectedCategory));
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
            style: GoogleFonts.ubuntu(
              textStyle: Theme.of(context).textTheme.titleSmall,
            ),
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
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                  ),
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
                      style: GoogleFonts.ubuntu(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: Icon(
                        Icons.date_range,
                        size: 35,
                        color: Theme.of(context).colorScheme.primary,
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
                          child: Text(
                            category.name.toUpperCase(),
                            style: GoogleFonts.ubuntuCondensed(
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium),
                          )))
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
                child: Text(
                  'Cancel',
                  style: GoogleFonts.changa(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: Text(
                  'Add Expense',
                  style: GoogleFonts.changa(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
