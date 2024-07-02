import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfTextStyles {
  static final titleGreen = pw.TextStyle(
      color: const PdfColor.fromInt(0xff00A64F),
      fontSize: 14,
      fontWeight: pw.FontWeight.bold);

  static final titleGreenLarge = pw.TextStyle(
      color: const PdfColor.fromInt(0xff00A64F),
      fontSize: 16,
      fontWeight: pw.FontWeight.bold);

  static final smallGrey = pw.TextStyle(
      color: const PdfColor.fromInt(0xff737373),
      fontSize: 10,
      fontStyle: pw.FontStyle.normal);

  static const defaultGrey = pw.TextStyle(
    color: PdfColor.fromInt(0xff737373),
    fontSize: 12,
  );
  static final defaultBold = pw.TextStyle(
    color: PdfColors.black,
    fontSize: 12,
    fontWeight: pw.FontWeight.bold,
  );
  static const defaultBlack = pw.TextStyle(
    fontSize: 12,
  );

  static const smalltBlack = pw.TextStyle(
    color: PdfColors.black,
    fontSize: 10,
  );
}

Future<Uint8List> generatePdf(
    {required String name,
    required String whatsappNumber,
    required String address,
    required String location,
    required String branch,
    required String treatment,
    required int numberOfMale,
    required int numberOfFemale,
    required String totalAmount,
    required String discountAmount,
    required String advanceAmount,
    required String balanceAmount,
    required String treatmentDate,
    required String paymentOption,
    required String date,
    required String time}) async {
  final pdf = pw.Document();

  final logo = pw.MemoryImage(
    (await rootBundle.load('asset/logo/Layer_1-2.png')).buffer.asUint8List(),
  );

  final sign = pw.MemoryImage(
    (await rootBundle.load('asset/image/Vector 1.png')).buffer.asUint8List(),
  );
  final backgroundImage = pw.MemoryImage(
    (await rootBundle.load('asset/image/Group 1171275679.png'))
        .buffer
        .asUint8List(),
  );

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(logo, width: 70, height: 70),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    Text(branch, style: PdfTextStyles.smalltBlack),
                    pw.Text('Cheepunkal P.O. Kumarakom,',
                        style: PdfTextStyles.smallGrey),
                    pw.Text('Kottayam, Kerala - 686563',
                        style: PdfTextStyles.smallGrey),
                    pw.Text('E-mail: unknown@gmail.com',
                        style: PdfTextStyles.smallGrey),
                    pw.Text('Mob: +91 9876543210 | +91 9786543210',
                        style: PdfTextStyles.smallGrey),
                    pw.Text('GST No: 32AABCU9603R1ZW',
                        style: PdfTextStyles.smalltBlack),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            pw.Divider(color: const PdfColor.fromInt(0xff9A9A9A)),
            pw.Container(
              decoration: pw.BoxDecoration(
                image: pw.DecorationImage(
                  image: backgroundImage,
                  fit: pw.BoxFit.fill,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                          flex: 1,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Text('Patient Details',
                                          style: PdfTextStyles.titleGreen),
                                      SizedBox(height: 8),
                                      Text('Name',
                                          style: PdfTextStyles.smalltBlack),
                                      SizedBox(height: 8),
                                      Text('Address',
                                          style: PdfTextStyles.smalltBlack),
                                      SizedBox(height: 8),
                                      Text('WhatsApp Number',
                                          style: PdfTextStyles.smalltBlack),
                                    ])),
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      SizedBox(height: 16),
                                      SizedBox(height: 8),
                                      Text(name,
                                          style: PdfTextStyles.smallGrey),
                                      SizedBox(height: 8),
                                      Text(
                                          address.length > 20
                                              ? "${address.substring(0, 20)}.."
                                              : address,
                                          style: PdfTextStyles.smallGrey),
                                      SizedBox(height: 8),
                                      Text(whatsappNumber,
                                          style: PdfTextStyles.smallGrey),
                                    ]))
                              ])),
                      Expanded(
                          flex: 1,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      SizedBox(height: 16),
                                      SizedBox(height: 8),
                                      Text('Booked On',
                                          style: PdfTextStyles.smalltBlack),
                                      SizedBox(height: 8),
                                      Text('Treatment Date',
                                          style: PdfTextStyles.smalltBlack),
                                      SizedBox(height: 8),
                                      Text('Treatment Time',
                                          style: PdfTextStyles.smalltBlack),
                                    ])),
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      SizedBox(height: 16),
                                      SizedBox(height: 8),
                                      Row(children: [
                                        Text("$date  |",
                                            style: PdfTextStyles.smallGrey),
                                        Text(_formatTime('  $time'),
                                            style: PdfTextStyles.smallGrey)
                                      ]),
                                      SizedBox(height: 8),
                                      Text(date,
                                          style: PdfTextStyles.smallGrey),
                                      SizedBox(height: 8),
                                      Text(_formatTime(time),
                                          style: PdfTextStyles.smallGrey),
                                    ]))
                              ]))
                    ]),
                    SizedBox(height: 8),
                    Divider(
                        borderStyle: BorderStyle.dashed,
                        color: const PdfColor.fromInt(0xff9A9A9A)),
                    SizedBox(height: 8),

                    //------------------------ //

                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Treatment',
                                                  style:
                                                      PdfTextStyles.titleGreen),
                                              SizedBox(height: 8),
                                              Text(treatment,
                                                  style: PdfTextStyles
                                                      .defaultGrey),
                                              SizedBox(height: 8),
                                            ])),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('Price',
                                                  style:
                                                      PdfTextStyles.titleGreen),
                                              SizedBox(height: 8),
                                              Text(totalAmount,
                                                  style: PdfTextStyles
                                                      .defaultGrey),
                                            ])),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('Male',
                                                  style:
                                                      PdfTextStyles.titleGreen),
                                              SizedBox(height: 8),
                                              Text(numberOfFemale.toString(),
                                                  style: PdfTextStyles
                                                      .defaultGrey),
                                            ])),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('Female',
                                                  style:
                                                      PdfTextStyles.titleGreen),
                                              SizedBox(height: 8),
                                              Text(numberOfFemale.toString(),
                                                  style: PdfTextStyles
                                                      .defaultGrey),
                                            ])),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text('Total',
                                                  style:
                                                      PdfTextStyles.titleGreen),
                                              SizedBox(height: 8),
                                              Text("₹$totalAmount",
                                                  style: PdfTextStyles
                                                      .defaultGrey),
                                            ]))
                                  ])),
                        ]),
                    Divider(borderStyle: BorderStyle.dashed),

                    Row(children: [
                      Expanded(flex: 5, child: SizedBox()),
                      Expanded(
                        flex: 2,
                        child: Column(children: [
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Amount',
                                    style: PdfTextStyles.defaultBold),
                                SizedBox(width: 15),
                                Text('₹$totalAmount',
                                    style: PdfTextStyles.defaultBold),
                              ]),
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Discount',
                                    style: PdfTextStyles.defaultGrey),
                                Text('₹$discountAmount',
                                    style: PdfTextStyles.defaultGrey)
                              ]),
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Advance',
                                    style: PdfTextStyles.defaultGrey),
                                Text('₹$advanceAmount',
                                    style: PdfTextStyles.defaultGrey)
                              ]),
                          SizedBox(height: 8),
                          Divider(
                              borderStyle: BorderStyle.dashed,
                              color: const PdfColor.fromInt(0xff737373)),
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Balance',
                                    style: PdfTextStyles.defaultBold),
                                Text(balanceAmount,
                                    style: PdfTextStyles.defaultBold)
                              ]),
                        ]),
                      )
                    ]),
                    SizedBox(height: 40),
                    Row(children: [
                      Expanded(flex: 5, child: SizedBox()),
                      Expanded(
                        flex: 6,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Thank you for choosing us',
                                  style: PdfTextStyles.titleGreenLarge),
                              SizedBox(height: 8),
                              Text(
                                  'Your well-being is our commitment, and we\'re honored you\'ve entrusted us with your health journey',
                                  style: PdfTextStyles.smallGrey),
                              SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 10),
                                    pw.Image(sign, width: 90, height: 90),
                                  ])
                            ]),
                      ),
                    ]),
                    SizedBox(height: 90),
                    Divider(
                        borderStyle: BorderStyle.dashed,
                        color: const PdfColor.fromInt(0xff737373)),
                    Text(
                        'Booking amount is non-refundable, and it\'s important to arrive on the allotted time for your treatment',
                        style: PdfTextStyles.smallGrey)
                  ]),
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}

String _formatTime(String time) {
  final timeParts = time.split(':');
  final int hour = int.parse(timeParts[0]);
  final int minute = int.parse(timeParts[1]);

  if (hour < 10 || hour > 21) {
    return '';
  }

  final String period = hour >= 12 ? 'PM' : 'AM';

  final int formattedHour = hour > 12 ? hour - 12 : hour;

  final String formattedTime =
      '${formattedHour == 0 ? 12 : formattedHour}:${minute.toString().padLeft(2, '0')} $period';

  return formattedTime;
}
