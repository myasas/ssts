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
	public static final String uTypeMember = "member";
	public static final String uStatusDeactivated = "deact";
	public static final String uStatusActivated = "act";	
	public static final String uStatusRestricted = "rest";	
}
