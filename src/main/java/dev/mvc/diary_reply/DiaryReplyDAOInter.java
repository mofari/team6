package dev.mvc.diary_reply;

import java.util.List;

public interface DiaryReplyDAOInter {
    /**
     * ��� ���
     * @param diaryReplyVO
     * @return
     */
  public int create(DiaryReplyVO diaryReplyVO);
  
  /**
   * ���
   * @return
   */
  public List<DiaryReplyVO> list(int diary_no);
  /**
   * ����
   * @param diaryreplyVO
   * @return
   */
  public int update(DiaryReplyVO diaryreplyVO);
  /**
   * ��ȸ
   * @param diary_reply_no
   * @return
   */
  public DiaryReplyVO read(int diary_reply_no);
  /**
   * ����
   * @param diary_reply_no
   * @return
   */
  public int delete(int diary_reply_no);
  
}
