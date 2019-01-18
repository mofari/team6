package nation.web.tool;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * 로그 기록을 하기 편하게 작성된 클래스
 * <pre>
 * Copyright 2010 SOA 4, Inc. All rights reserved.
 * 패키지명        : nation.web.tool 
 * 파일명          : Log.java , 2017. 9. 7. 오후 2:46:40
 * 작성자          : 개발자
 * 작성자 email  : zz@zzz.com
 * 수정내용
 * ----------------------------------------------
 * 수정 이력
 * ---------------------------------------------- 
 * 수정일  수정자  연락처  수정 내용
 * ---------------------------------------------- 
 * 
 * ----------------------------------------------
 * 
 *</pre>
 */
public class Log {
    
    private static int TEST_MODE = 1; // 0: 배포, 1: WTP 테스트
    
    public Log(){
     
    }

    /**
     * 로그 기록을 전담하는 메소드입니다.
     * @param logName 로그이름(분류명)
     * @param level 로그 기록 레벨
     * @param class_methodname 클래스, 메소드명
     * @param msg 기록할 메시지
     * @param t Exception 정보를 가지고 있는 객체명
     */
    public static void w(String logName, String level, String class_methodname, String msg, Throwable t){
        String str="";
        
        if (TEST_MODE == 0){ // 배포, Cafe24
            str = "./WEB-INF/log.properties";
        }

        if (TEST_MODE == 1){ // Eclipse WTP 테스트
            str = "./WebContent/WEB-INF/log.properties";
        }

        // properties 환경 설정 파일 지정
        // System.out.print(str);
        PropertyConfigurator.configure(str);

        // 로그이름 지정(아무 이름이나 가능, 일반적으로 패키지명)
        Logger log = Logger.getLogger(logName);
        
        // 로그 기록 레벨이 Level.WARN일 경우 
        // Level.DEBUG, Level.INFO는 기록을 하지 않음.
        log.setLevel(Level.DEBUG);

        // 기록할 메시지 조합
        StringBuffer _msg = new StringBuffer();
        _msg.append(logName + "/");
        _msg.append(class_methodname + "/");
        _msg.append(msg);
        
        String logMsg = _msg.toString();

        if ( level.toUpperCase().equals("FATAL")){
            log.fatal(logMsg, t);
        }
     
        if ( level.toUpperCase().equals("ERROR")){
            log.error(logMsg, t);     
        }

        if ( level.toUpperCase().equals("WARN")){
            log.warn(logMsg);     
        }

        if ( level.toUpperCase().equals("INFO")){
            log.info(logMsg);
        }

        if ( level.toUpperCase().equals("DEBUG")){
            log.debug(logMsg, t);     
        }
    }
    
    /**
     * 로그 기록을 전담하는 메소드입니다.
     * @param logName 로그이름(분류명)
     * @param level 로그 기록 레벨
     * @param request IP, 접속자 ID
     * @param msg 기록할 메시지
     * @param t Exception 정보를 가지고 있는 객체명
     */
    public static void w(String logName, String level, HttpServletRequest request, String msg, Throwable t){
        String str="";
        
        if (TEST_MODE == 0){ // 배포, Cafe24
            str = "./WEB-INF/log.properties";
        }

        if (TEST_MODE == 1){ // Eclipse WTP 테스트
            str = "./WebContent/WEB-INF/log.properties";
        }

        // properties 환경 설정 파일 지정
        // System.out.print(str);
        PropertyConfigurator.configure(str);

        // 로그이름 지정(아무 이름이나 가능, 일반적으로 패키지명)
        Logger log = Logger.getLogger(logName);
        
        // 로그 기록 레벨이 Level.WARN일 경우 
        // Level.DEBUG, Level.INFO는 기록을 하지 않음.
        log.setLevel(Level.DEBUG);

        // 기록할 메시지 조합
        StringBuffer _msg = new StringBuffer();
        _msg.append(logName + "/");
        _msg.append(request.getRemoteAddr() + "/"); // 접속자 IP 추출
        _msg.append(request.getSession(true).getAttribute("email") + "/"); // user id 추출
        _msg.append(msg); // 개발자가 추가로 선언한 메시지
        
        String logMsg = _msg.toString();

        if ( level.toUpperCase().equals("FATAL")){
            log.fatal(logMsg, t);
        }
     
        if ( level.toUpperCase().equals("ERROR")){
            log.error(logMsg, t);     
        }

        if ( level.toUpperCase().equals("WARN")){
            log.warn(logMsg);     
        }

        if ( level.toUpperCase().equals("INFO")){
            log.info(logMsg);
        }

        if ( level.toUpperCase().equals("DEBUG")){
            log.debug(logMsg, t);     
        }
    }
    
}
