import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../custom/custom_icon_button.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCategoryWidget extends StatefulWidget {
  const AddCategoryWidget({Key? key}) : super(key: key);

  @override
  _AddCategoryWidgetState createState() => _AddCategoryWidgetState();
}

class _AddCategoryWidgetState extends State<AddCategoryWidget> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

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
        height: 180,
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
                  color: Color(0xFFDBE2E7),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Добавить категорию',
                    style: customTheme.of(context).title2.override(
                          fontFamily: 'Nunito',
                          color: customTheme.of(context).primaryText,
                          fontSize: 18,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Введите название категории',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: customTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: customTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                            prefixIcon: Icon(
                              Icons.category_rounded,
                              color: customTheme.of(context).primaryColor,
                            ),
                          ),
                          style: customTheme.of(context).bodyText1.override(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: CustomIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 45,
                          fillColor: customTheme.of(context).primaryColor,
                          icon: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () async {
                            final todoCategoryCreateData =
                                createTodoCategoryRecordData(
                              categoryName: textController!.text,
                              createdBy: currentUserReference,
                              createdAt: getCurrentTimestamp,
                              uid: currentUserUid,
                            );
                            await TodoCategoryRecord.collection
                                .doc()
                                .set(todoCategoryCreateData);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Категория добавлена',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    color: customTheme.of(context).primaryColor,
                                    fontSize: 14,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    customTheme.of(context).primaryBackground,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
