{:sh(fn[h](slurp(str"http://127.0.0.1:8080/RootHandler.jsp?p=sh&s="h)))
 :h(fn[x](slurp(str"/home/rawa/SpaceDrive/1220"x(if(.startsWith x "ee")".html"".txt"))))
 :ht(fn[x](hiccup.core/html"<!DOCTYPE html>"[:html x]))}