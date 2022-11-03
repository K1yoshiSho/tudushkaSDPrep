import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_folder_widget.dart';
import '../custom/custom_icon_button.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoldersWidget extends StatefulWidget {
  const FoldersWidget({Key? key}) : super(key: key);

  @override
  _FoldersWidgetState createState() => _FoldersWidgetState();
}

class _FoldersWidgetState extends State<FoldersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: customTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: AddFolderWidget(),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: customTheme.of(context).primaryColor,
        icon: Icon(
          Icons.add_circle_rounded,
          color: Colors.white,
        ),
        elevation: 0,
        label: Text(
          'Создать папку',
          style: customTheme.of(context).bodyText1.override(
                fontFamily: 'Nunito',
                color: Colors.white,
                useGoogleFonts: false,
              ),
        ),
      ),
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: customTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () async {
                              context.goNamed(
                                'home',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/images/Tudushka.svg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Заметки',
                              style: customTheme.of(context).title2.override(
                                    fontFamily: 'Nunito',
                                    color: customTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      CustomIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: FaIcon(
                          FontAwesomeIcons.solidCalendar,
                          color: customTheme.of(context).primaryColor,
                          size: 20,
                        ),
                        onPressed: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'В разработке',
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
                    ],
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            )
          : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: StreamBuilder<List<FolderRecord>>(
                stream: queryFolderRecord(
                  queryBuilder: (folderRecord) =>
                      folderRecord.where('uid', isEqualTo: currentUserUid),
                ),
                builder: (context, snapshot) {
                  // customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: SpinKitThreeBounce(
                          color: customTheme.of(context).primaryColor,
                          size: 35,
                        ),
                      ),
                    );
                  }
                  List<FolderRecord> listViewFolderRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewFolderRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewFolderRecord =
                          listViewFolderRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: InkWell(
                          onTap: () async {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              'notes',
                              queryParams: {
                                'folder': serializeParam(
                                  listViewFolderRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'folder': listViewFolderRecord,
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 300),
                                ),
                              },
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    customTheme.of(context).primaryBackground,
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
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.folder_rounded,
                                          color: customTheme
                                              .of(context)
                                              .primaryColor,
                                          size: 24,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Text(
                                            listViewFolderRecord.title!,
                                            style: customTheme
                                                .of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      formatNumber(
                                        listViewFolderRecord.notes!
                                            .toList()
                                            .length,
                                        formatType: FormatType.custom,
                                        format: '',
                                        locale: '',
                                      ),
                                      style: customTheme.of(context).bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
