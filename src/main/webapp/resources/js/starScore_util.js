/* ---------------- 별점 기능 구현 ---------------- */
const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
let maskMax = 0; //오버레이 마스크 최대 너비
let preSize = 0;

window.addEventListener('DOMContentLoaded',()=>{
    //별 이미지 SVG 개수만큼 생성
    for(let i = 0;i < maxStar;i++){
        let el = document.createElement('div');
        el.style.width = starSize + 'px';
        el.style.height = starSize + 'px';
        el.style.marginRight = gutter + 'px';
        //인라인 SVG 이미지 부착
        el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
        document.querySelector('.rating').appendChild(el);//입력 필드 최대값 재설정
    }

    maskMax = parseInt(starSize * maxStar + gutter * (maxStar-1));//최대 마스크 너비 계산
    document.querySelector('input[name=score]').max = maxStar;//입력 필드 최대값 재설정
	
    //마우스 클릭 별점 변경 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',(e)=>{
	    //closest()로 .rating 요소의 왼쪽 위치를 찾아서 현재 클릭한 위치에서 빼야 상대 클릭 위치를 찾을 수 있음.
	    let maskSize = parseInt(maskMax - parseInt(e.clientX) + e.target.closest('.rating').getBoundingClientRect().left);//클릭한 위치 기준 마스크 크기 재계산
		// 0점
		if(maskSize<=158 && maskSize>=150) {
			maskSize = 158;
			preSize = 158;
		}
		// 0.5점
		else if(maskSize<=148 && maskSize>=140) {
			maskSize = 144;
			preSize = 144;
		}
		// 1점
		else if(maskSize<=137 && maskSize>=118) {
			maskSize = 127;
			preSize = 127;
		}
		// 1.5점
		else if(maskSize<=117 && maskSize>=106) {
			maskSize = 112;
			preSize = 112;
		}
		// 2점
		else if(maskSize<=105 && maskSize>=86) {
			maskSize = 95;
			preSize = 95;
		}
		// 2.5점
		else if(maskSize<=85 && maskSize>=75) {
			maskSize = 80;
			preSize = 80;
		}
		// 3점
		else if(maskSize<=74 && maskSize>=54) {
			maskSize = 64;
			preSize = 64;
		}
		// 3.5점
		else if(maskSize<=53 && maskSize>=43) {
			maskSize = 48;
			preSize = 48;
		}
		// 4점
		else if(maskSize<=42 && maskSize>=24) {
			maskSize = 33;
			preSize = 33;
		}
		// 4.5점
		else if(maskSize<=23 && maskSize>=9) {
			maskSize = 16;
			preSize = 16;
		}
		// 5점
		else if(maskSize<=8 && maskSize>=1) {
			maskSize = 1;
			preSize = 1;
		} else {
			maskSize = preSize;
		}
	    document.querySelector('.overlay').style.width = maskSize + 'px'; //오버레이 마스크 크기 변경해서 별점 마킹
	    document.querySelector('input[name=score]').value = Math.floor((maskMax - maskSize) / (starSize + gutter)) + parseFloat(((maskMax - maskSize) % (starSize + gutter) / starSize).toFixed(1));
		console.log(document.querySelector('input[name=score]').value);
	});        
});