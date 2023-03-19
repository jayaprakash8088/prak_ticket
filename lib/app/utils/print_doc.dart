import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/view_model/home_page_view_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'my_strings.dart';

////
buildPrint(HomePageViewModel homePageViewModel, BuildContext context,
    String venueName) {
  return pw.Padding(
    padding: const pw.EdgeInsets.all(20.0),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.SizedBox(
          height: 20.0,
        ),
        pw.Text(
          bookingDetails,
          style: pw.TextStyle(
              color: PdfColors.black,
              fontSize: 16.0,
              fontWeight: pw.FontWeight.normal),
        ),
        pw.SizedBox(
          height: 10.0,
        ),
        pw.Text(validForOne,
            style: pw.TextStyle(
                color: PdfColors.grey,
                fontSize: 16.0,
                fontWeight: pw.FontWeight.normal)),
        pw.SizedBox(
          height: 10.0,
        ),

        // generating list of tickets
        pw.ListView.builder(
            itemCount: 2,
            direction: pw.Axis.vertical,
            itemBuilder: (ctx, index) {
              return pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: pw.Row(
                      children: [
                        pw.Image(
                          pw.MemoryImage(homePageViewModel.pngBytes[0]),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: pw.Text(
                                      date,
                                      softWrap: true,
                                      textAlign: pw.TextAlign.left,
                                      style: pw.TextStyle(
                                          color: PdfColors.grey,
                                          fontSize: 16.0,
                                          fontWeight: pw.FontWeight.normal),
                                    ),
                                  ),
                                  pw.SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: pw.Text(
                                      AppConfig.date.format(AppConfig.now),
                                      textAlign: pw.TextAlign.right,
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 16.0,
                                          fontWeight: pw.FontWeight.normal),
                                    ),
                                  ),
                                ]),
                              ),
                              pw.SizedBox(
                                height: 40.0,
                                child: pw.Row(children: [
                                  pw.SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
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
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: pw.Text(
                                      AppConfig.date.format(AppConfig.now),
                                      textAlign: pw.TextAlign.right,
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 16.0,
                                          fontWeight: pw.FontWeight.normal),
                                    ),
                                  ),
                                ]),
                              ),
                              pw.SizedBox(
                                height: 40.0,
                                child: pw.Row(children: [
                                  pw.SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: pw.Text(
                                      paymentType,
                                      softWrap: true,
                                      textAlign: pw.TextAlign.left,
                                      style: pw.TextStyle(
                                          color: PdfColors.grey,
                                          fontSize: 16.0,
                                          fontWeight: pw.FontWeight.normal),
                                    ),
                                  ),
                                  pw.SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: pw.Text(
                                      !homePageViewModel.cashClicked
                                          ? cash
                                          : card,
                                      textAlign: pw.TextAlign.right,
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 16.0,
                                          fontWeight: pw.FontWeight.normal),
                                    ),
                                  ),
                                ]),
                              ),
                              pw.SizedBox(
                                height: 40.0,
                                child: pw.Row(children: [
                                  pw.SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: pw.Text(
                                      venue,
                                      softWrap: true,
                                      textAlign: pw.TextAlign.left,
                                      style: pw.TextStyle(
                                          color: PdfColors.grey,
                                          fontSize: 16.0,
                                          fontWeight: pw.FontWeight.normal),
                                    ),
                                  ),
                                  pw.SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: pw.Text(
                                      venueName,
                                      textAlign: pw.TextAlign.right,
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
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
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.SizedBox(
                          width: 100.0,
                          child: pw.Text(
                              homePageViewModel
                                  .saveTicketInfo!.ticketTypes![0].name!,
                              style: pw.TextStyle(
                                  color: PdfColors.black,
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
                          child: pw.Center(
                              child: pw.Text(homePageViewModel
                                  .saveTicketInfo!.ticketTypes![0].quantity!
                                  .toString()))),
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
                                  .saveTicketInfo!.ticketTypes![0].amount!
                                  .toString())))
                    ],
                  ),
                ],
              );
            }),
        //      pw.Column(
        //        crossAxisAlignment: pw.CrossAxisAlignment.center,
        //        children: [
        //          pw.SizedBox(
        //            height: 40.0,
        //            child: pw.Row(
        //                children: [
        //                  pw.SizedBox(
        //                    width: MediaQuery.of(context).size.width * 0.42,
        //                    child: pw.Text(
        //                      date,
        //                      softWrap: true,
        //                      textAlign: pw.TextAlign.left,
        //                      style: pw.TextStyle(
        //                          color: PdfColors.grey,
        //                          fontSize: 16.0,
        //                          fontWeight: pw.FontWeight.normal),
        //                    ),
        //                  ),
        //                  pw.SizedBox(
        //                    width: MediaQuery.of(context).size.width * 0.42,
        //                    child: pw.Text(
        //                      AppConfig.date.format(AppConfig.now),
        //                      textAlign: pw.TextAlign.right,
        //                      style: pw.TextStyle(
        //                          color: PdfColors.black,
        //                          fontSize: 16.0,
        //                          fontWeight: pw.FontWeight.normal),
        //                    ),
        //                  ),
        //                ]),
        //          ),
        //          pw.SizedBox(
        //            height: 40.0,
        //            child: pw.Row(children: [
        //              pw.SizedBox(
        //                width: MediaQuery.of(context).size.width * 0.42,
        //                child: pw.Text(
        //                  checkIn,
        //                  softWrap: true,
        //                  textAlign: pw.TextAlign.left,
        //                  style: pw.TextStyle(
        //                      color: PdfColors.grey,
        //                      fontSize: 16.0,
        //                      fontWeight: pw.FontWeight.normal),
        //                ),
        //              ),
        //              pw.SizedBox(
        //                width: MediaQuery.of(context).size.width * 0.42,
        //                child: pw.Text(
        //                  AppConfig.date.format(AppConfig.now),
        //                  textAlign: pw.TextAlign.right,
        //                  style: pw.TextStyle(
        //                      color: PdfColors.black,
        //                      fontSize: 16.0,
        //                      fontWeight: pw.FontWeight.normal),
        //                ),
        //              ),
        //            ]),
        //          ),
        //          pw.SizedBox(
        //            height: 40.0,
        //            child: pw.Row(children: [
        //              pw.SizedBox(
        //                width: MediaQuery.of(context).size.width * 0.42,
        //                child: pw.Text(
        //                  paymentType,
        //                  softWrap: true,
        //                  textAlign: pw.TextAlign.left,
        //                  style: pw.TextStyle(
        //                      color: PdfColors.grey,
        //                      fontSize: 16.0,
        //                      fontWeight: pw.FontWeight.normal),
        //                ),
        //              ),
        //              pw.SizedBox(
        //                width: MediaQuery.of(context).size.width * 0.42,
        //                child: pw.Text(
        //                  !homePageViewModel.cashClicked ? cash : card,
        //                  textAlign: pw.TextAlign.right,
        //                  style: pw.TextStyle(
        //                      color: PdfColors.black,
        //                      fontSize: 16.0,
        //                      fontWeight: pw.FontWeight.normal),
        //                ),
        //              ),
        //            ]),
        //          ),
        //          pw.SizedBox(
        //            height: 40.0,
        //            child: pw.Row(children: [
        //              pw.SizedBox(
        //                width: MediaQuery.of(context).size.width * 0.42,
        //                child: pw.Text(
        //                  venue,
        //                  softWrap: true,
        //                  textAlign: pw.TextAlign.left,
        //                  style: pw.TextStyle(
        //                      color: PdfColors.grey,
        //                      fontSize: 16.0,
        //                      fontWeight: pw.FontWeight.normal),
        //                ),
        //              ),
        //              pw.SizedBox(
        //                width: MediaQuery.of(context).size.width * 0.42,
        //                child: pw.Text(
        //                  venueName,
        //                  textAlign: pw.TextAlign.right,
        //                  style: pw.TextStyle(
        //                      color: PdfColors.black,
        //                      fontSize: 16.0,
        //                      fontWeight: pw.FontWeight.normal),
        //                ),
        //              ),
        //            ]),
        //          ),
        //        ]
        //      ),
        //
        //       //creating list
        //       pw.Center(
        //         child: pw.ListView.builder(
        //             direction: pw.Axis.vertical,
        //             padding: const pw.EdgeInsets.all(5.0),
        //             spacing: 2.0,
        //             itemCount:
        //             homePageViewModel.saveTicketInfo!.ticketTypes!.length,
        //             itemBuilder: (context, index) {
        //               return pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   pw.SizedBox(
        //                       width: 100.0,
        //                       child: pw.Text(
        //                           homePageViewModel
        //                               .saveTicketInfo!.ticketTypes![index].name!,
        //                           style: pw.TextStyle(
        //                               color: PdfColors.black,
        //                               fontSize: 18.0,
        //                               fontWeight: pw.FontWeight.normal))),
        //                   pw.Container(
        //                       decoration: const pw.BoxDecoration(boxShadow: <pw.BoxShadow>[
        //                         pw.BoxShadow(
        //                           color: PdfColors.black,
        //                           blurRadius: 15.0,
        //                         )
        //                       ]),
        //                       child: pw.Center(
        //                           child: pw.Text(homePageViewModel.saveTicketInfo!.ticketTypes![index].quantity!.toString()))),
        //                   pw.Container(
        //                       decoration: const pw.BoxDecoration(boxShadow: <pw.BoxShadow>[
        //                         pw.BoxShadow(
        //                           color: PdfColors.black,
        //                           blurRadius: 15.0,
        //                         )
        //                       ]),
        //                       child: pw.Center(
        //                           child: pw.Text(homePageViewModel.saveTicketInfo!.ticketTypes![index].amount!.toString())))
        //                 ],
        //               );
        //             })
        //       ),
        //       /////////////
        //
        //       pw.Center(
        //         child: pw.Padding(
        //           padding:  pw.EdgeInsets.only(right:MediaQuery.of(context).size.width*0.2, top: 10.0),
        //           child: pw.Row(
        //             mainAxisAlignment: pw.MainAxisAlignment.end,
        //             children: [
        //               pw.Text(totalAmount,
        //                   style: pw.TextStyle(
        //                       color: PdfColors.black,
        //                       fontSize: 18.0,
        //                       fontWeight: pw.FontWeight.normal)),
        //               pw.SizedBox(
        //                 width: 20.0,
        //               ),
        //               pw.Container(
        //                   decoration: const pw.BoxDecoration(boxShadow: <pw.BoxShadow>[
        //                     pw.BoxShadow(
        //                       color: PdfColors.black,
        //                       blurRadius: 15.0,
        //                     )
        //                   ]),
        //                   child: pw.Center(
        //                       child: pw.Text(homePageViewModel.totalVal.toString())))
        //             ],
        //           ),
        //         )
        //       ),
        //     ],
        //   ),
        // );
      ],
    ),
  );
}
