(fn [rq rs]
 (let [
   formatHash
    (fn [hash]
     (apply str
      (map #(format "%02x" (bit-and % 0xff))
       hash)))]
  (hiccup.core/html "<!DOCTYPE html>"
   [:html
    [:head
     [:title "TimeToHilde « SemperBase"]
     [:meta {:http-equiv "Content-type" :content "text/html; charset=utf-8"}]
     [:style {:type "text/css"} "
body {
 background: #000;
 color: #0f0;
 font-family: monospace;
}
a {
 color: #0f0;
}"]]
   [:body]
    [:canvas#c {:width 320 :height 40}]
    [:script "
var pins={
 '1111110",//0
 '0110000",
 '1101101",
 "1111001",
 "0110011",//4
 "1011011",
 "1011111",
 "1110000",
 "1111111",//8
 "1111011",
 "1110111",
 "0011111",
 "1001110",
 "0111101",
 "1001111",
 "1000111"};
var ctx=document.getElementById('c').getContext('2d');

function digit(v,x) {
  ctx.beginPath();
  ctx.moveTo(x+80,10);
  ctx.lineTo(x+70,70);
  ctx.lineTo(x+70,70);
  ctx.stroke();
}

function tick() {
 ctx.fillStyle='#0f0';
 ctx.fillRect(0,0,1024,512);
 var now=new Date();
 var t0=Math.floor(now.getTime()/1000);
 for (var i=0; i<8; i++) {
  digit(i,i);
 }
}

setInterval(tick,1000);
"]])))