package com.infinity.chinese;

import java.io.*;

public class ToChinese {
	public String trans(String str) {
		String result = null;
		byte temp[];
		try {
			temp = str.getBytes("UTF-8");
			result = new String(temp);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
