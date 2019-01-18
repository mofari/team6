package nation.web.tool;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration; 
import java.util.HashMap; 
import java.util.Iterator; 
import java.util.Map; 

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletRequestWrapper; 

import org.apache.commons.fileupload.DiskFileUpload; 
import org.apache.commons.fileupload.FileItem; 
import org.apache.commons.fileupload.FileUpload; 
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile; 

/** 
 * HttpServletRequestWrapper 클래스는 HttpServletRequest 
 * 인터페이스를 임시로 구현한 클래스로 개발자가 내부객체인 
 * request를 사용하지않고 새로운 형태로 request 객체를 
 * 만들어 사용할 경우 상속받는 클래스입니다.   
 * Apahce FileUpload 콤포넌트를 사용하기 편리하게 지원합니다. 
 * FileUpload API를 사용하는 HttpServletRequestWrapper 클래스로서 
 * HttpServletRequest에 기반한 API를 사용하기 위한 래퍼이다. 
 */ 
public class Upload extends HttpServletRequestWrapper { 
     
    private boolean multipart = false; 
     
    private HashMap parameterMap;  // 일반 <INPUT> 폼태그 
    private HashMap fileItemMap;   // 전송된 <FILE> 태그 객체가 저장 
     
    /** 
     * 기본 생성자 
     * @param request 
     * @throws FileUploadException 
     */ 
    public Upload(HttpServletRequest request)  
    throws FileUploadException{ 
        this(request, -1, -1, null); 
    } 
     
    /** 
     * 생성자 
     * @param request HttpServletRequest 객체 
     * @param threshold 메모리에 저장할 최대크기 
     * @param max 업로드할 최대 파일크기 
     * @param repositoryPath 업로드 경로 
     * @throws FileUploadException 
     */ 
    public Upload(HttpServletRequest request, 
        int threshold, int max, String repositoryPath) throws FileUploadException { 
        super(request); 
         
        parsing(request, threshold, max, repositoryPath); 
    } 
     
    /** 
     * 일반 입력 필드와 파일 필드를 MAP에 저장 
     * @param request HttpServletRequest 객체 
     * @param threshold 메모리에 저장할 최대크기 
     * @param max 업로드할 최대 파일크기 
     * @param repositoryPath 업로드 경로 
     * @throws FileUploadException 
     */ 
    private void parsing(HttpServletRequest request, 
        int threshold, int max, String repositoryPath) throws FileUploadException { 
         
        if (FileUpload.isMultipartContent(request)) { 
            multipart = true; 
             
            parameterMap = new java.util.HashMap(); 
            fileItemMap = new java.util.HashMap(); 
             
            DiskFileUpload diskFileUpload = new DiskFileUpload(); 
            if (threshold != -1) { 
                diskFileUpload.setSizeThreshold(threshold); 
            } 
            diskFileUpload.setSizeMax(max); 
            if (repositoryPath != null) { 
                diskFileUpload.setRepositoryPath(repositoryPath); 
            } 
             
            java.util.List list = diskFileUpload.parseRequest(request); 
            for (int i = 0 ; i < list.size() ; i++) { 
                FileItem fileItem = (FileItem) list.get(i); 
                String name = fileItem.getFieldName(); 

                if (fileItem.isFormField()) { // 일반 폼 태그인지 검사 
                    // 일반 폼태그라면 처리 
                    String value = fileItem.getString(); 
                    String[] values = (String[]) parameterMap.get(name); 
                    if (values == null) { 
                        values = new String[] { value }; 
                    } else { 
                        String[] tempValues = new String[values.length + 1]; 
                        System.arraycopy(values, 0, tempValues, 0, 1); 
                        tempValues[tempValues.length - 1] = value; 
                        values = tempValues; 
                    } 
                    parameterMap.put(name, values); 
                } else { // 파일 태그라면 처리 
                    // System.out.println("파일 태그 발견됨 태그명: " + name); 
                    // System.out.println("파일 태그 발견됨 파일명: " + fileItem.getName()); 
                    fileItemMap.put(name, fileItem); 
                } 
            } 
            addTo(); // request 속성으로 설정한다. 
        } 
    } 
     
    /** 
     * 파일을 전송하는 enctype="multipart/form-data"인경우 true리턴 
     * @return enctype="multipart/form-data"인경우 true리턴 
     */ 
    public boolean isMultipartContent() { 
        return multipart; 
    } 
     
    /** 
     * 주어진 파라미터에 대한 값을 리턴 
     */ 
    public String getParameter(String name) { 
        if (multipart) { 
            String[] values = (String[])parameterMap.get(name); 
            if (values == null) return null; 
            return values[0]; 
        } else 
            return super.getParameter(name); 
    } 
     
    /** 
     * 파라미터의 값들을 리턴 
     */ 
    public String[] getParameterValues(String name) { 
        if (multipart) 
            return (String[])parameterMap.get(name); 
        else 
            return super.getParameterValues(name); 
    } 
     
    /** 
     * 전체 파라미터의 이름을 리턴 
     */ 
    public Enumeration getParameterNames() { 
        if (multipart) { 
            return new Enumeration() { 
                Iterator iter = parameterMap.keySet().iterator(); 
                 
                public boolean hasMoreElements() { 
                    return iter.hasNext(); 
                } 
                public Object nextElement() { 
                    return iter.next(); 
                } 
            }; 
        } else { 
            return super.getParameterNames(); 
        } 
    } 
     
    public Map getParameterMap() { 
        if (multipart) 
            return parameterMap; 
        else 
            return super.getParameterMap(); 
    } 
     
    /** 
     * 지정한 파라미터 이름과 관련된 FileItem을 리턴합니다. 
     * @param name 
     * @return 
     */ 
    public FileItem getFileItem(String name) { 
        if (multipart) 
            return (FileItem) fileItemMap.get(name); 
        else 
            return null; 
    } 
     
    /** 
     * 임시로 사용된 업로드 파일을 삭제합니다. 
     */ 
    public void delete() { 
        if (multipart) { 
            Iterator fileItemIter = fileItemMap.values().iterator(); 
            while( fileItemIter.hasNext()) { 
                FileItem fileItem = (FileItem)fileItemIter.next(); 
                fileItem.delete(); 
            } 
        } 
    } 
     
    /** 
     * 래퍼객체 자체를 request 객체에 저장합니다. 
     */ 
    public void addTo() { 
        super.setAttribute(Upload.class.getName(), this); 
    } 
     
    /** 
     * request 속성에 저장된 FileUploadRequestWrapper를 리턴합니다. 
     * @param request 
     * @return 
     */ 
    public Upload  
                  getFrom(HttpServletRequest request) { 
        return (Upload) 
            request.getAttribute(Upload.class.getName()); 
    } 
     
    /** 
     * 지정한 request가 래퍼를 속성으로 포함하고 있으면 true를 리턴합니다. 
     * @param request 
     * @return 
     */ 
    public boolean hasWrapper(HttpServletRequest request) { 
        if (getFrom(request) == null) { 
            return false; 
        } else { 
            return true; 
        } 
    } 
     
    /** 
     * 서버에 올라온 파일을 서버의 디스크에 저장 
     * 파일명 처리: data.txt -> (0)data.txt ->(1)data.txt -> (2)data.txt.. 
     * @param fileItem 저장할 파일 객체 
     * @param upDir 저장할 서버의 폴더 
     * @return 저장된 파일명 
     */ 
    public String saveFile(FileItem fileItem, String upDir){ 
         
        String filename = "";       //업로드 파일명 
        
        // 파일 태그 
        // System.out.println("전송된 파일명: " + fileItem.getName()); 

        // 폴더 구분자 추출 
        int idx = fileItem.getName().lastIndexOf("\\"); //윈도우 기반 

        if (idx == -1) { // 유닉스, 리눅스 기반 
            idx = fileItem.getName().lastIndexOf("/"); 
        } 
           
        // 순수 파일명 추출, C:/bigdata1/gallery/winter.jpg -> winter.jpg 
        filename = fileItem.getName().substring(idx + 1);
        int ext_index = filename.lastIndexOf(".");
        String only_filename = filename.substring(0,  ext_index); // 수수 파일명 추출
        String ext_filename = filename.substring(ext_index); // 파일 확장자 추출
           
        try { 
            //----------------------------------------------- 
            //대상 폴더에 저장할 파일 객체 생성, 폴더 + 파일명 
            //----------------------------------------------- 
            File uploadedFile = new File(upDir, filename); 
               
            //올릴려는 파일과 같은 이름이 존재하면 중복파일 처리 
            if ( uploadedFile.exists() == true ){ 
                for(int k=1; true; k++){ 
                  // 파일명 중복을 피하기 위한 일련 번호를 생성하여 
                  // 파일명으로 조합, data.txt -> data_1.txt -> data_2.txt... 
                  uploadedFile = new File(upDir, only_filename + "_" + k + ext_filename); 
                  // 조합된 파일명이 존재한다면 중복됨으로 일련번호가 
                  // 붙은 파일명 다시 생성 
                  
                  //존재하지 않는 경우 
                  // !을 이용해 false일 경우 참으로 처리되도록 변환 
                  if(!(uploadedFile.exists() == true)){  
                    filename = uploadedFile.getName();
                    break; 
                  } 
                } 
            } 
                
            // storage 폴더에 파일명 저장 
            fileItem.write(uploadedFile); 
        } catch(Exception e) { 
              System.out.println(e.toString());     
        } 

        return filename; // 업로드된 파일명 리턴 
    } 
    //--------------------------------------------------------------- 
    //Fileupload 콤포넌트 관련 코드 끝 
    //--------------------------------------------------------------- 


    /**  
     * 파일을 삭제합니다.  
    */ 
    public boolean deleteFile(String folder, String fileName){ 
        boolean ret = false; 
         
        try{ 
            if ( fileName != null){ // 기존에 파일이 존재하는 경우 삭제 
                File file = new File(folder + "/" + fileName); 
                if (file.exists()){
                  ret = file.delete();
                }
            } 
        }catch(Exception e){ 
            e.printStackTrace(); 
        } 
         
        return ret; 
    } 

    public HashMap getFileItemMap() { 
        return fileItemMap; 
    } 

    public void setFileItemMap(HashMap fileItemMap) { 
        this.fileItemMap = fileItemMap; 
    } 
     
    /** 
     * 전송받은 파일의 갯수를 리턴 
     * @return 
     */ 
    public int getFileCount(){ 
        return this.fileItemMap.size(); 
    } 
    
    /**
     * FileUpload 1.2 한글 변환
     * @param str
     * @return
     */
    public String encodeFileUpload12(String str) {
      String corean = null;
      try {
        corean = new String(str.getBytes("ISO-8859-1"), "UTF-8");
        // corean= new String(str.getBytes("ISO-8859-1"), "KSC5601");
      } catch (Exception e) {
        return corean;
      }
      return corean;
    }
    
    /**
     * Spring framework에서의 파일 업로드
     * @param multipartFile 전송하려는 파일 객체
     * @param absPath 저장할 절대 경로
     * @return
     */
    public static String saveFileSpring(MultipartFile multipartFile, String absPath) {
        // input form's parameter name
        String fileName = "";
        // original file name
        String originalFileName = multipartFile.getOriginalFilename();
        // file content type
        String contentType = multipartFile.getContentType();
        // file size
        long fileSize = multipartFile.getSize();
        
        System.out.println("fileSize: " + fileSize);
        System.out.println("originalFileName: " + originalFileName);
        
        InputStream inputStream = null;
        OutputStream outputStream = null;

        int ext_index = originalFileName.lastIndexOf(".");
        String only_filename = originalFileName.substring(0,  ext_index); // 수수 파일명 추출
        String ext_filename = originalFileName.substring(ext_index); // 파일 확장자 추출

        try {
            if( fileSize > 0 ) { // 파일이 존재한다면
                // 인풋 스트림을 얻는다.
                inputStream = multipartFile.getInputStream();

                File oldfile = new File(absPath, originalFileName);
            
                if ( oldfile.exists()){
                    for(int k=1; true; k++){
                      // 파일명 중복을 피하기 위한 일련 번호를 생성하여 
                      // 파일명으로 조합, data.txt -> data_1.txt -> data_2.txt... 
                      oldfile = new File(absPath, only_filename + "_" + k + ext_filename); 
                      // 조합된 파일명이 존재한다면 중복됨으로 일련번호가 
                      // 붙은 파일명 다시 생성 
                      
                      //조합된 파일명이 존재하지 않는다면, 일련번호가
                      //붙은 파일명 다시 생성
                      if(!oldfile.exists()){ //존재하지 않는 경우
                        fileName = oldfile.getName();
                        break;
                      }
                    }
                }else{
                    fileName = originalFileName;
                }
                //make server full path to save
                String serverFullPath = absPath + "/" + fileName;
                
                System.out.println("업로드 후 fileName: " + fileName);
                System.out.println("업로드 후 serverFullPath: " + serverFullPath);
                
                outputStream = new FileOutputStream( serverFullPath );

                // 버퍼를 만든다.
                int readBytes = 0;
                byte[] buffer = new byte[8192];

                while((readBytes = inputStream.read(buffer, 0, 8192)) != -1 ) {
                    outputStream.write( buffer, 0, readBytes );
                }
                outputStream.close();
                inputStream.close();
                        
            }

        } catch(Exception e) {
            e.printStackTrace();  
        }finally{
            
        }
        
        return fileName;
    }

} 
 
 