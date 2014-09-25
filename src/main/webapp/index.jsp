<!DOCTYPE html><%!
  public String ping(String s) {
   //System.out.println("oo");
   String now=""+new java.util.Date().getTime()+"";
   String nowF=now.substring(0,1)+"."+
    now.substring(1,4)+"."+
    now.substring(4,7)+"."+
    now.substring(7,10)+"~"+
    now.substring(10);
   return "[INFO] "+nowF+":  "+s;
  }
%>
<%
 response.setContentType("text/html; charset=UTF-8");
 System.err.print("");
 System.out.println( ping(
  "HelloPlanet from "+
  request.getRemoteHost()+" ("+
  request.getRemoteAddr()+")"));
 System.out.println( ping(
  " UserAgent: "+
   request.getHeader("User-Agent")));
%>
<html>
 <head>
  <title>DigitalPlanet</title>
  <link rel="canonical" href="http://planet.sl4.eu/"/>
  <meta content="text/html;charset=utf-8" http-equiv="Content-Type"/>
  <script>

 function osmLoaded() {
  document.getElementById('spinner').style.zIndex=-1;
 }
  </script>

  <style>
#landmarks a {
 color: black;
}

.matColor {
 padding:3pt;
 padding-left:10pt;
 margin-right:4pt;
}
#nav button {
 width:20px;
 height:20px;
 z-index:2;
 position:absolute;
 text-align:center;
 font-size:9pt;
 padding:0}
  </style>
 </head>
 <body style="font-family:Arial;background-color:#aaa">
  <table>
   <tr>
    <td>
     <div style="position:relative">
      <img style="z-index:2;left:0px;top:0;position:relative" alt="DigitalPlanetSplash"
       src="/img/DigitalPlanetSplash.png"/>
      <div style="z-index:4;left:0px;top:0;position:absolute">
       <canvas id="pane" width="780" height="600" onclick="click(this)"></canvas>
       <div id="browser" style="z-index:5;left:75px;top:195px;position:relative;background:white;padding:8px;display:none">
        <p>We're sorry, but your WebBrowser (probably <a href="http://gawker.com/5826643/internet-explorer-users-are-objectively-stupid">InternetExplorer</a>?) is too old for DigitalPlanet.</p>
        <p>Please upgrade to a better one:</p>
        <a href="https://chrome.google.com/">
         <img alt="GoogleChrome"
          src="https://www.google.com/intl/en/chrome/assets/common/images/chrome_logo_2x.png"/></a>
        <a href="https://www.mozilla.org/firefox">
         <!-- http://de.wikipedia.org/wiki/Datei:Mozilla_Firefox_Logo_mit_Schriftzug.png -->
         <img alt="FireFox"
          src="http://upload.wikimedia.org/wikipedia/de/thumb/3/37/Mozilla_Firefox_Logo_mit_Schriftzug.png/320px-Mozilla_Firefox_Logo_mit_Schriftzug.png"
          width="240" height="80"/></a>
       </div>
       <div id="nav">
        <div style="z-index:10;left:0px;top:0;position:absolute">
         <img src="http://upload.wikimedia.org/wikipedia/commons/8/8c/Transparent.png"
          width="150" height="150" alt="Navigation" usemap="#navMap"
          style="left:0px;top:0;position:relative;border:0"/>
         <!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) -->
         <map name="navMap">
          <area shape="poly" alt="rotate X +" title="rotate X +"
           coords="11,103,11,88,33,78,57,81,75,97,60,106,44,100,33,99,19,106" href="javascript:rot(rotX,1)"/>
          <area shape="poly" alt="rotate X -" title="rotate X -"
           coords="10,133,19,125,32,133,47,132,60,127,71,138,52,146,37,147,17,143" href="javascript:rot(rotX,3)"/>
          <area shape="poly" alt="rotate Y +" title="rotate Y +"
           coords="115,49,120,55,110,79,110,90,121,112,108,122,92,88,95,64,104,52" href="javascript:rot(rotY,1)"/>
          <area shape="poly" alt="rotate Y -" title="rotate Y -"
           coords="122,47,129,34,146,44,151,67,150,91,132,113,122,100,131,83,131,64" href="javascript:rot(rotY,3)"/>
          <area shape="poly" alt="rotate Z +" title="rotate Z +"
           coords="45,25,63,11,115,9,117,31,88,30,82,23,67,24,50,32,45,29" href="javascript:rot(rotZ,1)"/>
          <area shape="poly" alt="rotate Z -" title="rotate Z -"
           coords="61,34,69,25,86,28,91,42,78,48,63,45" href="javascript:rot(rotZ,3)"/>
          <!--
           <area shape="poly" alt="move X -" title="move X -" coords="76,65,88,59,94,65,89,75,79,73" href="" target=""/>
           <area shape="poly" alt="" title="3" coords="101,37,107,44,97,56,65,61,36,52,40,29,53,37,63,46,79,47" href="" target=""/>
          -->
         </map>
        </div>
        <button onclick="zoomLevel++;draw()"
         style="left:5px;top:15px;z-index:18">+</button>
        <button onclick="zoomLevel--;draw()"
         style="left:5px;top:45px;z-index:18">-</button>
<!--      <button onclick="cursorPos[2]+=Math.pow(2,23-zoomLevel);draw()"
       style="left:55px;top:10px">&#8593;</button>
      <button onclick="cursorPos[1]-=Math.pow(2,23-zoomLevel);draw()"
       style="left:35px;top:30px">&#8592;</button>
      <button onclick="cursorPos[1]+=Math.pow(2,23-zoomLevel);draw()"
       style="left:75px;top:30px">&#8594;</button>
      <button onclick="cursorPos[2]-=Math.pow(2,23-zoomLevel);draw()"
       style="left:55px;top:50px">&#8595;</button>
      <button onclick="rotZ=(rotZ+3)%4;draw()"
       style="left:35px;top:70px">&#x2196;</button>
      <button onclick="rotZ=(rotZ+1)%4;draw()"
       style="left:75px;top:70px">&#x2197;</button>
-->
      <div id="landmarks"
       style="left:568px;top:3px;z-Index:8;position:absolute;background:grey;font-size:9pt;padding:2px">
       <div><button id="btnLandMarks" onclick="toggleMenu(this)" style="position:relative">-</button> LandMarks</div>
       <div id="contentLandMarks" style="display:block">
        <table style="font-size:7pt;vertical-align:top;text-align:center">
         <tr>
          <td>
           <a onclick="hot('GreatPyramid')" href='#'>
            <!-- https://en.wikipedia.org/wiki/File:Kheops-Pyramid.jpg -->
            <img width="60" height="37" alt="GreatPyramid"
             src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Kheops-Pyramid.jpg/120px-Kheops-Pyramid.jpg"/><br/>
            GreatPyramid</a></td>
          <td>
           <a onclick="hot('IlColosseo')" href='#'>
            <!-- https://en.wikipedia.org/wiki/File:Colosseum_in_Rome,_Italy_-_April_2007.jpg -->
            <img width="60" height="35" alt="IlColosseo"
             src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Colosseum_in_Rome%2C_Italy_-_April_2007.jpg/120px-Colosseum_in_Rome%2C_Italy_-_April_2007.jpg"/><br/>
            IlColosseo</a></td>
          <td>
           <a onclick="hot('LockSchuppen')" href='#'>
            <img alt="LockSchuppen"
             src="/img/LockSchuppenCropped.png"/><br/>
<!-- former https://bigtablenomic.googlecode.com/files/LockSchuppenCropped.png -->
             LockSchuppen</a></td>
         </tr>
         <tr>
          <td>
           <a onclick="hot('CristoRedentor')" href='#'>
            <!-- https://en.wikipedia.org/wiki/File:Cristo_Redentor_-_Rio_de_Janeiro,_Brasil.jpg -->
            <img width="35" height="50" alt="CristoRedentor"
             src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Cristo_Redentor_-_Rio_de_Janeiro%2C_Brasil.jpg/80px-Cristo_Redentor_-_Rio_de_Janeiro%2C_Brasil.jpg"/><br/>
            CristoRedentor</a></td>
          <td>
           <a onclick="hot('StatueOfLiberty')" href='#'>
            <!-- https://en.wikipedia.org/wiki/File:Statue_of_Liberty_7.jpg -->
            <img width="35" height="50" alt="StatueOfLiberty"
             src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Statue_of_Liberty_7.jpg/87px-Statue_of_Liberty_7.jpg"/><br/>
            StatueOfLiberty</a></td>
          <td>
           <a onclick="hot('TourEiffel')" href='#'>
            <!-- https://de.wikipedia.org/wiki/Datei:Tour_Eiffel_Wikimedia_Commons.jpg -->
            <img width="30" height="50" alt="TourEiffel"
             src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/65px-Tour_Eiffel_Wikimedia_Commons.jpg"/><br/>
            TourEiffel</a></td>
           <!-- ToDo: https://commons.wikimedia.org/wiki/File:Dresden_Goldener_Reiter_(2146003507).jpg 
           https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Dresden_Goldener_Reiter_%282146003507%29.jpg/120px-Dresden_Goldener_Reiter_%282146003507%29.jpg -->
         </tr>
        </table>
       </div>
      </div>
      <div style="left:145px;top:3px;z-Index:8;position:absolute;background:grey;font-size:9pt;padding:6px">
       <div onclick="selectMaterial()">
        Current material:&nbsp;<span id="selectedMaterial" class="matColor" style="background-color:blue"></span>
        <span id="selectedMaterialName">water</span>
       </div>
       <div id="selectMaterial" style="display:none">
         Select:
         <ul style="list-style-type:none;padding:0">
          <li id="mat1" onclick="selectedMaterial(this)">
           <span id="matColor1" class="matColor"></span>
           <span id="matName1"></span></li>
          <li id="mat2" onclick="selectedMaterial(this)">
           <span id="matColor2" class="matColor"></span>
           <span id="matName2"></span></li>
          <li id="mat3" onclick="selectedMaterial(this)">
           <span id="matColor3" class="matColor"></span>
           <span id="matName3"></span></li>
          <li id="mat4" onclick="selectedMaterial(this)">
           <span id="matColor4" class="matColor"></span>
           <span id="matName4"></span></li>
          <li id="mat5" onclick="selectedMaterial(this)">
           <span id="matColor5" class="matColor"></span>
           <span id="matName5"></span></li>
          <li id="mat6" onclick="selectedMaterial(this)">
           <span id="matColor6" class="matColor"></span>
           <span id="matName6"></span></li>
          <li id="mat7" onclick="selectedMaterial(this)">
           <span id="matColor7" class="matColor"></span>
           <span id="matName7"></span></li>
          <li id="mat8" onclick="selectedMaterial(this)">
           <span id="matColor8" class="matColor"></span>
           <span id="matName8"></span></li>
          <li id="mat9" onclick="selectedMaterial(this)">
           <span id="matColor9" class="matColor"></span>
           <span id="matName9"></span></li>
          <li id="mat10" onclick="selectedMaterial(this)">
           <span id="matColor10" class="matColor"></span>
           <span id="matName10"></span></li>
          <li id="mat11" onclick="selectedMaterial(this)">
           <span id="matColor11" class="matColor"></span>
           <span id="matName11"></span></li>
        </ul>
       </div>
      </div>
      <div id="palette"
       style="left:145px;top:33px;z-Index:4;position:absolute;background:grey;font-size:9pt;padding:2px">
       <div><button id="btnTools" onclick="toggleMenu(this)" style="position:relative">+</button> Tools</div>
       <div id="contentTools" style="display:none">
        Show/hide materials:
        <ul style="list-style-type:none;padding:0">
         <li>
          <input id="showMatAll" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <b><i>all</i></b>
         <li>
          <input id="showMat2" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor2" class="matColor"></span>
          <span id="showMatName2"></span></li>
         <li>
          <input id="showMat3" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor3" class="matColor"></span>
          <span id="showMatName3"></span></li>
         <li>
          <input id="showMat4" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor4" class="matColor"></span>
          <span id="showMatName4"></span></li>
         <li>
          <input id="showMat5" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor5" class="matColor"></span>
          <span id="showMatName5"></span></li>
         <li>
          <input id="showMat6" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor6" class="matColor"></span>
          <span id="showMatName6"></span></li>
         <li>
          <input id="showMat7" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor7" class="matColor"></span>
          <span id="showMatName7"></span></li>
         <li>
          <input id="showMat8" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor8" class="matColor"></span>
          <span id="showMatName8"></span></li>
         <li>
          <input id="showMat9" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor9" class="matColor"></span>
          <span id="showMatName9"></span></li>
         <li>
          <input id="showMat10" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor10" class="matColor"></span>
          <span id="showMatName10"></span></li>
         <li>
          <input id="showMat11" type="checkbox" checked="checked" onclick="toggleMaterial(this)"/>
          <span id="showMatColor11" class="matColor"></span>
          <span id="showMatName11"></span></li>
        </ul>
      </div>
      <!-- p id="clickHint" onclick="draw()"
       style="left:275px;top:70px;z-Index:2;position:absolute;background:white;padding:3px;width:200px">click to zoom!</p -->
     </div>
    </div>
    </div>
    </div>
    </td>
    <td style="vertical-align:top;font-family:courier;font-size:8pt">
     <h1>DigitalPlanet</h1>
     <p><a href="http://time.sl4.eu/">Now</a> with <span id="cubeCount"><i>n</i></span> cubes:
     <table >
      <tr>
       <td>x:<br/><canvas id="xBox" width="80" height="80"></canvas></td>
       <td>y:<br/><canvas id="yBox" width="80" height="80"></canvas></td>
       <td>z:<br/><canvas id="zBox" width="80" height="80"></canvas></td>
      </tr>
     </table>
     <table style="font-family:courier;font-size:7pt">
      <tr><td>CubeId:</td>       <td id="node"></td></tr>
      <tr><td>ParentCube:</td>   <td id="parent"></td></tr>
      <tr><td>Material:</td>     <td id="material"></td></tr>
      <tr><td>EdgeLength:</td>   <td id="size"></td></tr>
      <tr><td>Center Lat/Lon/Alt:</td><td id="pos"></td></tr>
      <tr><td>BoundingBox:</td>  <td id="info"></td></tr>
      <tr><td></td>              <td id="infoTo"></td></tr>
      <tr><td>Children:</td>     <td><span id="childCount">0</span> direct</td></tr>
      <tr><td></td>              <td><span id="allChildCount">0</span> total</td></tr>
     </table>
     OpenStreetMap:
     <a href="" id="osm" target="osm"><img alt="OpenStreetMap" src="https://ssl.gstatic.com/codesite/ph/images/tearoff_icon.gif"/></a>
     <div style="position:relative">
      <img id="img" alt="OpenStreetMap" onLoad="osmLoaded()" style="z-index:1;left:0px;top:0;position:absolute"
       src="http://pafciu17.dev.openstreetmap.org/?module=map&amp;width=260&amp;height=250&amp;zoom=1&amp;lat=35&amp;lon=58"/>
      <img id="spinner" alt="spinner" src="https://spriteme.googlecode.com/svn/trunk/images/spinner.gif"
        style="z-index:2;left:110px;top:110px;position:absolute"/>
     </div>
    </td>
   </tr>
  </table>
  <!-- former https://closure-library.googlecode.com/svn/trunk/closure/goog/base.js , see
   http://stackoverflow.com/questions/2218368/why-isnt-googles-closure-library-hosted-on-their-cdn : -->
  <script src="https://cdn.rawgit.com/google/closure-library/master/closure/goog/base.js"></script>
  <!--script src="https://dresdenlabs.appspot.com/cubes.js"></script-->
  <!--script src="https://bigtablenomic.googlecode.com/svn/trunk/cubes.js"></script-->
  <!--script src="https://bigtablenomic.googlecode.com/files/cubes.js"></script-->
  <!--script src="cubes.js"></script-->
  <script src="allCubes.js"></script>
  <!--script src="https://bigtablenomic.googlecode.com/files/RecentCubes.js"></script-->
  <!--script src="DigitalPlanetOne.js"></script-->
  <script src="TerraMind.js"></script>
 </body>
</html>
