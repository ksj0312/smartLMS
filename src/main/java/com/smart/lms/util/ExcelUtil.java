package com.smart.lms.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.ss.usermodel.*;

public class ExcelUtil {

    public static String getCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();  
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    Date birthDate = cell.getDateCellValue();
            	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            	    String birth = sdf.format(birthDate);
                    return birth;  
                } else {
                    return String.valueOf(cell.getNumericCellValue());  
                }
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());  
            case FORMULA:
                return cell.getCellFormula();  
            case BLANK:
                return "-"; 
            default:
                return "";  
        }
    }
}