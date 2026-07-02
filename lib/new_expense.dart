import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();

  void _presentDataSelect() {
    final now = DateTime.now();
    final first=DateTime(now.year-1);
    final last = DateTime(now.year+1, now.month, now.day + 3);

    showDatePicker(context: context, firstDate: first, lastDate: last);
  }

  @override
  void dispose() {
    _ammountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ammountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Enter your ammount"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Pick a Date"),
                    IconButton(
                      onPressed:_presentDataSelect,
                      icon: Icon(Icons.calendar_month_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_ammountController.text);
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
