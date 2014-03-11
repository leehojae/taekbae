
<html>
<head>
<title>기업 회원 가입 폼</title>
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
 function addFunction(){
	 
 }
   

//-->
</SCRIPT>
</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

<!---------------------------------------- 회원 가입 폼 ---------------------------------------------->

	
<table border='0' width='550' align='center' bgcolor='#686868' cellspacing='1' cellpadding='0'>
<form method="post" action="ajax/addOffice.do">


	
      <table border='0' cellpadding='0' cellspacing='0' width='40%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'   style='text-align: center;'><h1>SDMS 기업 회원 가입 </h1></td>
         
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;사업자번호 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeNum' size='20' maxlength='20'>
          </td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;전화번호 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeTel' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;팩스 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeFax' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;상호명 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeName' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;우편번호</td>  
         <td width='74%'><input type='text' name='officePostNum' size='20'></td>
          </td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;주소</td>  
         
          <td width='74%'><input type='text' name='officeAddr' size='50'>&nbsp; </td>  
        </tr>  
     </table>
      <table border='0' cellpadding='0' cellspacing='0' width='40%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'   style='text-align: center;'>
          	 <input id="delBtn" type="submit" value="가입"  />
    			<input id="cancelBtn" type="reset" value="취소" />
          
          </td>
         
        </tr>
      </table>
      </form>
</body>     
     
     
    
     
     
     
</html>     
