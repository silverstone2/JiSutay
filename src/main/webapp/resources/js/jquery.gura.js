    //플러그인 javascript 만드는 방법
    (function($){
        //gura() 라는 이름의 동작 만들기 
        $.fn.gura=function(options){
            //default 값 정의
            var settings=$.extend({
                msg:"나는 구라다!",
                color:"#000000"
            }, options);

            //settings object 안에 있는값을 이용해서 동작 
            this.text(settings.msg).css("color", settings.color);
            
            //chain 형태로 동작이 가능하도록 
            return this;
        };
    })(jQuery);