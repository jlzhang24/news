package com.zhang.util;


public class CharacterDisplay {

	public String toUtfString(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception ex) {
					System.out.println(ex);
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}
	
	
	public String getFileName(String s) {
		  int i = 0;
		  String s1 = toUtfString(s);
		  i = s1.lastIndexOf('/');
		  if (i != -1) {
		   return s1.substring(i + 1, s1.length());
		  }
		  i = s1.lastIndexOf('\\');
		  if (i != -1) {
		   return s1.substring(i + 1, s1.length());
		  } else {
		   return s1;
		  }
		 }
	
}
