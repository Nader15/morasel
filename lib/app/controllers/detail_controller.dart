import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/services/apis/participant.dart';
import '../../base/controllers/detail.dart';
import '../models/content_model.dart';
import '../services/apis/attachement.dart';
import '../services/apis/history.dart';
import '../services/apis/login.dart';
import '../services/apis/action.dart';

class DetailController extends BaseDetailController {
  late AttachementService attachementService;
  late ParticipantService participantService;

  final HistoryService historyService = HistoryService();
  late ActionService actionService;
  late LoginService loginService;
  late RxList<Content> listBox = RxList<Content>();
  late TextEditingController incCintroller;
  late TextEditingController incReplyCintroller;
  late TextEditingController incSendCintroller;

  //late BoxService boxService;
  //late RxList listSearch;
  RxList<Content> resultSearch = RxList<Content>();
  late RxList result;
  Color? isDark;
  late List employee = [];
  late RxList participantList;
  late RxList participantListTo;
  late RxList participantListCC;
  late RxList participantDep;
  late RxList participantEmp;

  late Map staff = {};
  late Map dep = {};

//This var for modelShet  4 item
  RxInt isUrgentReply = 0.obs;
  RxInt isUrgentSend = 0.obs;

  RxBool isImportantReply = false.obs;
  RxBool isImportantSend = false.obs;

  RxBool isFollowUpReply = false.obs;
  RxBool isFollowUpSend = false.obs;

//////////////////////////////////
  RxBool isLoading = false.obs;
  var isDirection = DismissDirection.startToEnd.obs;

  Rx<Color> color = Colors.white.obs;

//This var for box  18 item

  //int corsid =   listBox[0].corsid;

  int corsid = 1;
  int urgencylevel = 1;
  int importancelevel = 0;
  String creatordeptname = '';
  String creatorname = '';
  String receivedonhijridate = '';
  String correspondencedate = '';
  String correspondencetype = '3';
  int hijricyear = 0;
  String correspondencesubject = '';
  int correspondencenumber = 0;
  String fullname = '';
  String userid = '123';
  String departmentname = '';
  String wobnum = '';
  int isread = 0;
  int steptype = 2;
  dynamic attachments = '';

  ///////////////////////////////
//only
  String instructions = '';
  bool followup = false;

  RxInt getCorsid = 0.obs;
  @override
  void onInit() {
    participantService = ParticipantService();
    actionService = ActionService();
    attachementService = AttachementService();
    incCintroller = TextEditingController();
    incReplyCintroller = TextEditingController();
    incSendCintroller = TextEditingController();

    // boxService = BoxService();
    loginService = LoginService();
    //listSearch = RxList<Content>();
    // resultSearch.value = listSearch as List<Content>;
    participantList = RxList();
    participantListTo = RxList();
    participantListCC = RxList();
    participantDep = RxList();
    participantEmp = RxList();

    // boxService.getApi().then((item) {
    //   listSearch.clear();
    //   listSearch.value = item;
    // });
    loginService.getEmployeeLocal().then(
          (value) => employee.addAll(value),
        );

    participantService.getLocal().then(
          (value) => participantList.addAll(value),
        );

    super.onInit();
  }

  @override
  void dispose() {
    incCintroller.dispose();
    super.dispose();
  }

  pdf() async {
    return await attachementService.getApiAttch();
  }

  getByets() async {
    return await attachementService.getApiAttch().then((value) => value);
  }

  // info() {
  //   List<Content> result = [];
  //   if (getCorsid.isNaN) {
  //     result = listSearch as List<Content>;
  //   } else {
  //     for (var element in listSearch) {
  //       if (element.corsid.isEqual(getCorsid)) {
  //         result.add(element);
  //       }
  //     }
  //     resultSearch.value = result;
  //   }
  // }

  String getTypeTranc(type) {
    switch (type) {
      case '1':
        return 'وارد خارجي';
      case '2':
        return 'صادر خارجي';
      case '3':
        return 'داخلية';
      default:
        return '000';
    }
  }

  getTypeParticip(particip) {
    switch (particip) {
      case 1:
        return Icons.account_circle;
      case 2:
        return Icons.corporate_fare_rounded;
      case 3:
        return Icons.crop_landscape_sharp;
      default:
        return Icons.info;
    }
  }

  restSwchReply() {
    isUrgentReply.value = 0;
    isImportantReply.value = false;
    isFollowUpReply.value = false;
  }

  onChangeisImportantReply(newVal) {
    isImportantReply.value = newVal;
  }

  onChangeisFollowUpReply(newVal) {
    isFollowUpReply.value = newVal;
  }

  restSwchSend() {
    isUrgentSend.value = 0;
    isImportantSend.value = false;
    isFollowUpSend.value = false;
    participantListTo.clear();
    participantListCC.clear();
    participantDep.clear();
    participantEmp.clear();
  }

  onChangeisFollowUpSend(newVal) {
    isFollowUpSend.value = newVal;
  }

  onChangeisImportantSend(newVal) {
    isImportantSend.value = newVal;
  }

  participantDepList2(item) {
    var id = item['id'];
    var type = item['type'];

    List<Dep> depList = [];
    Dep list = Dep(id: id, type: type);
    depList.add(list);
    // ignore: unrelated_type_equality_checks
    if ((depList.singleWhere((it) => it.id == id) == true)) {
      print('already');
      participantEmp.remove(item);
    } else {
      print('add');
      participantEmp.add(item);
    }
    for (var g in depList) {
      print(g.id);
    }
    print(participantEmp);
  }

  participantDepList(item) {
    print(item);
    if (participantDep.contains(item)) {
      print(participantDep.contains(item));
      participantEmp.remove(item);
    } else {
      participantDep.add(item);
    }
    print(participantDep);
  }

  participantEmpList(item) {
    if (participantEmp.contains(item)) {
      participantEmp.remove(item);
    } else {
      participantEmp.add(item);
    }
    print(participantEmp);
  }

  participantToMap(item) {
    if (participantListTo.contains(item['participantEmployeeId'])) {
      participantListTo.remove(item);
    } else {
      participantListTo.add(item);
    }
  }

  participantCCMap(item) {
    if (participantListCC.contains(item)) {
      participantListCC.remove(item);
    } else {
      participantListCC.add(item);
    }
    //print(participantListCC);
  }

  map() {
    Map<String, dynamic> corrObject = {};
    corrObject["corsid"] = corsid;
    corrObject["urgencylevel"] = 0;
    corrObject["importancelevel"] = 0;
    corrObject["creatordeptname"] = creatordeptname;
    corrObject["creatorname"] = creatorname;
    corrObject["receivedonhijridate"] = receivedonhijridate;
    corrObject["correspondencedate"] = correspondencedate;
    corrObject["correspondencetype"] = correspondencetype;
    corrObject["hijricyear"] = hijricyear;
    corrObject["correspondencesubject"] = correspondencesubject;
    corrObject["correspondencenumber"] = correspondencenumber;
    corrObject["fullname"] = fullname;
    corrObject["userid"] = employee[0].idno;
    corrObject["departmentname"] = departmentname;
    corrObject["wobnum"] = wobnum;
    corrObject["isread"] = isread;
    corrObject["steptype"] = steptype;
    corrObject["attachments"] = attachments;
    return corrObject;
  }

  doSave() async {
    isLoading(true);
    try {
      await actionService.actionLocal(
        selectedResponse: "RES_SAVE",
        lstTOParticipants: "[]",
        lstCCParticipants: "[]",
        corrType: correspondencetype,
        stepType: steptype,
        importance: false,
        urgencyLevelParam: 0,
        followup: false,
        instructions: incCintroller.text,
        corr: map(),
        employeeid: employee[0].idno,
        queuename: 'inbox',
      );
    } finally {
      isLoading(false);
    }
  }

  doReply() async {
    isLoading(true);
    try {
      await actionService.actionLocal(
        selectedResponse: "RES_REPLY",
        lstTOParticipants: "[]",
        lstCCParticipants: "[]",
        corrType: correspondencetype,
        stepType: steptype,
        importance: isImportantReply.value,
        urgencyLevelParam: isUrgentReply.value,
        followup: isFollowUpReply.value,
        instructions: incReplyCintroller.text,
        corr: map(),
        employeeid: employee[0].idno,
        queuename: 'Inbox',
      );
    } finally {
      isLoading(false);
    }
  }

  doSend() async {
    isLoading(true);
    try {
      Map<String, dynamic> data = {
        "selectedResponse": "RES_FORWARD",
        "lstTOParticipants": participantListTo,
        "lstCCParticipants": participantListCC,
        "corrType": correspondencetype,
        "stepType": steptype,
        "importance": isImportantSend.value,
        "urgencyLevelParam": isUrgentSend.value,
        "followup": isFollowUpSend.value,
        "instructions": incSendCintroller.text,
        "corr": map(),
        "employeeid": employee[0].idno,
        "queuename": 'Inbox'
      };
      await actionService.actionLocal2(data);
    } finally {
      isLoading(false);
    }
  }

  doCopy() async {
    isLoading(true);
    try {
      await actionService.actionLocal(
        selectedResponse: "RES_CC_DONE",
        lstTOParticipants: "[]",
        lstCCParticipants: "[]",
        corrType: correspondencetype,
        stepType: steptype,
        importance: false,
        urgencyLevelParam: 0,
        followup: false,
        instructions: '',
        corr: map(),
        employeeid: employee[0].idno,
        queuename: 'Inbox',
      );
    } finally {
      isLoading(false);
    }
  }

  doRead() async {
    await actionService.isReadlocal(
      wobnum: wobnum,
      queuename: 'Inbox',
    );
  }
}

class Dep {
  final int id;

  final String type;
  Dep({required this.id, required this.type});
}
