import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreDailyWidget extends StatefulWidget {
  const MoreDailyWidget({Key? key}) : super(key: key);

  @override
  _MoreDailyWidgetState createState() => _MoreDailyWidgetState();
}

class _MoreDailyWidgetState extends State<MoreDailyWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: customTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: customTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 25, 20, 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: customTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: customTheme.of(context).shadow,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: customTheme.of(context).googleButton,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: customTheme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          '- важная задача.',
                          style: customTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: customTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: customTheme.of(context).shadow,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: customTheme.of(context).googleButton,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: customTheme.of(context).secondaryText,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          '- нет приоритета',
                          style: customTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: customTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: customTheme.of(context).shadow,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: customTheme.of(context).googleButton,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF5155),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          '- срочная задача.',
                          style: customTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
