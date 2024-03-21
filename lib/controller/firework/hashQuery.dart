
import 'package:logger/logger.dart';
String buildhash(String Q) {
  //TODO handle once&write by appending a key

  final logger = Logger();
  logger.d("PowerQuery hashing....");

  var mapObj = {
    "*": "-BLU-",
    "#": "-BLUBLU-",
    ".": "-BLUBLUBLU-",
    "+": "-BLUBLUBLUBLU-",
    "/": "-BLUBLUBLUBLUBLU-",
    " ": ".",
  };
   var mq= Q.replaceAllMapped(RegExp(r"^/\.|#|\*|\+|/| /$"), (match) => mapObj[match[0]]!);
  RegExp dotRegex = RegExp(r'\.');
  var mapdot ={".":"-BLUBLUBLU-"};
  var dotmq = mq.replaceAllMapped(dotRegex, (match) => mapdot[match[0]]!);

   return  dotmq;

}

String buildQuery(H) {
  final logger = Logger();
  //TODO handle once&write by appending a key
  logger.v("PowerQuery makeQuery....");
  var mapObj = {
    "-BLU-": "*",
    "-BLUBLU-": "#",
    "-BLUBLUBLU-": ".",
    "-BLUBLUBLUBLU-": "+",
    "-BLUBLUBLUBLUBLU-": "/",
    "/": " ",
  };
  return H.replaceAllMapped(RegExp(r"/(-BLU-)|(-BLUBLU-)|(-BLUBLUBLU-)|(-BLUBLUBLUBLU-)|(-BLUBLUBLUBLUBLU-)|\$"),
          (matched) {
        mapObj[matched[0]];
      }
  );
}

// (matched) {
// }
String  buildEvent(String H) {
  //TODO handle once&write by appending a keyi
  final logger = Logger();
  logger.i("PowerQuery makeQuery....");
  return H.replaceAll(RegExp(r"/\$"), ".");
}
String changeformat(value) {
  final logger = Logger();
  var from = "/";
  var to = ".";
  if (value.indexOf(from) == -1) {
    logger.i("Character to replace not found in string");
    return value;
  } else {
    return value.split(from).join(to);
  }
}
//var p =
//  "QP/UPDATE//SELECT/emp_name,designation,phone_no,email_id/FROM/employee";
//print($changeformat(p));

//module.exports = { buildhash, buildQuery, buildEvent, changeformat };