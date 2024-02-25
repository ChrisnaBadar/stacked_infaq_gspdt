import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/widgets/input_field.dart';
import 'package:intl/intl.dart';

class CurrencyInput extends StatefulWidget {
  final TextEditingController amountController;

  const CurrencyInput({super.key, required this.amountController});
  @override
  _CurrencyInputState createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<CurrencyInput> {
  String usdAmountFormatted = "0.00"; // Store the formatted USD amount

  @override
  void initState() {
    super.initState();
    widget.amountController.addListener(() {
      convertCurrency();
    });
  }

  void convertCurrency() {
    String inputText = widget.amountController.text;
    if (inputText.isEmpty) {
      setState(() {
        usdAmountFormatted =
            "0.00"; // Set to default format when input is empty
      });
      return;
    }

    // Remove formatting and extract the numerical value
    String numericsOnly = inputText.replaceAll(RegExp(r'[^0-9]'), '');
    int idrAmount = int.tryParse(numericsOnly) ?? 0;

    // Convert IDR to USD manually (1 USD = 16,000 IDR)
    double usdValue = idrAmount / 16000.0;
    final formatter = NumberFormat('#,##0.0', 'id_ID');
    String formattedUsdAmount = formatter.format(usdValue);

    setState(() {
      usdAmountFormatted =
          formattedUsdAmount; // Update the formatted USD amount
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ... (other widgets)

            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InputField(
                    controller: widget.amountController,
                    hintText: "",
                    inputFormatters: [CurrencyInputFormatter()],
                    textInputType: TextInputType.number,
                    labelText: "Jumlah (IDR)",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                      "in USD: \$ $usdAmountFormatted"), // Display the converted USD amount
                ),
              ],
            ),
            Text(
              "*IDR 16.000 = USD 1.00",
              style: ktsBodyRegular.copyWith(fontSize: 10),
            )

            // ... (other widgets)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.amountController.dispose();
    super.dispose();
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove formatting and extra characters
    String numericsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    int value = int.tryParse(numericsOnly) ?? 0;

    // Format as currency
    final formatter = NumberFormat('#,##0', 'id_ID');
    String newText = formatter.format(value).replaceAll(',', '.');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
