package dev.mvc.diary_reply;

import java.util.List;

public interface DiaryReplyDAOInter {
    /**
     * 댓글 등록
     * @param diaryReplyVO
     * @return
     */
  public int create(DiaryReplyVO diaryReplyVO);
  
  /**
   * 목록
   * @return
   */
  public List<DiaryReplyVO> list(int diary_no);
  /**
   * 수정
   * @param diaryreplyVO
   * @return
   */
  public int update(DiaryReplyVO diaryreplyVO);
  /**
   * 조회
   * @param diary_reply_no
   * @return
   */
  public DiaryReplyVO read(int diary_reply_no);
  /**
   * 삭제
   * @param diary_reply_no
   * @return
   */
  public int delete(int diary_reply_no);
  
}
