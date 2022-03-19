import 'package:flutter/material.dart';
import 'package:homework12/pages/home/home_page.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);
  static const buttonSize = 60.0;

  @override//n
  State<loginpage> createState() => _PinPageState();
}

class _PinPageState extends State<loginpage> {

  var input;//n
  String _pass = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(//a

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,

            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade300,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(//w
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(//i

                      Icons.lock,         // รูปไอคอน
                      size: 50.0,           // ขนาดไอคอน
                      color: Colors.pinkAccent.shade100,   // สีไอคอน
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.2),

                      child: Text("LOGIN",style: TextStyle(
                          fontSize: 32.0, color: Colors.purple.shade200)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.2),

                      child: Text("Enter pin to login",style: TextStyle(
                          fontSize: 12.0, color: Colors.purple.shade200)),
                    ),
                  ],
                ),
              ),


              Padding(//c
                padding: const EdgeInsets.only(top: 0.0,bottom: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Collection for
                    for (var i = 0; i < _pass.length; i++)
                      Container(
                        width: 25.0,
                        height: 25.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100,
                          shape: BoxShape.circle,
                        ),
                      ),
                    for(var i = 0; i<6-_pass.length;i++)
                      Container(
                        width: 25.0,
                        height: 25.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),


              Row(//h
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  for (var i = 1; i <= 3; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) buildButton(num: i),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width:60,
                          height:60,
                        )),


                    buildButton(num: 0),
                    buildButton(num: -1),

                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),






      child: Container(
        width: 60.0,
        height: 60.0,



        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.purple.shade200, width: 2.0),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]

        ),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(shape: CircleBorder(),),
            onPressed: () {
              if (num == -1) {
                print('Backspace');

                setState(() {

                  var length = _pass.length;
                  _pass = _pass.substring(0, length - 1);
                });
              }else {
                if (_pass.length < 6)
                  setState(() {
                    _pass = '$_pass$num';
                    print(_pass);
                  });
                if (_pass.length == 6) {
                  if (_pass == '123456') {
                    _pass = "";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()
                      ),
                    );
                  }
                }
              }if(_pass.length==6 && _pass != '123456'){

                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {


                      return AlertDialog(
                        title: Text('รหัสผ่านผิดพลาด',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold)),
                        content: Text(
                            'กรุณาลองใส่รหัสผ่านใหม่'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();




                              },
                              child: Text('ตกลง')


                          ),


                        ],




                      );

                    });
              }


              BorderRadius.circular(loginpage.buttonSize / 2);
              Container(
                decoration: (num == -1)
                    ? null
                    : BoxDecoration(
                  border: Border.all(width: 2.0),
                  shape: BoxShape.circle,
                  color: Colors.pinkAccent.shade100,
                ),
                alignment: Alignment.center,
                width: loginpage.buttonSize,
                height: loginpage.buttonSize,
                child: (num == -1) ? Icon(Icons.backspace_outlined) : Text('$num',style: TextStyle(
                    fontSize: 20.0),),
              );






            },
            child: Center(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center ,
                  children: [
                    if(num!>=0)
                      Text('$num')
                    else if(num==-1)
                      Icon(
                        Icons.backspace_outlined,
                        color: Colors.pinkAccent.shade100,
                        // รูปไอคอน
                        size: 20.0,
                      ),
                  ],



                )


            )),





      ),
    );
  }
}