package dev.mvc.review_reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


@Component("dev.mvc.review_reply.ReviewReplyProc")
public class ReviewReplyProc implements ReviewReplyProcInter {
  @Autowired
  @Qualifier("dev.mvc.review_reply.ReviewReplyDAO")
  private ReviewReplyDAOInter reviewreplyDAO = null;

  public ReviewReplyProc() {
    System.out.println("--> PetProc created.");
  }
  
  @Override
  public List<ReviewReplyVO> list(int review_no) {
    return reviewreplyDAO.list(review_no);
  }

  @Override
  public int create(ReviewReplyVO reviewreplyVO) {
    return reviewreplyDAO.create(reviewreplyVO);
  }

  @Override
  public int update(ReviewReplyVO reviewreplyVO) {
    return reviewreplyDAO.update(reviewreplyVO);
  }

  @Override
  public ReviewReplyVO reply_read(int review_reply_no) {
    return reviewreplyDAO.reply_read(review_reply_no);
  }

  @Override
  public int reply_delete(int review_reply_no) {
    return reviewreplyDAO.reply_delete(review_reply_no);
  }

}
