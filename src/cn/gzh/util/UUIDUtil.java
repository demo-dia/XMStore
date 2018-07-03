package cn.gzh.util;

import java.util.UUID;

import org.junit.Test;

public class UUIDUtil {
	//得到一个
	public static String getUUID(){
		//得到一个32位的随机数
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid;
	}
}
