import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  _EmptyWidgetState createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: FaIcon(
                  FontAwesomeIcons.exclamationCircle,
                  color: customTheme.of(context).secondaryText,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                child: Text(
                  'Похоже, пока пусто',
                  textAlign: TextAlign.center,
                  style: customTheme.of(context).title3.override(
                        fontFamily: 'Nunito',
                        color: customTheme.of(context).primaryText,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
