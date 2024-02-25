import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/dialogs/donate/currency_input.dart';
import 'package:infaq/ui/dialogs/donate/donate_dialog.form.dart';
import 'package:infaq/ui/widgets/input_field.dart';
import 'package:infaq/ui/widgets/themed_button.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'donate_dialog_model.dart';

const double _graphicSize = 60;

@FormView(fields: [
  FormTextField(name: 'ammount'),
  FormTextField(name: 'name'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'phone'),
  FormTextField(name: 'address'),
  FormTextField(name: 'doa'),
])
class DonateDialog extends StackedView<DonateDialogModel> with $DonateDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  @override
  final TextEditingController nameController = TextEditingController();
  @override
  final TextEditingController lastNameController = TextEditingController();
  @override
  final TextEditingController emailController = TextEditingController();
  @override
  final TextEditingController phoneController = TextEditingController();
  @override
  final TextEditingController addressController = TextEditingController();
  @override
  final TextEditingController doaController = TextEditingController();
  @override
  final TextEditingController ammountController = TextEditingController();
  final TextInputFormatter nameInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"));
  final TextInputFormatter emailInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@._-]"));
  final TextInputFormatter phoneInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[0-9 -()+]"));
  final TextInputFormatter addressInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9.,!? -]"));
  final TextInputFormatter messageInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9.,!? -]"));
  final TextInputFormatter ammountInputFormatter =
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));

  DonateDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DonateDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SizedBox(
              width: kdDesktopMaxContentWidth * .5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Anda akan menitipkan infaq kepada: ${request.title}",
                      style: ktsBodyLarge.copyWith(fontWeight: FontWeight.w800),
                    ),
                    verticalSpace(25),
                    CurrencyInput(
                      amountController: ammountController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputField(
                            controller: nameController,
                            hintText: "Nama",
                            inputFormatters: [nameInputFormatter],
                            textInputType: TextInputType.name,
                            labelText: "*Nama",
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            controller: emailController,
                            hintText: "Email",
                            inputFormatters: [emailInputFormatter],
                            textInputType: TextInputType.emailAddress,
                            labelText: "Email",
                          ),
                        ),
                        // Expanded(
                        //   child: InputField(
                        //     controller: lastNameController,
                        //     hintText: "Nama Akhir",
                        //     inputFormatters: [nameInputFormatter],
                        //     textInputType: TextInputType.name,
                        //     labelText: "Nama Akhir",
                        //   ),
                        // ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: InputField(
                    //         controller: phoneController,
                    //         hintText: "Telepon",
                    //         inputFormatters: [phoneInputFormatter],
                    //         textInputType: TextInputType.phone,
                    //         labelText: "Telepon",
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // InputField(
                    //   controller: addressController,
                    //   hintText: "Alamat",
                    //   inputFormatters: [addressInputFormatter],
                    //   textInputType: TextInputType.streetAddress,
                    //   labelText: "Alamat",
                    //   maxLines: 5,
                    // ),
                    InputField(
                      controller: doaController,
                      hintText: "Doa",
                      inputFormatters: [messageInputFormatter],
                      textInputType: TextInputType.text,
                      labelText: "Doa",
                      maxLines: 3,
                    ),
                    Text(
                      "(*) Tidak boleh kosong",
                      style: ktsBodyRegular.copyWith(
                          fontSize: 9, color: Colors.red),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ThemedButton(
                        onPressed: () {
                          if (ammountController.text.isEmpty ||
                              nameController.text.isEmpty) {
                            // Show an alert or a Snackbar if the field is empty
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Nominal Infaq & Nama harus di isi')),
                            );
                          } else {
                            String cleanedInput = ammountController.text
                                .replaceAll(RegExp(r'[^\d,]'), '');
                            if (cleanedInput.contains(',')) {
                              cleanedInput = cleanedInput.split(',')[0];
                            }
                            print(
                                "id: ${request.data} \nNama: ${nameController.text} \nNominal: $cleanedInput \nKontak: ${phoneController.text} \nDoa: ${doaController.text}");
                            viewModel.postDonationData(
                                nama: nameController.text,
                                nominal: cleanedInput,
                                kontak: emailController.text,
                                pesan: doaController.text,
                                id: request.data);

                            completer(DialogResponse(
                              confirmed: true,
                            ));
                          }
                        },
                        buttonText: "INFAQ"),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10, // Adjust the top position as needed
            right: 10, // Adjust the right position as needed
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                completer(DialogResponse(
                  confirmed: true,
                ));
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  DonateDialogModel viewModelBuilder(BuildContext context) =>
      DonateDialogModel();

  @override
  void onViewModelReady(DonateDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove existing formatting and extra characters
    String numericsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    int value = int.tryParse(numericsOnly) ?? 0;

    // Format as currency
    final formatter = NumberFormat(
        '#,##0', 'id_ID'); // Indonesian locale for dot as thousand separator
    String newText = formatter.format(value).replaceAll(',', '.');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
