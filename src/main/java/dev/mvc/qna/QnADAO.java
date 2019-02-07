package dev.mvc.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.qna.QnADAO") // DBMS 저장소 접근 
public class QnADAO implements QnADAOInter{
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
 
  public QnADAO() {
    System.out.println("--> QnADAO created.");
  }

  @Override
  public List<QnACateVO> list() {
    return sqlSessionTemplate.selectList("qna.qna_category_list");
  }

  @Override
  public int create(QnACateVO qnacateVO) {
    return sqlSessionTemplate.insert("qna.qna_category_create", qnacateVO);
  }

  @Override
  public int update(QnACateVO qnacateVO) {
    return sqlSessionTemplate.update("qna.qna_category_update", qnacateVO);
  }

  @Override
  public QnACateVO read(int qnacategory_no) {
    return sqlSessionTemplate.selectOne("qna.qna_category_read", qnacategory_no);
  }

  @Override
  public int delete(int qnacategory_no) {
    return sqlSessionTemplate.delete("qna.qna_category_delete", qnacategory_no);
  }

  @Override
  public List<QnACateVO> all_read() {
    return sqlSessionTemplate.selectList("qna.qna_category_all_read");
  }

  @Override
  public int qna_create(QnAVO qnaVO) {
    return sqlSessionTemplate.insert("qna.qna_create", qnaVO);
  }
  
}
