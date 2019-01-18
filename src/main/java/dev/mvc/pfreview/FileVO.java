package dev.mvc.pfreview;

public class FileVO {
  private String review_thumb;
  private String review_file;
  private String review_size;

  public FileVO() {

  }

  public FileVO(String review_thumb, String review_file, String review_size) {
    super();
    this.review_thumb = review_thumb;
    this.review_file = review_file;
    this.review_size = review_size;
  }

  /**
   * @return the review_thumb
   */
  public String getReview_thumb() {
    return review_thumb;
  }

  /**
   * @param review_thumb the review_thumb to set
   */
  public void setReview_thumb(String review_thumb) {
    this.review_thumb = review_thumb;
  }

  /**
   * @return the review_file
   */
  public String getReview_file() {
    return review_file;
  }

  /**
   * @param review_file the review_file to set
   */
  public void setReview_file(String review_file) {
    this.review_file = review_file;
  }

  /**
   * @return the review_size
   */
  public String getReview_size() {
    return review_size;
  }

  /**
   * @param review_size the review_size to set
   */
  public void setReview_size(String review_size) {
    this.review_size = review_size;
  }
  
  
  
}
 