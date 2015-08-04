package eshop.account;

import com.eshop.utils.PasswordUtils;

public class AccountTest {
	public static void main(String[] args) {
		PasswordUtils passwordUtils = new PasswordUtils();
		System.out.println(passwordUtils.encode("111111"));
		System.out.println(passwordUtils.getSalt());
	}
}
