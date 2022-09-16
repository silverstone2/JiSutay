function reserInfo(e){
	// 01.객실정보 및 요금 
	$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/' + account + '/5',//실시간예약 객실가격 URL 
	function(data){
		var  i = 0;	
		$("table#ROOM_CODE").append("<caption class='alt'>객실정보 및 요금 안내</caption>");
		$("table#ROOM_CODE").append("<tbody></tbody>");
		if(type == "Y"){
			$.each(data.result,function(key,val){
				//비수기
				var P01_WEEK_PRCE = val["P01_WEEK_PRCE"].slice(0,-4);
				var P01_FRD_PRCE = val["P01_FRD_PRCE"].slice(0,-4);
				var P01_SAT_PRCE = val["P01_SAT_PRCE"].slice(0,-4);

				//준성수기
				var P04_WEEK_PRCE = val["P04_WEEK_PRCE"].slice(0,-4);
				var P04_FRD_PRCE = val["P04_FRD_PRCE"].slice(0,-4);
				var P04_SAT_PRCE = val["P04_SAT_PRCE"].slice(0,-4);
				
				//성수기
				var P05_WEEK_PRCE = val["P05_WEEK_PRCE"].slice(0,-4);
				var P05_FRD_PRCE = val["P05_FRD_PRCE"].slice(0,-4);
				var P05_SAT_PRCE = val["P05_SAT_PRCE"].slice(0,-4);
			
				$("table#ROOM_CODE tbody").append(
					"<tr class='room_" + i + "'><td style='background:#fbfbfb;'>" + val["TYPE_NM"] + "</td>"
					+ "<td> "+ val["ADLT_BASE_PERS"] + "명</td><td>" + val["ADLT_MAX_PERS"] + "명</td>"
					+ "<td>" + P01_WEEK_PRCE + "만원</td><td>" + P01_FRD_PRCE + "만원</td><td>" + P01_SAT_PRCE + "만원</td>" 
					+ "<td>" + P05_WEEK_PRCE + "만원</td><td>" + P05_FRD_PRCE + "만원</td><td>" + P05_SAT_PRCE + "만원</td>" 
					+ "</tr>" 
 				);
				i++;
			});
			$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/' + account + '/8',//실시간예약 객실정보 URL
			function(data){
				//타입 배열에 담기
				var arr1 = new Array();
				$.each(data.result,function(key,val){
					var sorts = val["SORT_NO"] - 1;
					arr1.push(data.result[sorts]["TYPE_NAME"]);
				});
				// 중복값체크 
				var arr2 = arr1.reduce(function(a,b){
					if(a.indexOf(b) < 0) a.push(b);
					return a;
				},[]);
				// 일치하는 인덱스값 반환
				var arr3 = new Array();
				for(var n = 0; n < arr1.length; n++){
					for(var c = 0; c < arr2.length; c++){
						if(arr1[n] == arr2[c]){arr3.push(arr1.indexOf(arr2[c]));}
					}
				}
				// 증복값 체크
				var arr4 = arr3.reduce(function(a,b){
					if(a.indexOf(b) < 0) a.push(b);
					return a;
				},[]);
				// 출력
				var arr5 = new Array();
				for(var a = 0; a < arr4.length; a++){
					var h = arr4[a];
					arr5.push(h);
				}
				for(var i = 0; i < arr5.length; i++){
					var ft = arr3.indexOf(arr5[i]);
					var lt = arr3.lastIndexOf(arr5[i]) + 1;
					var rsp = -(ft - lt);
					$("tbody tr").eq(arr5[i]).prepend("<th rowspan='"+ rsp +"'>"+ data.result[arr5[i]]["TYPE_NAME"] +"</th>");	
				}
			});
		}else{
			$.each(data.result,function(key,val){
				//비수기
				var P01_WEEK_PRCE = val["P01_WEEK_PRCE"].slice(0,-4);
				var P01_FRD_PRCE = val["P01_FRD_PRCE"].slice(0,-4);
				var P01_SAT_PRCE = val["P01_SAT_PRCE"].slice(0,-4);
				//성수기
				var P05_WEEK_PRCE = val["P05_WEEK_PRCE"].slice(0,-4);
				var P05_FRD_PRCE = val["P05_FRD_PRCE"].slice(0,-4);
				var P05_SAT_PRCE = val["P05_SAT_PRCE"].slice(0,-4);
				//극성수기
				var P06_SAT_PRCE = val["P05_SAT_PRCE"].slice(0,-4);
				$("table#ROOM_CODE tbody").append(
					"<tr class='room_" + i + "'><th>" + val["TYPE_NM"] + "</th><td>"
					+ val["ADLT_BASE_PERS"] + "명</td><td>" + val["ADLT_MAX_PERS"] + "명</td>"
					+ "<td>" + P01_WEEK_PRCE + "만원</td><td>" + P01_SAT_PRCE + "만원</td><td>" + P01_SAT_PRCE + "만원</td>"
					+ "<td>" + P05_WEEK_PRCE + "만원</td><td>" + P05_SAT_PRCE + "만원</td><td>" + P05_SAT_PRCE + "만원</td>"
					+ "<td>" + P06_SAT_PRCE + "만원</td>"
					+ "</tr>" 
				);
				i++;
			});
		}
	});
	// 02.객실 이용시 확인사항
	$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/' + account + '/3',//실시간예약 입실안내 URL
	function(data){
		$.each(data.result,function(key,val){
			if(val["PONT_YN"] == "Y") $("ul.ENTR_COMM").append("<li style='color:red;'>" + val["ENTR_COMM"] + "</li>");	
			else $("ul.ENTR_COMM").append("<li>" + val["ENTR_COMM"] + "</li>");
		});
	});
	// 03.입금전 확인사항
	$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/' + account + '/2',//실시간예약 취소수수료 URL
	function(data){
		$.each(data.result,function(key,val){
			if(val["PONT_YN"] == "Y") $("ul.CNCL_COMM").append("<li style='color:red;'>" + val["CNCL_COMM"] + "</li>");	
			else $("ul.CNCL_COMM").append("<li>" + val["CNCL_COMM"] + "</li>");	
		});				
	});
	// 04.환불규정
	$.getJSON('http://digitalnow.co.kr/reserve/pensionInfo/' + account + '/1',//실시간예약 환불규정 URL 
	function(data){
		$("table#REFU_PRCE").append("<caption class='alt'>환불규정</caption>");
		$("table#REFU_PRCE").append("<thead><tr></tr></thead><tbody><tr></tr></tbody>");
		$.each(data.result,function(key,val){
			$("table#REFU_PRCE thead tr").append("<th>" + val["STD_DAY"] + "일전</th>");
			$("table#REFU_PRCE tbody tr").append("<td>" + val["CNCL_COMS"] + "%</td>");
			if(val["STD_DAY"] > 30) $("table#REFU_PRCE thead tr th:last").text("예약 취소시 기본수수료");
		});
		$("table#REFU_PRCE thead tr").prepend("<th>입실일<br />기준</th>");
		$("table#REFU_PRCE tbody tr").prepend("<td style='color:#676767;font-weight:13px;font-weight:bold;'>취소<br />위약금</td>");
		$("table#REFU_PRCE thead tr th").eq(1).remove(); $("table#REFU_PRCE tbody tr td").eq(1).remove();
	});
}