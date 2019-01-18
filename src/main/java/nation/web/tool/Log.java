package nation.web.tool;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * �α� ����� �ϱ� ���ϰ� �ۼ��� Ŭ����
 * <pre>
 * Copyright 2010 SOA 4, Inc. All rights reserved.
 * ��Ű����        : nation.web.tool 
 * ���ϸ�          : Log.java , 2017. 9. 7. ���� 2:46:40
 * �ۼ���          : ������
 * �ۼ��� email  : zz@zzz.com
 * ��������
 * ----------------------------------------------
 * ���� �̷�
 * ---------------------------------------------- 
 * ������  ������  ����ó  ���� ����
 * ---------------------------------------------- 
 * 
 * ----------------------------------------------
 * 
 *</pre>
 */
public class Log {
    
    private static int TEST_MODE = 1; // 0: ����, 1: WTP �׽�Ʈ
    
    public Log(){
     
    }

    /**
     * �α� ����� �����ϴ� �޼ҵ��Դϴ�.
     * @param logName �α��̸�(�з���)
     * @param level �α� ��� ����
     * @param class_methodname Ŭ����, �޼ҵ��
     * @param msg ����� �޽���
     * @param t Exception ������ ������ �ִ� ��ü��
     */
    public static void w(String logName, String level, String class_methodname, String msg, Throwable t){
        String str="";
        
        if (TEST_MODE == 0){ // ����, Cafe24
            str = "./WEB-INF/log.properties";
        }

        if (TEST_MODE == 1){ // Eclipse WTP �׽�Ʈ
            str = "./WebContent/WEB-INF/log.properties";
        }

        // properties ȯ�� ���� ���� ����
        // System.out.print(str);
        PropertyConfigurator.configure(str);

        // �α��̸� ����(�ƹ� �̸��̳� ����, �Ϲ������� ��Ű����)
        Logger log = Logger.getLogger(logName);
        
        // �α� ��� ������ Level.WARN�� ��� 
        // Level.DEBUG, Level.INFO�� ����� ���� ����.
        log.setLevel(Level.DEBUG);

        // ����� �޽��� ����
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
     * �α� ����� �����ϴ� �޼ҵ��Դϴ�.
     * @param logName �α��̸�(�з���)
     * @param level �α� ��� ����
     * @param request IP, ������ ID
     * @param msg ����� �޽���
     * @param t Exception ������ ������ �ִ� ��ü��
     */
    public static void w(String logName, String level, HttpServletRequest request, String msg, Throwable t){
        String str="";
        
        if (TEST_MODE == 0){ // ����, Cafe24
            str = "./WEB-INF/log.properties";
        }

        if (TEST_MODE == 1){ // Eclipse WTP �׽�Ʈ
            str = "./WebContent/WEB-INF/log.properties";
        }

        // properties ȯ�� ���� ���� ����
        // System.out.print(str);
        PropertyConfigurator.configure(str);

        // �α��̸� ����(�ƹ� �̸��̳� ����, �Ϲ������� ��Ű����)
        Logger log = Logger.getLogger(logName);
        
        // �α� ��� ������ Level.WARN�� ��� 
        // Level.DEBUG, Level.INFO�� ����� ���� ����.
        log.setLevel(Level.DEBUG);

        // ����� �޽��� ����
        StringBuffer _msg = new StringBuffer();
        _msg.append(logName + "/");
        _msg.append(request.getRemoteAddr() + "/"); // ������ IP ����
        _msg.append(request.getSession(true).getAttribute("email") + "/"); // user id ����
        _msg.append(msg); // �����ڰ� �߰��� ������ �޽���
        
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
