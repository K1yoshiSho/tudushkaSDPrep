import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import '../custom/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddNotesWidget extends StatefulWidget {
  const AddNotesWidget({
    Key? key,
    this.folder,
  }) : super(key: key);

  final FolderRecord? folder;

  @override
  _AddNotesWidgetState createState() => _AddNotesWidgetState();
}

class _AddNotesWidgetState extends State<AddNotesWidget> {
  DateTime? datePicked;
  NotesRecord? note;
  TextEditingController? textController1;
  TextEditingController? textController2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
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
        height: 350,
        decoration: BoxDecoration(
          color: customTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      'Заметка для папки ',
                      style: customTheme.of(context).title2.override(
                            fontFamily: 'Nunito',
                            color: customTheme.of(context).primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                    Expanded(
                      child: Text(
                        widget.folder!.title!,
                        style: customTheme.of(context).title2.override(
                              fontFamily: 'Nunito',
                              color: customTheme.of(context).primaryText,
                              fontSize: 18,
                              useGoogleFonts: false,
                            ),
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
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Введите заголовок',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                              prefixIcon: Icon(
                                Icons.create_rounded,
                                color: customTheme.of(context).primaryColor,
                                size: 16,
                              ),
                            ),
                            style: customTheme.of(context).bodyText1.override(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Введите описание',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 20),
                                prefixIcon: Icon(
                                  Icons.description_rounded,
                                  color: customTheme.of(context).primaryColor,
                                  size: 16,
                                ),
                              ),
                              style: customTheme.of(context).bodyText1.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() => datePicked = date);
                                },
                                currentTime: datePicked!,
                                minTime: DateTime(0, 0, 0),
                                locale: LocaleType.values.firstWhere(
                                  (l) =>
                                      l.name ==
                                      customLocalizations
                                          .of(context)
                                          .languageCode,
                                  orElse: () => LocaleType.en,
                                ),
                              );
                            },
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'yMMMd',
                                datePicked,
                                locale: customLocalizations
                                    .of(context)
                                    .languageCode,
                              ),
                              'Выберите день',
                            ),
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              size: 16,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              color: customTheme.of(context).primaryBackground,
                              textStyle: customTheme
                                  .of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: customTheme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: customTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              final notesCreateData = createNotesRecordData(
                                title: textController1!.text,
                                description: textController2!.text,
                                date: datePicked,
                                folder: widget.folder!.reference,
                                createdAt: getCurrentTimestamp,
                                createdBy: currentUserReference,
                                uid: currentUserUid,
                              );
                              var notesRecordReference =
                                  NotesRecord.collection.doc();
                              await notesRecordReference.set(notesCreateData);
                              note = NotesRecord.getDocumentFromData(
                                  notesCreateData, notesRecordReference);

                              final folderUpdateData = {
                                'notes':
                                    FieldValue.arrayUnion([note!.reference]),
                              };
                              await widget.folder!.reference
                                  .update(folderUpdateData);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Успешно создано',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color:
                                          customTheme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      customTheme.of(context).primaryBackground,
                                ),
                              );

                              setState(() {});
                            },
                            text: 'Создать',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: customTheme.of(context).primaryColor,
                              textStyle:
                                  customTheme.of(context).subtitle2.override(
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
