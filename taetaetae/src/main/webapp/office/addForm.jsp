
<html>
<head>
<title>회원 가입 폼</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
<!--
  BODY, table, tr, td, input, textarea, select {font-family:돋움; font-size:9pt;}
  A:link {color:#000000;text-decoration:none;}
  A:visited {color:#000000;text-decoration:none;}
  A:active {color:#000000;text-decoration:none;}
  A:hover {color:#000000;text-decoration:underline;}
  .tb_border_01 {border-top-width:1px; border-right-width:2px; border-bottom-width:2px; border-left-width:1px; border-color:black; border-top-style:solid; border-right-style:ridge; border-bottom-style:solid; border-left-style:solid;}
  .button{ height:19px; border-width:1px; border-style:ridge; border-color:#d0d0d0; background-color:#dfdfdf;}
//-->
</style>
<SCRIPT LANGUAGE="JavaScript">
<!--
//---------숫자체크함수-------------
         
function IsNumber(formname) {
   //var form = eval('document.signform.' + formname);
   var form = eval(formname);
   for(var i = 0; i < form.value.length; i++) {
      var chr = form.value.substr(i,1);
      if(chr < '0' || chr > '9') {            
         return false;
      }
   }
   return true;   
}

//------------한글체크함수-----------
function h_check(Objectname) {
    var intErr
    var strValue = Objectname.value
    var retCode = 0

    for (i = 0; i < strValue.length; i++) {

        var retCode = strValue.charCodeAt(i)
        var retChar = strValue.substr(i,1).toUpperCase()

        retCode = parseInt(retCode)

        if ((retChar < '0' || retChar > '9') && (retChar < 'A' || retChar > 'Z') && ((retCode > 255) || (retCode < 0))) {
                intErr = -1;
                break;
        }
    }
    return (intErr);
}

<!---------------- 회원 필드 정의 ----------------------------------->
// 필수 항목 유무 검사
function Isreq(required){
    var f = document.member_form;
    var field = new Array();
    
    field['email'] = true;
    field['jumin'] = true;
    
    return field[required];
}
<!---------------- 회원 필드 정의 ----------------------------------->


<!---------------- 회원 아이디 체크 함수 ---------------------------->
function mem_id_check(){

    var member_id = 'id';
    var member_id = eval("document.member_form." + member_id);

    if(member_id.value.length <= 4 || member_id.value.length >= 20) {
       alert('아이디는 4 ~ 20자 이내의 영문소문자나 숫자 또는 조합된 문자열이어야 합니다');
       member_id.focus();
       member_id.select();
       return false;
    }

    for(var i = 0; i < member_id.value.length; i++) {
       var chr = member_id.value.substr(i,1);         
       if((chr < '0' || chr > '9') && (chr < 'a' || chr > 'z')) {
           alert('아이디는 4 ~ 20자 이내의 영문소문자나 숫자 또는 조합된 문자열이어야 합니다');
           member_id.focus();
           member_id.select();
           return false;  
       }
    }

    if(!member_id.value) {
        alert('아이디를 입력하신 후에 확인하세요.');
        member_id.focus();
        return false;
    }
    
    return true;
}
<!---------------- 회원 아이디 체크 함수 ---------------------------->

<!---------------- 패스워드 체크 함수 ------------------------------->
function mem_pass_check(){
    var member_pass = eval(document.member_form.passwd);

    if(member_pass.value.length < 4 || member_pass.value.length > 15) {
       alert('패스워드는 4 ~ 15자의  영문자나 숫자 또는 조합된 문자열이어야 합니다');
       member_pass.focus();
       member_pass.select();
       return false;
    }

    return true;
}
<!---------------- 패스워드 체크 함수 ---------------------------->

<!---------------- E-Mail 체크 함수 ------------------------------>
function email_check() {
  var email = document.member_form.email;
  var email_num = document.member_form.email.value.length;
  var str_email = document.member_form.email.value;
  for (var l = 0; l <= (email_num - 1); l++){
     if(str_email.indexOf(' ') >= 0 ){
        alert ('E 메일 주소에서 공란을 빼주십시오');
        email.focus();
        email.select();
        return false;
     }
  }
  if ((str_email.indexOf('/')) != -1){
     alert('메일 형식이 잘못되었습니다');
      email.focus();
     email.select();
      return false;
  }
  if ((str_email.indexOf(';')) != -1){
      alert('메일 형식이 잘못되었습니다');
      email.focus();
     email.select();
      return false;
  }
  if ((email_num != 0) && (str_email.search(/(\S+)@(\S+)\.(\S+)/) == -1)){
      alert('메일 형식이 잘못되었습니다');
      email.focus();
     email.select();
      return false;
  }
  if (h_check(email) == -1) {
     alert('한글은 사용할 수 없습니다');
     email.focus();
     email.select();
      return false;
  }
  return true;
}
<!---------------- E-Mail 체크 함수 ------------------------------>

<!---------------- 주민번호 체크 함수 ---------------------------->
function jumin_check() {
    
    var chk =0
    var yy = member_form.jumin1.value.substring(0,2)
    var mm = member_form.jumin1.value.substring(2,4)
    var dd = member_form.jumin1.value.substring(4,6)
    var sex = member_form.jumin2.value.substring(0,1)

    if ((member_form.jumin1.value.length!=6)||(yy <25||mm <1||mm>12||dd<1)){
            alert ('잘못된 주민등록번호입니다');
            member_form.jumin1.value='';
            member_form.jumin2.value='';
            member_form.jumin1.focus();
            return false;
    }

    if ((sex != 1 && sex !=2 )||(member_form.jumin2.value.length != 7 )){
            alert ('잘못된 주민등록번호입니다');
            member_form.jumin1.value='';
            member_form.jumin2.value='';
            member_form.jumin2.focus();
            return;
    }   
  
    for (var i = 0; i <=5 ; i++){ 
        chk = chk + ((i%8+2) * parseInt(member_form.jumin1.value.substring(i,i+1)))
    }

    for (var i = 6; i <=11 ; i++){ 
            chk = chk + ((i%8+2) * parseInt(member_form.jumin2.value.substring(i-6,i-5)))
    }

    chk = 11 - (chk %11)
    chk = chk % 10

    if (chk != member_form.jumin2.value.substring(6,7)) {
            alert ('주민등록번호가 맞지않습니다');
            member_form.jumin1.value='';
            member_form.jumin2.value='';
            member_form.jumin2.focus();
            return;
    }
    return true;
}
<!---------------- 주민번호 체크 함수 ---------------------------->


function chk_member_form(){

    var f = document.member_form;

    //if(!IsreqCheck())   return false;

    if(!f.id.value) {
        alert('아이디를 작성해 주세요.');
        f.id.focus();
        return false;
    }
    if(!mem_id_check()) return false;

    if(!f.passwd.value || !f.re_passwd.value) {
        alert('암호를 작성해 주세요.');
        f.passwd.focus();
        return false;
    }
    if(f.passwd.value != f.re_passwd.value) {
        alert('암호가 일치하지 않습니다.');
        f.passwd.value='';
        f.re_passwd.value='';
        f.passwd.focus();
        return false;
    }
    if(!mem_pass_check()) return false;

    if(!f.name.value) {
        alert('이름을 작성해 주세요.');
        f.name.focus();
        return false;
    }
    
    
        if(Isreq('email')){
            if(!f.email.value) {
                alert('이메일 을 작성해 주세요.');
                f.email.focus();
                return false;
            }
            if(!email_check()) return false;
        }
        if(Isreq('homepage')){
            if(!f.homepage.value) {
                f.homepage.focus();
                alert('홈페이지을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('c_phone')){
            if(!f.c_phone1.value || !f.c_phone2.value || !f.c_phone3.value) {
                alert('핸드폰을(를) 작성해 주세요.');
                return false;
            }
        }
        if(f.c_phone1 && !IsNumber(f.c_phone1)) {
            alert('핸드폰은(는) 숫자로 작성해 주세요.');        
            f.c_phone1.value=''
            f.c_phone1.focus();
            return false;
        }
        if(f.c_phone2 && !IsNumber(f.c_phone2)) {
            if(!IsNumber(f.c_phone2)) {
                alert('핸드폰은(는) 숫자로 작성해 주세요.');        
                f.c_phone2.value='';
                f.c_phone2.focus();
                return false;
            }
        }
        if(f.c_phone3 && !IsNumber(f.c_phone3)) {
            if(!IsNumber(f.c_phone3)) {
                alert('핸드폰은(는) 숫자로 작성해 주세요.');        
                f.c_phone3.value=''
                f.c_phone3.focus();
                return false;
            }
        }
        if(Isreq('h_phone')){
            if(!f.h_phone1.value || !f.h_phone2.value || !f.h_phone3.value) {
                alert('전화번호을(를) 작성해 주세요.');
                f.h_phone1.focus();
                return false;
            }
        }
        if(f.h_phone1 && !IsNumber(f.h_phone1)) {
            alert('전화번호은(는) 숫자로 작성해 주세요.');        
            f.h_phone1.value=''
            f.h_phone1.focus();
            return false;
        }
        if(f.h_phone2 && !IsNumber(f.h_phone2)) {
            if(!IsNumber(f.h_phone2)) {
                alert('전화번호은(는) 숫자로 작성해 주세요.');        
                f.h_phone2.value='';
                f.h_phone2.focus();
                return false;
            }
        }
        if(f.h_phone3 && !IsNumber(f.h_phone3)) {
            if(!IsNumber(f.h_phone3)) {
                alert('전화번호은(는) 숫자로 작성해 주세요.');        
                f.h_phone3.value=''
                f.h_phone3.focus();
                return false;
            }
        }
        if(Isreq('jumin')){
            if(!f.jumin1.value || !f.jumin2.value) {
                alert('주민등록번호 을(를) 작성해 주세요.');
                return false;
            }

            if(!IsNumber(f.jumin1)) {
                alert('주민등록번호는 숫자여야 합니다.');
                f.jumin2.focus();
                return false;         
            }
            if(!IsNumber(f.jumin2)) {
                alert('주민등록번호는 숫자여야 합니다.');
                f.jumin1.focus();
                return false;         
            }
            if(!jumin_check()) {
                f.jumin1.focus();   
                return false;
            }
        }
        if(Isreq('birth')){
            if(!f.birth1.value || !f.birth2.value || !f.birth3.value) {
                alert('생일을(를) 작성해 주세요.');
                f.birth1.focus();
                return false;
            }
        }
        if(f.birth1 && !IsNumber(f.birth1)) {
            alert('생일은(는) 숫자로 작성해 주세요.');        
            f.birth1.value=''
            f.birth1.focus();
            return false;
        }
        if(f.birth2 && !IsNumber(f.birth2)) {
            if(!IsNumber(f.birth2)) {
                alert('생일은(는) 숫자로 작성해 주세요.');        
                f.birth2.value='';
                f.birth2.focus();
                return false;
            }
        }
        if(f.birth3 && !IsNumber(f.birth3)) {
            if(!IsNumber(f.birth3)) {
                alert('생일은(는) 숫자로 작성해 주세요.');        
                f.birth3.value=''
                f.birth3.focus();
                return false;
            }
        }
        if(Isreq('birth_type')){
            if(!f.birth_type.value) {
                f.birth_type.focus();
                alert('음(양)력을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('h_zip')){
            if(!f.h_zip1.value || !f.h_zip2.value) {
                alert('zip code을(를) 작성해 주세요.');
                f.h_zip1.focus();
                return false;
            }
        }
        if(f.h_zip1 && !IsNumber(f.h_zip1)) {
            alert('zip code은(는) 숫자로 작성해 주세요.');        
            f.h_zip1.value=''
            f.h_zip1.focus();
            return false;
        }
        if(f.h_zip2 && !IsNumber(f.h_zip2)) {
            if(!IsNumber(f.h_zip2)) {
                alert('zip code은(는) 숫자로 작성해 주세요.');        
                f.h_zip2.value='';
                f.h_zip2.focus();
                return false;
            }
        }
        if(Isreq('h_addr')){
            if(!f.h_addr.value) {
                f.h_addr.focus();
                alert('집주소을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('sex')){
            if(!f.sex.value) {
                f.sex.focus();
                alert('성별을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('job')){
            if(!f.job.value) {
                f.job.focus();
                alert('직업을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('mailling')){
            if(!f.mailling.value) {
                f.mailling.focus();
                alert('메일링 수신을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('info_open')){
            if(!f.info_open.value) {
                f.info_open.focus();
                alert('개인정보공개을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('recom_id')){
            if(!f.recom_id.value) {
                f.recom_id.focus();
                alert('추천아이디을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('intro')){
            if(!f.intro.value) {
                f.intro.focus();
                alert('자기 소개을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('add_01')){
            if(!f.add_01.value) {
                f.add_01.focus();
                alert('좋아하는 연애인을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('add_02')){
            if(!f.add_02.value) {
                f.add_02.focus();
                alert('직장명을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('add_03')){
            if(!f.add_03.value) {
                f.add_03.focus();
                alert('경혼 유무을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('add_04')){
            if(!f.add_04.value) {
                f.add_04.focus();
                alert('뉴스 레터 받기을(를) 작성해 주세요.');
                return false;
            }
        }
        if(Isreq('add_05')){
            if(!f.add_05.value) {
                f.add_05.focus();
                alert('사이트 건의사항을(를) 작성해 주세요.');
                return false;
            }
        }
   
    return true;

        //f.action = 'community.php3?link=member';
        //f.submit();
}

// 중복 아이디 검색
function search_id(){
    
    if(!mem_id_check()) return false;
    else{
        var m_id = document.member_form.id.value;
        window.open("http://www.kasoo.or.kr/bbseboard/member/member.php3?link=di&search_id=" + m_id,"dup_id","width=400,height=200,scrollbars=yes");
        return true;
    }    
}

// 우편번호 검색
function post_searching(){
    window.open("http://www.kasoo.or.kr/bbseboard/member/member.php3?link=sa","post_searching","width=450,height=200,scrollbars=yes");
    return true;
}

//-->
</SCRIPT>
</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

<!---------------------------- 상단 html --------------------------->
<table border="0" width="620" height='100%' cellspacing="1" cellpadding="0" align='center' bgcolor='#000000'>
  <tr>
    <td width="100%" height='20' bgcolor='#6BA4C9'></td>
  </tr>
  <tr>
    <td width="100%" valign="top" bgcolor='#FFFFFF'>
<!---------------------------- 상단 html --------------------------->

      <table border='0' width='100%' align='center' cellspacing='0' cellpadding='0'>
        <tr>
          <td width='100%' height='30'></td>
        </tr>
        <tr>
          <td width='100%' align='center'><img src='../images/m_reg_title.gif'></td>
        </tr>
      </table>
      <table border='0' width='550' align='center' cellspacing='0' cellpadding='0'>
        <tr>
          <td width='100%' align='center' height='30'></td>
        </tr>
      </table>
      <table border='0' width='550' align='center' cellspacing='1' cellpadding='5' bgcolor='#686868' style='line-height: 150%'>
        <tr>
          <td width='100%' bgcolor='#FFFFFF'><font color='#f26e15'>* 회원 ID는
            4 자 ~ 20자 이내의 영문과 숫자로 하시면 됩니다.<br>
            * 비밀번호는 4 ~ 15자의 영문과 숫자로 하시면
            됩니다.</fonr><br>* <font color='#F4554D'><b>√</b></font><font color='#f26e15'> 표시는 회원등록시 반드시 입력하셔야 합니다.</font></td>
        </tr>
      </table>
      <table border='0' width='550' align='center' cellspacing='0' cellpadding='0'>
        <tr>
          <td width='100%' align='center' height='20'></td>
        </tr>
      </table>
<!---------------------------------------- 회원 가입 폼 ---------------------------------------------->

	
<table border='0' width='550' align='center' bgcolor='#686868' cellspacing='1' cellpadding='0'>
<form name='member_form' method='POST' Onsubmit='return chk_member_form();' action='member.php3'>
<input type='hidden' name='link' value='input'>
<input type='hidden' name='mode' value='new'>
<input type='hidden' name='ref' value=''>
  <tr>
    <td width='100%' bgcolor='#FFFFFF'>

    
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 원하는 아이디 <font color='red'><b>√</b></font></td>
          <td width='1%'>
          <td width='74%'><input type='text' name='id' size='20' maxlength='20'>&nbsp <a href='#' Onclick='search_id(document.member_form)'><img align='absMiddle' border='0' src='../images/bt_double.gif' width='62' height='19' align='absmiddle'></a></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 암호 <font color='red'><b>√</b></font></td>
          <td width='1%'>
          <td width='74%'><input type='password' name='passwd' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 암호 확인 <font color='red'><b>√</b></font></td>
          <td width='1%'>
          <td width='74%'><input type='password' name='re_passwd' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 회원명 <font color='red'><b>√</b></font></td>
          <td width='1%'>
          <td width='74%'><input type='text' name='name' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr> 
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 이메일 <font color='red'><b>√</b></font></td> 
          <td width='1%'>
          <td width='74%'><input type='text' name='email' size='39'></td> 
        </tr> 
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr> 
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 홈페이지</td> 
          <td width='1%'>
          <td width='74%'><input type='text' name='homepage' size='46'></td> 
        </tr> 
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr> 
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 핸드폰</td> 
          <td width='1%'>
          <td width='74%'><input type='text' name='c_phone1' size='5'>  -&nbsp; <input type='text' name='c_phone2' size='5'>   
            -&nbsp; <input type='text' name='c_phone3' size='5'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 전화번호</td>  
          <td width='1%'>
          <td width='74%'><input type='text' name='h_phone1' size='5'> -&nbsp; <input type='text' name='h_phone2' size='5'>   
            -&nbsp; <input type='text' name='h_phone3' size='5'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 주민등록번호 <font color='red'><b>√</b></font></td>
          <td width='1%'>
          <td width='74%'><input type='text' name='jumin1' size='10'> -&nbsp; <input type='text' name='jumin2' size='10'></td> 
        </tr> 
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 생일</td>  
          <td width='1%'>
          <td width='74%'><input type='text' name='birth1' size='5'> -&nbsp; <input type='text' name='birth2' size='5'>&nbsp;   
            - <input type='text' name='birth3' size='5'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 음(양)력</td>  
          <td width='1%'>
          <td width='74%'>음력 <input type='radio' value='음력' checked name='birth_type'>&nbsp;&nbsp;&nbsp;   
            양력 <input type='radio' value='양력' name='birth_type'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> zip code</td>  
          <td width='1%'>
          <td width='74%'><input type='text' name='h_zip1' size='5'> -&nbsp; <input type='text' name='h_zip2' size='5'>&nbsp; <a href='javascript:void(post_searching());'><img align='absMiddle' border='0' src='http://www.kasoo.or.kr/bbseboard/images/bt_search.gif'></a></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 집주소</td>  
          <td width='1%'>
          <td width='74%'><input type='text' name='h_addr' size='55'>&nbsp; </td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 성별</td>  
          <td width='1%'>
          <td width='74%'>남자 <input type='radio' value='남' checked name='sex'>&nbsp;&nbsp;   
            여자 <input type='radio' value='여' name='sex'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 직업</td>  
          <td width='1%'>
          <td width='74%'><select size='1' name='job'>  
              <option value=''>- 선택 -</option><option  value='무직'>무직</option><option  value='학생'>학생</option><option  value='컴퓨터/인터넷'>컴퓨터/인터넷</option><option  value='언론'>언론</option><option  value='공무원'>공무원</option><option  value='군인'>군인</option><option  value='서비스업'>서비스업</option><option  value='교육'>교육</option><option  value='금융/증권/보험업'>금융/증권/보험업</option><option  value='유통업'>유통업</option><option  value='예술'>예술</option><option  value='의료'>의료</option><option  value='볍률'>법률</option><option  value='건설업'>건설업</option><option  value='제조업'>제조업</option><option  value='부동산업'>부동산업</option><option  value='운송업'>운송업</option><option  value='농/수/임/광산업'>농/수/임/광산업</option><option  value='가사'>가사</option><option  value='기타'>기타</option>
            </select></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 메일링 수신</td> 
          <td width='1%'> 
          <td width='74%'>수신 <input type='radio' value='yes' checked name='mailling'>&nbsp;&nbsp;   
            수신거부 <input type='radio' value='no' name='mailling'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 개인정보공개</td> 
          <td width='1%'> 
          <td width='74%'>공개 <input type='radio' value='yes' checked name='info_open'>&nbsp;&nbsp;   
            비공개 <input type='radio' value='no' name='info_open'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 추천아이디</td>  
          <td width='1%'>
          <td width='74%'>input type='text' name='recom_id' size='20'></td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 자기 소개</td>
          <td width='1%'>          
          <td width='74%'><textarea rows='5' name='intro' style='width:100%'></textarea></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 좋아하는 연애인</td>  
          <td width='1%'>
          <td width='74%'><select size='1' name='add_01'>
<option value=''>-- 선택 --</option>
<option value='유호성'>유호성</option>
<option value='장동건'>장동건</option>
<option value='정우성'>정우성</option>
<option value='차태현'>차태현</option>
<option value='없음'>아무도 없음</option>
</select></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 직장명</td>  
          <td width='1%'>
          <td width='74%'><input type='text' name='add_02'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 경혼 유무</td>  
          <td width='1%'>
          <td width='74%'>미혼 <input type='radio' value='미혼' checked name='add_03'> &nbsp;&nbsp;기혼 <input type='radio' value='기혼' name='add_03'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 뉴스 레터 받기</td>  
          <td width='1%'>
          <td width='74%'>받음 <input type='checkbox' name='add_04' checked value='받음'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='25%' height='30'>&nbsp;<img src='http://www.kasoo.or.kr/bbseboard/images/dot_20.gif'> 사이트 건의사항</td>  
          <td width='1%'>
          <td width='74%'><textarea rows='5' name='add_05' style='width:100%'></textarea></td>
        </tr>
      </table>

    </td>
  </tr>
</table>
<table border='0' width='550' align='center' cellspacing='0' cellpadding='0'>
  <tr>
    <td width='100%' align='center' height='30'><input type='image' src='http://www.kasoo.or.kr/bbseboard/images/bt_memberjoin.gif' border='0' align='absmiddle' style='border:0'></a>&nbsp;&nbsp;&nbsp;<a href='javascript:document.member_form.reset()'><img src='http://www.kasoo.or.kr/bbseboard/images/bt_cancel.gif' border='0' align='absmiddle'></a></td>
  </tr>
</form>
</table>

<!---------------------------------------- 회원 가입 폼 ---------------------------------------------->
<br><br>
<!---------------------------- 하단 html --------------------------->
    </td>
  </tr>
  <tr>
    <td width="620" valign="top" height='20' bgcolor='#FFFFFF'>

      <table border="0" width="100%" height='100%' cellspacing="0" cellpadding="0" bgcolor='#6BA4C9'>
        <tr>
          <td width="100%" align="center"><img border="0" src="../images/copyright.gif" width="352" height="10"></td>
        </tr>
      </table>

    </td>
  </tr>
</table>
<!---------------------------- 하단 html --------------------------->      
   
     
</body>     
     
</html>     
