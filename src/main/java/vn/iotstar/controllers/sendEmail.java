package vn.iotstar.controllers;

import java.util.Random;

import vn.iotstar.entity.User;

public class sendEmail {
	public String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		return String.format("%06d", number);
	}
	
	public boolean sendEmail(User user) {
		boolean test = false;
		
		String toEmail = user.getEmail();
		String fromEmail = "cozyconnerweb@gmail.com";
		return test;
	}
}