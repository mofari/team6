package dev.mvc.diary_reply;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.diary_reply.DiaryReplyProc")
public class DiaryReplyProc implements DiaryReplyProcInter{
  @Autowired
  @Qualifier("dev.mvc.diary_reply.DiaryReplyDAO")
   private DiaryReplyDAOInter diaryReplyDAO = null;
   
  public DiaryReplyProc(){
    System.out.println("-->DiaryReplyProc created");
  }

  @Override
  public int create(DiaryReplyVO diaryReplyVO) {
   
    return diaryReplyDAO.create(diaryReplyVO);
  }

  @Override
  public List<DiaryReplyVO> list(int diary_no) {
    List<DiaryReplyVO> list = diaryReplyDAO.list(diary_no);  
   
    return list;
  }

  @Override
  public int update(DiaryReplyVO diaryreplyVO) {
    // TODO Auto-generated method stub
    return diaryReplyDAO.update(diaryreplyVO);
  }

  @Override
  public DiaryReplyVO read(int diary_reply_no) {
    return diaryReplyDAO.read(diary_reply_no);
  }

  @Override
  public int delete(int diary_reply_no) {
    // TODO Auto-generated method stub
    return diaryReplyDAO.delete(diary_reply_no);
  }
  
  
}
