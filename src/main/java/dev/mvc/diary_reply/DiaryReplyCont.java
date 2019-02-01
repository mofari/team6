package dev.mvc.diary_reply;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.category.CategoryVO;
import dev.mvc.diary.DiaryProcInter;
import dev.mvc.diary.DiaryVO;
import dev.mvc.diary_reply.DiaryReplyVO;
import net.sf.cglib.transform.impl.AddDelegateTransformer;



@Controller
public class DiaryReplyCont {
  @Autowired
  @Qualifier("dev.mvc.diary_reply.DiaryReplyProc")
  private DiaryReplyProcInter diaryReplyProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.diary.DiaryProc")
  private DiaryProcInter diaryProc = null;
  
  public DiaryReplyCont(){
    System.out.println("--> DiaryReplyCont created.");
  }
  
  
  
//http://localhost:9090/review/diary/create_json.do?review_no=4&member_no=2&diary_reply_content=�۸� ���ֵ�
 // {"msgs":["ī�װ��� ����߽��ϴ�.","��ϵ� ī�װ� ���"]}
 @ResponseBody
 @RequestMapping(value = "/diary/create_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
 public ResponseEntity create_json(DiaryReplyVO diaryReplyVO) {
   HttpHeaders responseHeaders = new HttpHeaders();

   JSONObject json = new JSONObject();
   JSONArray msgs = new JSONArray();
  // System.out.println("diary_no : "+ diaryReplyVO.getDiary_no());
  
   if (diaryReplyProc.create(diaryReplyVO) == 1) {
     
  //   System.out.println("��Ͻ� diary_no : "+ diaryReplyVO.getDiary_no());
      diaryProc.increseRcnt(diaryReplyVO.getDiary_no());
  
     msgs.put("����� ����߽��ϴ�.");
   } else { 
     msgs.put("��� ��Ͽ� �����߽��ϴ�.");
     msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
   }
   json.put("msgs", msgs);

   
   return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
 }
 
 @ResponseBody
 @RequestMapping(value = "/diary/reply_update.do", 
                          method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
 public String reply_update(int diary_reply_no) {
   System.out.println("������� ������?");
   DiaryReplyVO diaryReplyVO = diaryReplyProc.read(diary_reply_no);
   JSONObject obj = new JSONObject(diaryReplyVO);
  
   DiaryVO diaryVO = diaryProc.read(diary_reply_no);
   // ����
   
   return obj.toString();
 }
 
 @ResponseBody
 @RequestMapping(value = "/diary/update_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
 public ResponseEntity update_json(DiaryReplyVO diaryReplyVO) {
   HttpHeaders responseHeaders = new HttpHeaders();
    
   JSONObject json = new JSONObject();
   JSONArray msgs = new JSONArray();

   if (diaryReplyProc.update(diaryReplyVO) == 1) {
     msgs.put("����� �����߽��ϴ�.");
   } else {
     msgs.put("��� ������ �����߽��ϴ�.");
     msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
   }
   json.put("msgs", msgs);

   return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
 }
 
 
 @ResponseBody
 @RequestMapping(value = "/diary/delete_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
 public ResponseEntity delete_json(int diary_reply_no) {
   HttpHeaders responseHeaders = new HttpHeaders();

   JSONObject json = new JSONObject();
   JSONArray msgs = new JSONArray();
    
   System.out.println("�� diary_reply_no: "+diary_reply_no);

  DiaryReplyVO diaryReplyVO = diaryReplyProc.read(diary_reply_no);
  
  
  System.out.println("������ diary_no :" +diaryReplyVO.getDiary_no());
   if (diaryReplyProc.delete(diary_reply_no) == 1) {
     diaryProc.deincreseRcnt(diaryReplyVO.getDiary_no());
     msgs.put("����� �����߽��ϴ�.");
   } else {
     msgs.put("��� ������ �����߽��ϴ�.");
     msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
   }
   json.put("msgs", msgs);

   return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
 }


}
