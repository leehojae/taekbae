       $(function() {
          $('#toolbar')
              .w2toolbar(
                  {
                    name : 'toolbar',
                    items : [
                        {
                          type : 'button',
                          id : 'item1',
                          caption : '엑셀등록',
                          img : 'icon-page',
                          hint : 'Hint for item 1'
                        },
                        {
                          type : 'button',
                          id : 'item2',
                          caption : '디비초기화',
                          img : 'icon-page',
                          hint : 'Hint for item 2'
                        },
                        {
                          type : 'button',
                          id : 'item3',
                          caption : '회원등록',
                          img : 'icon-page',
                          hint : 'Hint for item 3'
                        },
                        {
                          type : 'button',
                          id : 'item4',
                          caption : '점소등록',
                          img : 'icon-page',
                          hint : 'Hint for item 4'
                        },
                        {
                          type : 'button',
                          id : 'item5',
                          caption : '차량등록',
                          img : 'icon-page',
                          hint : 'Hint for item 5'
                        },
                        {
                          type : 'button',
                          id : 'item5',
                          caption : '배송구역등록',
                          img : 'icon-page',
                          hint : 'Hint for item 5'
                        },
                        {
                        	type : 'button',
                        	id : 'item6',
                        	caption : '기사배당표',
                        	img : 'icon-page',
                        	hint : 'Hint for item 6'
                        },
                        {
                          type : 'spacer'
                        },
                        {
                          type : 'html',
                          id : 'item6',
                          html : '<div style="padding: 3px 10px;">'
                              + '<a href="#">${loginUser.name}</a>'
                              + '<a href="${pageContext.request.contextPath}/auth/logout.do">[로그아웃]</a>'
                              + '</div>'
                        }, ],
                        onClick: function (event) {
                          switch (event.target) {
                          case 'item1':
                            console.log('success');
                            openPopup();
                            break;
                          case 'item3':
                        	  goToMemberInfo();
                            break;
                          case 'item4':
                        	  goToOfficeInfo();
                        	  break;
                          case 'item6':  //  /delevery/deleveryMember.jsp
                        	  goToDeleveryMember();
                        	  break;
                          }
                          console.log('Target: '+ event.target, event);
                        }
                  });
        });
       
       
       function goToMemberInfo() {
    		location.href = "member/list.do";
    	}
       function goToDeleveryMember() {
    	   location.href = "excel/deleveryMember.do";
       }
       function goToOfficeInfo() {
   		location.href = "office/list.do";
   	}