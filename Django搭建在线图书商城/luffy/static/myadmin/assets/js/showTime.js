var getTime = function(){
    var now = new Date;
    var h = now.getHours();
    var mm = now.getMinutes();
    var str;
    if(h>12) {
        h -= 12;
        str = " PM";
    }else{
        str = " AM";
    }
    h = h < 10 ? "0" + h : h;
    mm = mm < 10 ? "0" + mm : mm;
    var xy = h + ":" + mm ;
    xy += str;
    return xy;
};
$(".haerd_time").text(getTime());
setInterval(function () {
   $(".haerd_time").text(getTime());
}, 30000)