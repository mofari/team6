package dev.mvc.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


@Component("dev.mvc.qna.QnAProc")
public class QnAProc implements QnAProcInter{
  @Autowired
  @Qualifier("dev.mvc.qna.QnADAO")
  private QnADAOInter qnaDAO = null;
  
  public QnAProc() {
    System.out.println("--> QnAProc created.");
  }

  @Override
  public List<QnACateVO> list() {
    return qnaDAO.list();
  }

  @Override
  public int create(QnACateVO qnacateVO) {
    return qnaDAO.create(qnacateVO);
  }

  @Override
  public int update(QnACateVO qnacateVO) {
    return qnaDAO.update(qnacateVO);
  }

  @Override
  public QnACateVO read(int qnacategory_no) {
    return qnaDAO.read(qnacategory_no);
  }

  @Override
  public int delete(int qnacategory_no) {
    return qnaDAO.delete(qnacategory_no);
  }

  @Override
  public List<QnACateVO> all_read() {
    return qnaDAO.all_read();
  }

  @Override
  public int qna_create(QnAVO qnaVO) {
    return qnaDAO.qna_create(qnaVO);
  }
}
