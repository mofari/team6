<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import = "java.util.ArrayList" %>

<%@ page import="org.apache.commons.fileupload.FileItem" %>

<%@ page import = "nation.web.tool.Tool" %>
<%@ page import="nation.web.tool.Upload" %>

<%@ page import = "dev.mvc.category.CategoryVO" %>
<%@ page import = "dev.mvc.category.CategoryProc" %>
 
<%@ page import = "dev.mvc.diary.DiaryVO" %>
<%@ page import = "dev.mvc.diary.DiaryProc" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();

CategoryProc categoryProc = new CategoryProc();
DiaryProc diaryProc = new DiaryProc();

String col = Tool.checkNull(request.getParameter("col"));
String word = Tool.checkNull(request.getParameter("word"));

//페이지당 출력할 레코드 갯수
int recordPerPage =  0;
if (request.getParameter("recordPerPage") == null) {
  recordPerPage = 20;
} else {
  recordPerPage = Integer.parseInt(request.getParameter("recordPerPage"));
}

//현재 페이지
int nowPage =  0;
if (request.getParameter("nowPage") == null) {
  nowPage = 1; // 현재 페이지 1부터 시작
} else {
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

//목록 파일
String listFile = "";
if (request.getParameter("listFile") == null) {
  listFile = "list.jsp"; // Gallery
} else {
  listFile = request.getParameter("listFile");
};

%>








