<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    // 파일 정보 변수 선언
    String sFileInfo = "";
    // 클라이언트에서 전달된 파일 이름
    String filename = request.getHeader("file-name");
    System.out.println("filename: " + filename);

    // 파일 확장자 추출
    String filename_ext = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();

    // 허용 가능한 이미지 확장자 목록
    String[] allow_file = { "jpg", "png", "bmp", "gif" };

    // 파일 확장자가 허용되는지 여부 확인
    boolean isImage = false;
    for (String ext : allow_file) {
        if (filename_ext.equals(ext)) {
            isImage = true;
            break;
        }
    }

    // 이미지가 아닐 경우 처리
    if (!isImage) {
        out.println("NOTALLOW_" + filename);
    } else {
        // 이미지일 경우 파일을 저장할 경로 설정
        // 실제로는 절대 경로를 사용하여 파일을 저장하는 것이 좋습니다.
        String filePath = "C:/smart/smartlms/src/main/webapp/resources/upfile/";
        
        System.out.println("filePath: " + filePath);

        // 디렉토리가 존재하지 않으면 생성
        File fileDir = new File(filePath);
        if (!fileDir.exists()) {
            fileDir.mkdirs();  // 디렉토리가 없으면 생성
        }

        // 파일명을 고유하게 생성 (날짜 + UUID)
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today = formatter.format(new java.util.Date());
        String realFileNm = today + "_" + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));

        // 파일 저장 경로에 파일명 포함
        String rlFileNm = filePath + File.separator + realFileNm;

        // 파일 저장
        try (InputStream is = request.getInputStream();
             OutputStream os = new FileOutputStream(rlFileNm)) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            
            String fileUrl = request.getContextPath() + "/resources/upfile/" + realFileNm;


            // 저장 성공 시 클라이언트에 파일 정보 반환
            sFileInfo += "&bNewLine=true";
            sFileInfo += "&sFileName=" + filename;
            sFileInfo += "&sFileURL=" + fileUrl + '"' + ">" ;  // 웹에서 접근 가능한 URL 경로 반환
            out.println(sFileInfo);
            
        } catch (IOException e) {
            e.printStackTrace();
            out.println("ERROR_FILE_UPLOAD");
        }
    }
%>
