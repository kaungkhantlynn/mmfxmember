import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../bloc/auth/login/login_bloc.dart';
import '../../bloc/auth/login/login_event.dart';
import '../../bloc/auth/login/login_state.dart';
import '../../config/colors.dart';
import '../../data/local/constants/svgImages.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/sharedpref/preferences.dart';
import '../../di/components/service_locator.dart';


class LogIn extends StatefulWidget {
  static String route = '/login';
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  LogInBloc _logInBloc = LogInBloc(getIt<AuthRepository>());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isAgreeChecked = false;
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool hidePassword=true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(MMfxColor.backgroundColor),
          body: BlocProvider<LogInBloc>(
            create:(_)=>LogInBloc(getIt<AuthRepository>()),
            child: BlocListener<LogInBloc,LogInState>(
              bloc: _logInBloc,
              listener: (context,state) async {
                if(state is LogInLoading){
                  showDialog(
                      barrierDismissible: false,
                      barrierColor: Color(0x00ffffff),
                      context: context,
                      builder: (BuildContext context){
                        return
                          Material(
                            type: MaterialType.transparency,
                            child: Center(
                                child: SpinKitFadingFour(color: Color(0xff0C1553),)
                            ),
                          );
                      }
                  );
                }
                else if(state is LogInError){
                  Navigator.pop(context);
                  Scaffold.of(context)
                      .showSnackBar(
                      SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Fail to Login. There is something wrong.")
                        // content: Text(state.errorMessage)
                      ));
                  // _marketPriceListBloc.add(MarketPriceListStart());
                }
                else if(state is LogInSuccess){
                  Navigator.pop(context);
                  print("HELLOOO THIS IS ${Preferences.profileInfo.data!.bio}");
                  Navigator.pushReplacementNamed(context, '/mmfx_main');
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: mediaQuery.size.width,
                      height: mediaQuery.size.height / 4,
                      decoration: BoxDecoration(
                          border:
                          Border.all(width: 0, color: HexColor(MMfxColor.primary)),
                          color: HexColor(MMfxColor.primary),
                          borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(140))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 130,
                              height: 130,
                              child: Image.asset('assets/images/MMFXlogo.png')
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: mediaQuery.size.width,
                      color: HexColor(MMfxColor.primary),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0, color: HexColor(MMfxColor.backgroundColor)),
                          color: HexColor(MMfxColor.backgroundColor),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(140)),
                        ),
                        child:
                        Form(
                          key: _key,
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.all(30)),
                              Text(
                                'Welcome',
                                style: TextStyle(
                                    fontFamily: 'Inter-Bold',
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor(MMfxColor.primary)),
                              ),

                              //Phone number
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(top: 20,left: 15.5),
                                  child: Text("Mobile Phone",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Inter'),)
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
                                child: TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color: HexColor(MMfxColor.primary,),
                                            width: 1.5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide(color: HexColor(MMfxColor.primary,),
                                            width: 1.5)),
                                    hintText: '09xxxxxxxxx',
                                    hintStyle: TextStyle(color: Color(0xff535B88),fontSize: 18,fontFamily: 'Inter'),

                                  ),
                                  validator: (value) {
                                    if(value!.length < 1 ) {
                                      return 'Enter Mobile Phone';
                                    }
                                  },
                                ),
                              ),

                              //Password
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(top: 20,left: 15.5),
                                  child: Text("Password",style: TextStyle(color: Color(0xff0C1553),fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Inter'),)
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.5, vertical: 15.5),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: HexColor(MMfxColor.primary,),
                                              width: 1.5)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          borderSide: BorderSide(color: HexColor(MMfxColor.primary,),
                                              width: 1.5)),
                                      // hintText: '09xxxxxxxxx',
                                      hintStyle: TextStyle(color: Color(0xff535B88),fontSize: 18,fontFamily: 'Inter'),
                                      suffixIcon: hidePassword?
                                      IconButton(
                                        onPressed: (){
                                          setState(() {
                                            hidePassword=!hidePassword;
                                          });
                                        },
                                        icon: SvgPicture.string(SvgImages.remove_eye,width: 25,height: 25,color: Colors.black45,),
                                        // icon: Icon(Icons.lock,color: Color(0xff96AFB8),)
                                      ):
                                      IconButton(
                                        onPressed: (){
                                          setState(() {
                                            hidePassword=!hidePassword;
                                          });
                                        },
                                        icon: SvgPicture.string(SvgImages.eye,width: 25,height: 25,color: Colors.black45,),
                                      )
                                  ),
                                  validator: (value) {
                                    if(value!.length < 1 ) {
                                      return 'Enter Password';
                                    }
                                  },
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(10.5)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.5),
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: HexColor(MMfxColor.primary), // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {
                                        if(_key.currentState!.validate()){
                                          print("HELLOOOO");
                                          _logInBloc.add(LogInPressedButton(phone:_phoneController.text,password:_passwordController.text));
                                        }

                                        // Navigator.pushReplacementNamed(context, '/mmfx_author');
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 15, bottom: 15),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              fontFamily: 'Inter-Medium',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: HexColor(MMfxColor.secondary)),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(10.5)),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, '/forgot_password');
                                },
                                child: Text('Forgot your password? ', style: TextStyle(
                                    color: Color(0xff005FFD),fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return HexColor(MMfxColor.primary);
  }
}
