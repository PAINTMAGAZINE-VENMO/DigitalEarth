<!DOCTYPE html><html><head><title>Supergenau Kalorien, Vitamine und so... « α</title><meta content="text/html;charset=utf-8" http-equiv="Content-Type" /><meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport" /></head><style>
body{font-size:90%;margin:0}
a{border:0;text-decoration:none;
 }
h1{font-size:115%;margin:0;font-family:sans-serif;background:#0f0;colo:#fff}
</style><body>
<h1>
<span style="background:#000;margin-right:8px">
 <a href="/" style="color:#0f0;padding:5px;font-family:serif"> α </a>
</span>» FoodApp: Supergenau Kalorien, Vitamine und so...</h1>
<table><tr><td>Deine Portion: <input max="9999" min="1" name="a" size="4" type="number" />
</td><td>
 <input checked="true" name="u" type="radio" value="g">g (Gramm)</input><br /><input name="u" type="radio" value="ml">ml (MilliLiter)</input>
</td></tr></table>
<br/>und von hinten nach vorne die letzten Ziffern vom BarCode:
<div style="text-align:right;font-family:monospace">
<input id="c" name="c" style="text-align:right;font-family:monospace" value=" "/><br/>
<table id="p" style="text-align:right"><tr><td>produkte werden geladen...</tr></td></p></div>
<script src="/RootHandler.jsp?p=ean"></script>
<script>
try {
var c = document.getElementById('c');
var p = document.getElementById('p');

//http://stackoverflow.com/questions/280634/endswith-in-javascript
function endsWith(str, suffix) {
 return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function ps() {
 var s='<tr>';
 for (i =0;i<as.length;i++) {
  a=as[i].split(' ');
  if(endsWith(a[1],c.value.trim())){
   s+='<td>'+as[i].substring(a[0].length+a[1].length+2)+'</td>';
   s+='<td>'+a[1]+'</td>';
   s+='<td><img width=32 src=\'eanImg/'+a[0]+'.jpg\'/></td></tr>';
  }
 }
 p.innerHTML=s
}
ps();

//http://stackoverflow.com/questions/12009015/setselectionrange-workaround-doesnt-work-for-android-4-0-3
setTimeout(function() {
 c.selectionStart=1;
 c.selectionEnd=1;},0);

c.oninput=function() {
 setTimeout(function() {
  c.value=" "+c.value.replace(" ",""); 
  c.selectionStart=1;
  c.selectionEnd=1;
  //https://plainjs.com/javascript/styles/get-and-set-scroll-position-of-an-element-26/
  c.scrollTop=5;
  document.body.scrollTop =50;
  ps();
},0);
}
c.onkeydown=function() {
 var k = event.keyCode||event.charCode;
//alert(k);
 if(k==8||k==46) {
  setTimeout(function() {
   c.value=' '+c.value.replace(' ','').substring(1);
   c.selectionStart=1;
   c.selectionEnd=1;
   ps();
  },0);
  return false
 }
}

}
catch(e) {
 alert(e);
}
</script></body></html>