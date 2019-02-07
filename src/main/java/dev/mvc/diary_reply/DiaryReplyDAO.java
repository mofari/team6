package dev.mvc.diary_reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.diary_reply.DiaryReplyDAO")  // DBMS 저장소 접근
public class DiaryReplyDAO implements DiaryReplyDAOInter {
  @Autowired
   private SqlSessionTemplate sqlSessionTemplate = null;
  
  public DiaryReplyDAO(){
    System.out.println("DiaryReplyDAO create");
  }

  @Override
  public int create(DiaryReplyVO diaryReplyVO) {
    
    return sqlSessionTemplate.insert("diary_reply.create",diaryReplyVO);
  }

  @Override
  public List<DiaryReplyVO> list(int diary_no) {
    
    return sqlSessionTemplate.selectList("diary_reply.list",diary_no);
  }

  @Override
  public int update(DiaryReplyVO diaryreplyVO) {
    
    return sqlSessionTemplate.update("diary_reply.update",diaryreplyVO);
  }

  @Override
  public DiaryReplyVO read(int diary_reply_no) {
    return sqlSessionTemplate.selectOne("diary_reply.read",diary_reply_no);
  }
  

  
  @Override
  public int delete(int diary_reply_no) {
    // TODO Auto-generated method stub
    return sqlSessionTemplate.delete("diary_reply.delete",diary_reply_no);
  }
  
}
