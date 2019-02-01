package dev.mvc.diary;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("dev.mvc.diary.DiaryDAO") // DBMS 저장소 접근
public class DiaryDAO implements DiaryDAOInter{
 @Autowired
  private SqlSessionTemplate sqlSessionTemplate =null;
 
  public DiaryDAO(){
    System.out.println("DiaryDAO create");
    
  }
  
  @Override
  public int create(DiaryVO diaryVO) {
    
    return sqlSessionTemplate.insert("diary.create",diaryVO);
  }
/*  @Override
  public List<DiaryVO> list(int category_no) {
    return sqlSessionTemplate.selectList("diary.list", category_no);
  }*/

  @Override
  public DiaryVO read(int diary_no) {
    
    return sqlSessionTemplate.selectOne("diary.read",diary_no);
  }
  
  @Override
  public int update(DiaryVO diaryVO){
    return sqlSessionTemplate.update("diary.update",diaryVO);
  }

  @Override
  public int delete(int diary_no) {
   
    return sqlSessionTemplate.delete("diary.delete",diary_no);
  }

  @Override
  public int increseCnt(int diary_no) {
    
    return sqlSessionTemplate.update("diary.increseCnt",diary_no);
  }

  @Override
  public List<DiaryVO> list_paging(HashMap<String, Object> hashMap) {
    System.out.println(hashMap.get("category_no"));
    System.out.println(hashMap.get("word"));
    System.out.println(hashMap.get("nowPage"));
    System.out.println(hashMap.get("startNum"));
    System.out.println(hashMap.get("endNum"));
    return sqlSessionTemplate.selectList("diary.list_paging",hashMap);
  }

  @Override
  public int search_count(HashMap hashMap) {
    
    return sqlSessionTemplate.selectOne("diary.search_count",hashMap);
  }

  @Override
  public int total_count() {
    
    return sqlSessionTemplate.selectOne("diary.total_count");
  }

  @Override
  public int increseRcnt(int diary_no) {
    
    return sqlSessionTemplate.update("diary.increseRcnt",diary_no);
    
  }

  @Override
  public int deincreseRcnt(int diary_no) {
    // TODO Auto-generated method stub
    return sqlSessionTemplate.update("diary.deincreseRcnt",diary_no);
  }

  @Override
  public int like_check(HashMap hashMap) {
    // TODO Auto-generated method stub
    return sqlSessionTemplate.selectOne("diary.like_check",hashMap);
  }

  @Override
  public int like_up(int diary_no) {
    // TODO Auto-generated method stub
    return sqlSessionTemplate.update("diary.like_up",diary_no);
  }

  @Override
  public int like_down(int diary_no) {
    // TODO Auto-generated method stub
    return sqlSessionTemplate.update("diary.like_down",diary_no);
  }

  @Override
  public List<DiaryVO> cnt_list(int category_no) {
    // TODO Auto-generated method stub
    return sqlSessionTemplate.selectList("diary.cnt_list",category_no);
  }
  
  
}
