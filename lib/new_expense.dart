import 'package:flutter/material.dart';
import 'package:flutter_section5/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onaddExpense});

  final void Function(Expense expense) onaddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();
  DateTime? _selectDate;
  Category _selectCategory = Category.work;

  void _presentDateSelect() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1);
    final last = DateTime(now.year + 1, now.month, now.day + 3);

    final presentDate = await showDatePicker(
      context: context,
      firstDate: first,
      lastDate: last,
    );
    setState(() {
      _selectDate = presentDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmmount = double.tryParse(_ammountController.text);
    final inValidText = _titleController.text.trim().isEmpty;
    final invalidAmmoount = enteredAmmount == null || enteredAmmount <= 0;
    if (invalidAmmoount || inValidText || _selectDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Invalid Input"),
          content: Text(
            "Your Entered Title or Ammount or Date can be Invalid, Please Check For that !!",
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Close"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onaddExpense(
      Expense(
        title: _titleController.text,
        ammount: enteredAmmount,
        category: _selectCategory,
        date: _selectDate!,
      ),
    );
    Navigator.pop(context);
    
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
                    Text(
                      _selectDate == null
                          ? "select a Date"
                          : formatter.format(_selectDate!),
                    ),
                    IconButton(
                      onPressed: _presentDateSelect,
                      icon: Icon(Icons.calendar_month_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectCategory = value;
                  });
                },
              ),
              Spacer(),
              SizedBox(height: 8),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
