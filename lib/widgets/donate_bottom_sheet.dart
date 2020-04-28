// pop up to allow user to enter donation details

import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';

class DonateBottomSheet extends StatefulWidget {
  @override
  _DonateBottomSheetState createState() => _DonateBottomSheetState();
}

class _DonateBottomSheetState extends State<DonateBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        //top: 5.0,
        left: 10.0,
        right: 10.0,
      ),
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: questionsPageBGColor.withOpacity(0.6),
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Donor details',
                style: TextStyle(
                  color: questionsPageBGColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              DecoratedTextFieldName(),
              SizedBox(
                height: 5.0,
              ),
              DecoratedTextFieldContact(),
              SizedBox(
                height: 5.0,
              ),
              DecoratedTextFieldAmount(),
              SizedBox(
                height: 10.0,
              ),
              PaymentOptions(),
              SizedBox(
                height: 15.0,
              ),
              SheetButton(),
              SizedBox(
                height: 3.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DecoratedTextFieldName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(
            top: 2.0,
          ),
          hintText: 'Full name',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}

class DecoratedTextFieldAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(
            top: 2.0,
          ),
          hintText: 'Donation amount \$',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}

class DecoratedTextFieldContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          focusColor: Colors.blueGrey,
          contentPadding: EdgeInsets.only(
            top: 2.0,
          ),
          hintText: 'Phone number',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}

// mock payment loading
class SheetButton extends StatefulWidget {
  @override
  _SheetButtonState createState() => _SheetButtonState();
}

class _SheetButtonState extends State<SheetButton> {
  bool checkingPayment = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return !checkingPayment
        ? Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: MaterialButton(
              color: questionsPageBGColor,
              minWidth: double.infinity,
              height: 45.0,
              onPressed: () async {
                setState(() {
                  checkingPayment = true;
                });

                await Future.delayed(Duration(seconds: 1));

                setState(() {
                  success = true;
                });

                await Future.delayed(Duration(milliseconds: 500));

                Navigator.pop(context);
              },
              child: Text(
                'Make Donation',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        : !success
            ? CircularProgressIndicator(
                backgroundColor: Colors.black54,
              )
            : Icon(
                Icons.check,
                color: Colors.green,
                size: 40.0,
              );
  }
}

class PaymentOptions extends StatefulWidget {
  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String _option;
  List<String> paymentOptions = [
    'Ecocash',
    'OneMoney',
    'Telecash',
    'ZIPIT',
  ];

  List<DropdownMenuItem<String>> _dropDownPaymentOptions;

  List<DropdownMenuItem<String>> buildDropDownPaymentOptions(List options) {
    List<DropdownMenuItem<String>> paymentOptions = List();

    for (String option in options) {
      paymentOptions.add(
        DropdownMenuItem(
          value: option,
          child: Text(
            option,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return paymentOptions;
  }

  onChangeDropdownItem(String option) {
    setState(() {
      _option = option;
    });
  }

  @override
  void initState() {
    _dropDownPaymentOptions = buildDropDownPaymentOptions(paymentOptions);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: DropdownButton(
          value: _option,
          hint: Text(
            'Payment method',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          items: _dropDownPaymentOptions,
          onChanged: onChangeDropdownItem,
        ),
      ),
    );
  }
}
