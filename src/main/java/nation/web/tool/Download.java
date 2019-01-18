package nation.web.tool;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Download extends javax.servlet.http.HttpServlet {
  // 서블릿 버전, 생략 가능
  static final long serialVersionUID = 1L;

  // web.xml에 접근 가능
  private ServletConfig config = null;

  // 기본 생성자
  public Download() {
    super();
  }

  /**
   * 톰캣 실행시 최초 1번만 실행 됩니다. init()은 생략가능
   * 
   * @param config
   *          web.xml에 접근가능, 서블릿 환경 정보 저장 객체
   */
  @Override
  public void init(ServletConfig config) throws ServletException {
    this.config = config;
  }

  // Form - get 방식 처리
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doProcess(request, response);
  }

  // Form - post 방식 처리
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doProcess(request, response);
  }

  protected void doProcess(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    ServletContext ctx = config.getServletContext();

    // 저장 폴더를 절대 경로로 변환
    String dir = ctx.getRealPath(request.getParameter("dir"));

    // 파일명 받기
    String filename = request.getParameter("filename");

    // 전체 절대 경로 조합
    File file = new File(dir + "/" + filename);
    String fileStr = dir + "/" + filename;
    String contentType = getType(fileStr);
    // System.out.println("다운로드 타입: " + contentType);

    String disposition = getDisposition(filename, getBrowser(request));
    response.addHeader("Content-disposition", disposition);
    response.setHeader("Content-Transfer-Encoding", "binary");
    response.setContentLength((int) file.length());
    response.setContentType(contentType);
    response.setHeader("Connection", "close");
    response.setCharacterEncoding("utf-8");

    // 파일을 읽어올 크기 지정
    byte buffer[] = new byte[4096];

    try {
      if (file.isFile()) {
        // 파일을 읽어 오는 역활
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(
            file));

        // 사이트에 접속된 접속자에게 출력
        BufferedOutputStream bos = new BufferedOutputStream(
            response.getOutputStream());

        int read = 0;
        // bis.read(buffer): 파일에서 4KB씩 읽어서
        // buffer에 저장
        // 파일의 끝이면 -1
        while ((read = bis.read(buffer)) != -1) {
          // 접속자로 출력
          bos.write(buffer, 0, read);
        }// while
        bis.close();
        bos.close();
      }

    } catch (Exception e) {

    }
  }

  public String getType(String fileUrl) {
    String type = "";
    fileUrl = "file:" + fileUrl;
    try {
      URL u = new URL(fileUrl);
      URLConnection uc = u.openConnection();
      type = uc.getContentType();

    } catch (Exception e) {
      System.out.println(e.toString());
    }

    return type;
  }

  public String getBrowser(HttpServletRequest request) {
    String header = request.getHeader("User-Agent");
    
    // System.out.println("--> header: " + header);
    // System.out.println("--> header.indexOf(Mozilla): " + header.indexOf("Mozilla"));
    if (header.indexOf("Mozilla") > -1) {
      // System.out.println("MSIE Mozilla 발견");
      return "Mozilla";
    } else if (header.indexOf("Chrome") > -1) {
      return "Chrome";
    } else if (header.indexOf("Opera") > -1) {
      return "Opera";
    }
    return "Firefox";
  }

  public static synchronized String getDisposition(String filename, String browser) {
    String dispositionPrefix = "attachment;filename=";
    String encodedFilename = null;
    
    //System.out.println("한글 인코딩 browser: " + browser);
    try {
      if (browser.equals("Mozilla")) {
        
        // System.out.println("Mozilla if문 진입");
        // System.out.println("filename: " + filename);
        
        encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
        // System.out.println("--> browser: " + browser);
        // System.out.println("--> encodedFilename: " + encodedFilename);
        
      } else if (browser.equals("Firefox")) {
        encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
        
      } else if (browser.equals("Opera")) {
        encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
        
      } else if (browser.equals("Chrome")) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < filename.length(); i++) {
          char c = filename.charAt(i);
          if (c > '~') {
            sb.append(URLEncoder.encode("" + c, "UTF-8"));
          } else {
            sb.append(c);
          }
        }
        encodedFilename = sb.toString();
      } else {
        System.out.println("Not supported browser");
      }
    } catch (Exception e) {
      System.out.println(e.toString());
    }

    return dispositionPrefix + encodedFilename;
  }

}

