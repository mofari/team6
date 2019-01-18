package nation.web.tool;

import java.util.Locale;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

@Component("dev.mvc.tool.Messages")
public class Messages {
  /**
   * message-context.xml에 선언된 객체를 바인딩
   */
  @Autowired
  private MessageSource ms = null;
  
  public Messages() {
    System.out.println("Messages 객체 생성됨.");  
  }
  
  /**
   * 아이디를 이용하여 메시지 산출
   * @param id 예) categrp.create.success
   * @return 메시지
   */
  public String getMessage(String id) {
    return ms.getMessage(id, null, Locale.getDefault());
  }

  /**
   * 아이디를 이용하여 메시지 산출
   * @param id 예) categrp.create.success
   * @param locale 지역 정보
   * @return 메시지
   */
  public String getMessage(String id, Locale locale) {
    return ms.getMessage(id, null, locale);
  }
  
  /**
   * 메시지 산출
   * @param id 메시지 아이디
   * @param params "인수1/인수2"
   * @return 지역별 메시지 
   */
  public String getMessage(String id, String params) {
    StringTokenizer st = new StringTokenizer(params, "/");
    int count = st.countTokens();                   // 단어(토큰) 갯수
    String[] params_array = new String[count]; // 단어 갯수만큼 배열 선언
    
    for (int index=0; index < count; index++) {
      params_array[index] = st.nextToken();    // 배열에 단어 저장
    }
    
    return ms.getMessage(id, params_array, Locale.getDefault());
  }
  
  /**
   * 메시지 산출
   * @param id 메시지 아이디
   * @param params "인수1/인수2"
   * @param locale 지역 정보
   * @return 지역별 메시지 
   */
  public String getMessage(String id, String params, Locale locale) {
    StringTokenizer st = new StringTokenizer(params, "/");
    int count = st.countTokens();
    String[] params_array = new String[count];
    
    for (int index=0; index < count; index++) {
      params_array[index] = st.nextToken();
    }
    
    return ms.getMessage(id, params_array, locale);
  }
  
  public String getMessage(String id, Object[] params) {
    return ms.getMessage(id, params, Locale.getDefault());
  }
  
}
  







  