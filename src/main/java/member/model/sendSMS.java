package member.model;


import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class sendSMS {

	// Find your Account Sid and Token at twilio.com/user/account
		  public static final String ACCOUNT_SID = "ACf8a0e7a4190fdcaf641dda1638278da6";
		  public static final String AUTH_TOKEN = "535230376be60001f8fa6398aee0b43e"
		  		+ "\r\n"
		  		+ "";
		  
		  // SMS 전송
		  public static int sendsms (String phoneNum) {

			Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		    
		    // 휴대폰 인증번호 생성
		    int authNum = randomRange(100000, 999999);
		    // 전송대상 휴대폰 번호
		    String sendTarget = "+"+"82"+ phoneNum;
		    
		    // 전송 메세지
		    String authMsg = "\n        Billy A Dream 인증번호 [" + authNum + "]" ;
		    
		    /*
		    Message message = Message.creator(
		    	// to
		    	new PhoneNumber(sendTarget),
		        // from
		    	new PhoneNumber("+18149147989"), 
		        // message
		    	authMsg).create();
		    */
			return authNum;
			
		  }
		    
		  // 인증번호 범위 지정
		  public static int randomRange(int n1, int n2) {
		    int num =  (int) (Math.random() * (n2 - n1 + 1)) + n1;
			  return num;
		  }
		  
		  
		}
