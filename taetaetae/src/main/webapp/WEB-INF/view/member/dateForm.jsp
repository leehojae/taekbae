 <%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
 <head>
  <title> 날짜 입력 </title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    
    <!--jquery.ui.datepicker 한글팩 -->
    <script src = "../js/jquery.ui.datepicker-ko.js" type = "text/javascript"></script> 
    
    <!--캘린더 : 외부 js파일-->
    <script src = "../js/calendar2.js" type = "text/javascript"></script> 


    <script>

        $(document).ready(function(){

            // jquery.ui.datepicker 기본 사용
            //$("#txtDate").datepicker(); 
            
            /* jquery.ui.datepicker 옵션설정하기 , 자세한 옵션은 API문서 참고.*/
            $("#txtDate").datepicker({
                showOn: "button", //이미지로 사용 , both : 엘리먼트와 이미지 동시사용
                buttonImage: "../images/icon_date.gif", //버튼으로 사용할 이미지 경로
                buttonImageOnly: true //이미지만 보이기
            });

            //datepicker에서 사용한 이미지 버튼 style적용
            $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); 

        });
    </script>

    <style>
        body {font-size:9pt}
        /*img {vertical-align:middle}*/
        #txtDate { margin:2px 2px; height:15px; width:75px;vertical-align:center}
    </style>
 </head>

 <body>
    jquery.ui.datepicker 이용 : <input type="text" id="txtDate" readonly> <br/>
    
    <p>
    HTML 5 제공하는 컨트롤 이용 : <input type="date"><br/>
    (크롬에서는 날짜 선택창이 떠서 날짜를 선택할수있음.)
    </p>
    <!--달력 이미지 클릭시 날짜를 선택할수있는 캘린더 호출-->
    외부 JS파일 이용 : <input type="text" id="date2" class="txt_input" readonly/> 
    <img src="../images/icon_date.gif" title="달력" alt="달력" OnClick="calendar(event, 'date2')" />


 </body>
</html>
