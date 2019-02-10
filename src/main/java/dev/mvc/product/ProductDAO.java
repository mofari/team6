package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;
import dev.mvc.manufacturer.ManufacturerVO;

@Repository("dev.mvc.product.ProductDAO") // DBMS 저장소 접근 
public class ProductDAO implements ProductDAOInter {
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  
  public ProductDAO() {
    System.out.println("--> ProductDAO created.");
  }


  @Override
  public int create(ProductVO productVO) {
    return sqlSessionTemplate.insert("product.create", productVO);
  }
  
  @Override
  public List<CategoryVO> select_category_one() {
    return sqlSessionTemplate.selectList("product.select_category_one");
  }
  
  @Override
  public List<CategoryVO> select_category_two(int categoryno) {
    return sqlSessionTemplate.selectList("product.select_category_two", categoryno);
  }

  @Override
  public List<CountryVO> country_list() {
    return sqlSessionTemplate.selectList("product.country_list");
  }

  @Override
  public List<ManufacturerVO> manufacturer_list() {
    return sqlSessionTemplate.selectList("product.manufacturer_list");
  }

  @Override
  public List<OutProductVO> outproduct_list(HashMap hashMap) {
    return sqlSessionTemplate.selectList("product.list", hashMap);
  }
  
  @Override
  public int listcount(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("product.listcount", hashMap);
  }


  @Override
  public int delete(int prono) {
    return sqlSessionTemplate.delete("product.delete", prono);
  }

  @Override
  public OutProductVO read(int prono) {
    return sqlSessionTemplate.selectOne("product.read", prono);
  }

  @Override
  public int like(HashMap hashMap) {
    return sqlSessionTemplate.insert("product.like", hashMap);
  }
  
  @Override
  public int likeup(int prono){
    return sqlSessionTemplate.update("product.likeup", prono);
  }

  @Override
  public int delike(HashMap hashMap) {
    return sqlSessionTemplate.insert("product.delike", hashMap);
  }
  
  @Override
  public int likedown(int prono){
    return sqlSessionTemplate.update("product.likedown", prono);
  }

  @Override
  public int findlike(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("product.findlike", hashMap);
  }
  
  @Override
  public CategoryVO readcategory(int categoryno) {
    return sqlSessionTemplate.selectOne("product.readcategory", categoryno);
  }
  
  @Override
  public int update(ProductVO productVO){
    return sqlSessionTemplate.update("product.update", productVO);
  }
}
