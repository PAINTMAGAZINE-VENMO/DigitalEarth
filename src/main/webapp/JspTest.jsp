<html>
 <head><title>JspTest</title></head>
 <body>
  PathInfo: <%=request.getPathInfo()%><br/>
  QueryString: <%=request.getQueryString()%><br/>
  RequestURI: <%=request.getRequestURI()%><br/>
  ServletPath: <%=request.getServletPath()%></br>
<script>
 var st=<%=new java.util.Date().getTime()%>;
 var stl=new Date().getTime();
 alert('WARNING: your LocalTime is off to AtomicTime by ca. '+ (st-stl)/1000+'sec!');
</script>
 </body>
</html>
