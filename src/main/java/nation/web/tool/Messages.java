package nation.web.tool;

import java.util.Locale;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

@Component("dev.mvc.tool.Messages")
public class Messages {
  /**
   * message-context.xml�� ����� ��ü�� ���ε�
   */
  @Autowired
  private MessageSource ms = null;
  
  public Messages() {
    System.out.println("Messages ��ü ������.");  
  }
  
  /**
   * ���̵� �̿��Ͽ� �޽��� ����
   * @param id ��) categrp.create.success
   * @return �޽���
   */
  public String getMessage(String id) {
    return ms.getMessage(id, null, Locale.getDefault());
  }

  /**
   * ���̵� �̿��Ͽ� �޽��� ����
   * @param id ��) categrp.create.success
   * @param locale ���� ����
   * @return �޽���
   */
  public String getMessage(String id, Locale locale) {
    return ms.getMessage(id, null, locale);
  }
  
  /**
   * �޽��� ����
   * @param id �޽��� ���̵�
   * @param params "�μ�1/�μ�2"
   * @return ������ �޽��� 
   */
  public String getMessage(String id, String params) {
    StringTokenizer st = new StringTokenizer(params, "/");
    int count = st.countTokens();                   // �ܾ�(��ū) ����
    String[] params_array = new String[count]; // �ܾ� ������ŭ �迭 ����
    
    for (int index=0; index < count; index++) {
      params_array[index] = st.nextToken();    // �迭�� �ܾ� ����
    }
    
    return ms.getMessage(id, params_array, Locale.getDefault());
  }
  
  /**
   * �޽��� ����
   * @param id �޽��� ���̵�
   * @param params "�μ�1/�μ�2"
   * @param locale ���� ����
   * @return ������ �޽��� 
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
  







  