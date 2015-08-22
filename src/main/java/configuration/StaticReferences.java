package configuration;
/**
 * 
 * @author Yasas De Silva
 *
 */
public class StaticReferences {

//	ConfigurationFile References
	public static final String configurationFile ="configurations.json";
	public static final String configurationTagDB ="DBConfiguration";
	public static final String configurationTagEmail ="EmailConfiguration";
	
//	Email References
	public static final String emailSubjectWelcome ="Welcome to SSTS - Your Most Caring Speech Therapist";	
	public static final String emailSubjectPwdReset ="SSTS User Account Password";
	public static final String emailReceiverForBugTest ="myasas@gmail.com";
	public static final String emailSubjectForBugTest ="SSTS -This is a bug, Kindly Report to SSTS Admin.";
	public static final String emailBodyForBugTest ="Hi User, \nThank you for registering with SSTS. \n\n-This is a bug, Kindly Report to SSTS Admin if you received this email.";	
	
//	User Registration References
	public static final String uTypeAdmin = "admin";	
	public static final String uTypeMember = "member";
	public static final String uStatusDeactivated = "deact";
	public static final String uStatusActivated = "act";	
	public static final String uStatusRestricted = "rest";
	
//	DatabaseReferences
	public static final String dbUserid = "user_id";
	public static final String dbUsertype = "user_type";	
	public static final String dbUserlogin = "user_login";		
	public static final String dbPwd = "user_password";	
	public static final String dbUserstatus = "user_status";	
	public static final String dbUsername = "user_name";	
	public static final String dbUserbday = "user_bday";	
	public static final String dbUserReg = "user_reg";	
	
//	Session References	
	public static final String ssnUserlogindisplay = "userlogindisplay";
	public static final String ssnUserlogin = "userlogin";	
	public static final String ssnUsertype = "usertype";
	public static final String ssnUsername = "username";	
	public static final String ssnRedirectPage = "redirect";	
	public static final String ssnSpeechOut = "spout";	
	public static final String ssnSpeechIn = "spin";		
	
//	Log4j References
	public static final String log4jPropertiesPath = "log4j.properties";
	
//	Information Messages
	public static final String msgAccRestrict = "This account is currently restricted. Kindly request access from the SSTS administrator by sending an email. Thank you!";
	public static final String msgAccessAdminOnly = "Sorry, you are not authorized to access this page.";
	
//	Maintenance References
	public static final String maintainanceAcc = "maintain@ssts.com";	
	public static final String maintainancePass = "maintain";
	public static final String maintainanceUType = "admin";
	public static final String maintainanceUName = "To Maintainance";	
}
