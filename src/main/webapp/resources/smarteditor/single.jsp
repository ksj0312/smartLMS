<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%
String return1 = "";
String return2 = "";
String return3 = "";
String name = "";

try {
    if (ServletFileUpload.isMultipartContent(request)) {
        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        uploadHandler.setHeaderEncoding("UTF-8"); // 인코딩 설정
        List<FileItem> items = uploadHandler.parseRequest(request);

        for (FileItem item : items) {
            if (item.getFieldName().equals("callback")) {
                return1 = item.getString("UTF-8");
            } else if (item.getFieldName().equals("callback_func")) {
                return2 = "?callback_func=" + item.getString("UTF-8");
            } else if (item.getFieldName().equals("Filedata")) {
                if (item.getSize() > 0) {
                    // 파일명 처리
                    name = new File(item.getName()).getName(); // OS에 무관하게 파일명만 추출
                    String filename_ext = name.substring(name.lastIndexOf(".") + 1).toLowerCase();

                    // 허용 파일 확장자 확인
                    String[] allow_file = {"jpg", "png", "bmp", "gif"};
                    boolean isValidExtension = false;
                    for (String ext : allow_file) {
                        if (filename_ext.equals(ext)) {
                            isValidExtension = true;
                            break;
                        }
                    }

                    if (!isValidExtension) {
                        return3 = "&errstr=" + name;
                    } else {
                        // 파일 저장 경로 설정
                        String dftFilePath = application.getRealPath("/"); // 컨텍스트 루트 경로
                        String filePath = dftFilePath + "editor" + File.separator + "upload" + File.separator;

                        File uploadDir = new File(filePath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs(); // 디렉토리가 없으면 생성
                        }

                        // 파일명 생성
                        String realFileNm = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()) 
                                            + UUID.randomUUID().toString() 
                                            + name.substring(name.lastIndexOf("."));
                        String fullFilePath = filePath + realFileNm;

                        // 파일 저장
                        try (InputStream is = item.getInputStream();
                             OutputStream os = new FileOutputStream(fullFilePath)) {
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = is.read(buffer)) != -1) {
                                os.write(buffer, 0, bytesRead);
                            }
                        }

                        // 결과값 설정
                        return3 += "&bNewLine=true";
                        return3 += "&sFileName=" + java.net.URLEncoder.encode(name, "UTF-8"); // 원본 파일명
                        return3 += "&sFileURL=/editor/upload/" + realFileNm; // 파일 URL
                    }
                } else {
                    return3 += "&errstr=error";
                }
            }
        }
    }
} catch (Exception e) {
    e.printStackTrace();
    return3 = "&errstr=exception";
}

// 업로드 후 리다이렉트
response.sendRedirect(return1 + return2 + return3);
%>
