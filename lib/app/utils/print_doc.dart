// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/view_model/home_page_view_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'my_strings.dart';

////
buildPrint(
  HomePageViewModel homePageViewModel,
  BuildContext context,
  String venueName,
  pw.Font font,
) {
  List<pw.Widget> widgets = [];
  final sizedBox10 = pw.SizedBox(
    height: 20.0,
  );
  final textBookDetails = pw.Center(
    child: pw.Text(
      bookingDetails,
      style: pw.TextStyle(
          color: PdfColors.black,
          font: font,
          fontSize: 16.0,
          fontWeight: pw.FontWeight.normal),
    )
  );
  final textValid = pw.Center(child: pw.Text(validForOne,
      style: pw.TextStyle(
          color: PdfColors.grey,
          font: font,
          fontSize: 16.0,
          fontWeight: pw.FontWeight.normal)));
  final list = pw.ListView.builder(
      itemCount: homePageViewModel.ticketInfoResponseModel!.qrResponses!.length,
      direction: pw.Axis.vertical,
      itemBuilder: (ctx, index) {
        return pw.Column(
          mainAxisSize: pw.MainAxisSize.min,
          children: [
            pw.SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.9,
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Image(
                    pw.MemoryImage(homePageViewModel.pngBytes[index]),
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.SizedBox(
                          height: 40.0,
                          child: pw.Row(children: [
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                date,
                                softWrap: true,
                                textAlign: pw.TextAlign.left,
                                style: pw.TextStyle(
                                    color: PdfColors.grey,
                                    font: font,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                AppConfig.date.format(AppConfig.now),
                                textAlign: pw.TextAlign.right,
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColors.black,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                          ]),
                        ),
                        pw.SizedBox(
                          height: 40.0,
                          child: pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                              children: [
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                checkIn,
                                softWrap: true,
                                textAlign: pw.TextAlign.left,
                                style: pw.TextStyle(
                                    color: PdfColors.grey,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                AppConfig.date.format(AppConfig.now),
                                textAlign: pw.TextAlign.right,
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    font: font,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                          ]),
                        ),
                        pw.SizedBox(
                          height: 40.0,
                          child: pw.Row( crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,children: [
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                paymentType,
                                softWrap: true,
                                textAlign: pw.TextAlign.left,
                                style: pw.TextStyle(
                                    color: PdfColors.grey,
                                    font: font,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                !homePageViewModel.cashClicked ? cash : card,
                                textAlign: pw.TextAlign.right,
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    font: font,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                          ]),
                        ),
                        pw.SizedBox(
                          height: 40.0,
                          child: pw.Row( crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,children: [
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                venue,
                                softWrap: true,
                                textAlign: pw.TextAlign.left,
                                style: pw.TextStyle(
                                    color: PdfColors.grey,
                                    font: font,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                            pw.SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: pw.Text(
                                venueName,
                                textAlign: pw.TextAlign.right,
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    font: font,
                                    fontSize: 16.0,
                                    fontWeight: pw.FontWeight.normal),
                              ),
                            ),
                          ]),
                        ),
                      ])
                ],
              ),
            ),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.SizedBox(
                    width: 100.0,
                    child: pw.Text(
                        homePageViewModel.ticketInfoResponseModel!
                            .qrResponses![index].ticketName!,
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            font: font,
                            fontSize: 18.0,
                            fontWeight: pw.FontWeight.normal))),
                pw.Container(
                    decoration:
                        const pw.BoxDecoration(boxShadow: <pw.BoxShadow>[
                      pw.BoxShadow(
                        color: PdfColors.black,
                        blurRadius: 15.0,
                      )
                    ]),
                    child: pw.Center(child: pw.Text('1'))),
                pw.Container(
                    decoration:
                        const pw.BoxDecoration(boxShadow: <pw.BoxShadow>[
                      pw.BoxShadow(
                        color: PdfColors.black,
                        blurRadius: 15.0,
                      )
                    ]),
                    child: pw.Center(
                        child: pw.Text(homePageViewModel
                            .ticketInfoResponseModel!.qrResponses![index].amount
                            .toString())))
              ],
            ),
          ],
        );
      });

  //////////////////////////////////////
  widgets.add(sizedBox10);
  widgets.add(textBookDetails);
  widgets.add(sizedBox10);
  widgets.add(textValid);
  widgets.add(sizedBox10);
  widgets.add(list);

  return widgets;
}
