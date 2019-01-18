package dev.mvc.review_reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.review_reply.ReviewReplyDAO") // DBMS ����� ���� 
public class ReviewReplyDAO implements ReviewReplyDAOInter {
  @Autowired  // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public ReviewReplyDAO() {
    System.out.println("--> ReviewReplyDAO created.");
  }

  @Override
  public List<ReviewReplyVO> list(int review_no) {
    return sqlSessionTemplate.selectList("review_reply.list", review_no);
  }

  @Override
  public int create(ReviewReplyVO reviewreplyVO) {
    return sqlSessionTemplate.insert("review_reply.reply_create", reviewreplyVO);
  }

  @Override
  public int update(ReviewReplyVO reviewreplyVO) {
    return sqlSessionTemplate.update("review_reply.reply_update", reviewreplyVO);
  }

  @Override
  public ReviewReplyVO reply_read(int review_reply_no) {
    return sqlSessionTemplate.selectOne("review_reply.reply_read", review_reply_no);
  }

  @Override
  public int reply_delete(int review_reply_no) {
    return sqlSessionTemplate.delete("review_reply.reply_delete", review_reply_no);
  }  

}
 