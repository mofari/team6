package dev.mvc.qna;

import java.util.List;

public interface QnAProcInter {

  public List<QnACateVO> list();

  public int create(QnACateVO qnacateVO);

  public int update(QnACateVO qnacateVO);

  public QnACateVO read(int qnacategory_no);

  public List<QnACateVO> all_read();

  public int delete(int qnacategory_no);

  public int qna_create(QnAVO qnaVO);

}
