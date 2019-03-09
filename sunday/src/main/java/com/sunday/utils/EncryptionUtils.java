package com.sunday.utils;

import java.security.MessageDigest;

public class EncryptionUtils {
	public final static String EncryptionMD5(String pwd) {  
        //16进制下数字到字符的映射数组    
       char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',  
               'a', 'b', 'c', 'd', 'e', 'f' };  
       try {  
           byte[] strTemp = pwd.getBytes();  
           MessageDigest mdTemp = MessageDigest.getInstance("MD5");  
           mdTemp.update(strTemp);  
           byte[] md = mdTemp.digest();  
           int j = md.length;  
           char str[] = new char[j * 2];  
           int k = 0;  
           for (int i = 0; i < j; i++) {  
               byte byte0 = md[i];  
               str[k++] = hexDigits[byte0 >>> 4 & 0xf];  
               str[k++] = hexDigits[byte0 & 0xf];  
           }  
           return new String(str);  
       } catch (Exception e) {  
           e.printStackTrace();  
           return null;  
       }  
   }  
}
