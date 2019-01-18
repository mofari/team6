package dev.mvc.review_reply;

import java.util.List;

public interface ReviewReplyDAOInter {

  public List<ReviewReplyVO> list(int review_no);
  
  public int create(ReviewReplyVO reviewreplyVO);
  
  public int update(ReviewReplyVO reviewreplyVO);
  
  public ReviewReplyVO reply_read(int review_reply_no);
  
  public int reply_delete(int review_reply_no);
}
