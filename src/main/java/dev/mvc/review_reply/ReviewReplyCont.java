package dev.mvc.review_reply;


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


@Controller
public class ReviewReplyCont {
  @Autowired
  @Qualifier("dev.mvc.review_reply.ReviewReplyProc")
  private ReviewReplyProcInter reviewreplyProc = null;
  
  public ReviewReplyCont() {
    System.out.println("--> ReviewReplyCont created.");
  }
  
  // http://localhost:9090/review/review/create_json.do?review_no=4&member_no=2&review_reply_content=멍멍 맛있따
  // {"msgs":["카테고리를 등록했습니다.","등록된 카테고리 등산"]}
  @ResponseBody
  @RequestMapping(value = "/review/create_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity create_json(ReviewReplyVO reviewreplyVO) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();

    if (reviewreplyProc.create(reviewreplyVO) == 1) {
      msgs.put("댓글을 등록했습니다.");
    } else {
      msgs.put("댓글 등록에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  @ResponseBody
  @RequestMapping(value = "/review/update.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String update(int review_reply_no) {
    ReviewReplyVO reviewreplyVO = reviewreplyProc.reply_read(review_reply_no);
    JSONObject obj = new JSONObject(reviewreplyVO);

    return obj.toString();
  }
  
  @ResponseBody
  @RequestMapping(value = "/review/update_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity update_json(ReviewReplyVO reviewreplyVO) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();

    if (reviewreplyProc.update(reviewreplyVO) == 1) {
      msgs.put("댓글을 수정했습니다.");
    } else {
      msgs.put("댓글 수정에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/review/delete_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity delete_json(int review_reply_no) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();
    
    System.out.println("★ review_reply_no: "+review_reply_no);

    if (reviewreplyProc.reply_delete(review_reply_no) == 1) {
      msgs.put("댓글을 수정했습니다.");
    } else {
      msgs.put("댓글 수정에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
}
