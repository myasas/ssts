package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import configuration.ConfigurationMaster;
import configuration.StaticReferences;
import data.DatabaseConnection;

/**
 * 
 * @author Yasas De Silva
 *
 */
public class SendEmail {
	private static final Logger LOGGER= Logger.getLogger(SendEmail.class); 
	
	public SendEmail() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}
//Default Sender Email Address and Password hardcoded to prevent user dissatisfaction due to a broken link with email.
    private String emailUserName;
    private String emailPassword;
    
    //Default receiver email address set to test any defects in setting receiver email address
    private String receiverEmail = StaticReferences.emailReceiverForBugTest;
    private String mailSubject = StaticReferences.emailSubjectForBugTest;
    private String mailBody = StaticReferences.emailBodyForBugTest;
    private String attachmentPath;
    private String attachedFileName;
    
    public void sendAnEmail(SendEmail emailSendeObj){
    //Always sets the email configuration from the configuration file.     
   	 ConfigurationMaster cm = new ConfigurationMaster();
   	 cm = cm.configsFromConfigFile();
   	 emailUserName = cm.getEmailUserName();
   	 emailPassword = cm.getEmailPassword();    
   	 
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port","465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
         
        Session session =Session.getInstance(props,
                new javax.mail.Authenticator() {
                  protected PasswordAuthentication getPasswordAuthentication(){
                  return new PasswordAuthentication(emailUserName, emailPassword);//Emind UserName and Passord            
                  }                                
                }
            );
           
            try{
                Message message=new MimeMessage(session);
                message.setFrom(new InternetAddress(emailUserName));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(getReceiverEmail())); // Receiver Email Addres
                message.setSubject(getMailSubject());//Mail Subject
//                message.setText(getMailBody());//Mail Body
                
                MimeBodyPart messageBodyPart= new MimeBodyPart();
                messageBodyPart.setText(getMailBody()); //Body of the email set
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);
                
                message.setContent(multipart);
                
                Transport.send(message);
//    			Log info
            	LOGGER.info("Email Sent to :"+ getReceiverEmail());
                
           }catch(Exception e)  
           {
//   		Log error	
           	LOGGER.error("Exception in sending email to" + getReceiverEmail(), e);        	   
           }        
    }

    public Boolean sendAccountActivationEmail(String userLogin) {
    	
    	Boolean isemailSucsessfullySent=false;
        String SQL="select * from users where user_login='"+userLogin+"'";
        
        try {        
        ResultSet rs;
    	rs = DatabaseConnection.getInstance().getValues(SQL);    	
    	

			if (rs.next()) {
				//Gets data required to send email.
				String dbUserid=rs.getString("user_id");
				String dbUsername=rs.getString("user_name");
				String activationURL="http://devssts-yasasd.rhcloud.com/AccountActivation?secretkey="+dbUserid+"";
				        
     //Prepares email reciever, subject and body.
			      SendEmail se = new SendEmail();
			      se.setReceiverEmail(userLogin);
			      se.setMailSubject(StaticReferences.emailSubjectWelcome);
			      se.setMailBody("Hi "+dbUsername+", \n\nWelcome to Smart Speech Therapist ! \n\nPlease click on the following link (Or copy and paste the URL in your web browser) to activate your SSTS account.\n\nActivation URL :"+activationURL+" \n\nThank you,\nSSTS\n(Smart Speech Therapist for Stammer)");     
			      
			      se.sendAnEmail(se);
			      isemailSucsessfullySent=true;
//					Log info
		        	LOGGER.info("Account activation email sent to "+userLogin+".");
			  } else {
//					Log info
		        	LOGGER.info("Could not find the user account: "+userLogin+" in the database.");
			  }
		
        } catch (SQLException e) {
//			Log error	
        	LOGGER.error("SQL Exception in sendAccountActivationEmail", e);
		} catch (Exception ex) {
//			Log error	
        	LOGGER.error("Exception in sendAccountActivationEmail", ex);			
		}
          return isemailSucsessfullySent;
	}
    
//    Getters and Setters
    /**
     * @return the ReceiverEmail
     */
    public String getReceiverEmail() {
        return receiverEmail;
    }

    /**
     * @param ReceiverEmail the ReceiverEmail to set
     */
    public void setReceiverEmail(String ReceiverEmail) {
        this.receiverEmail = ReceiverEmail;
    }

    /**
     * @return the MailSubject
     */
    public String getMailSubject() {
        return mailSubject;
    }

    /**
     * @param MailSubject the MailSubject to set
     */
    public void setMailSubject(String MailSubject) {
        this.mailSubject = MailSubject;
    }

    /**
     * @return the MailBody
     */
    public String getMailBody() {
        return mailBody;
    }

    /**
     * @param MailBody the MailBody to set
     */
    public void setMailBody(String MailBody) {
        this.mailBody = MailBody;
    }

    /**
     * @return the AttachmentPath
     */
    public String getAttachmentPath() {
        return attachmentPath;
    }

    /**
     * @param AttachmentPath the AttachmentPath to set
     */
    public void setAttachmentPath(String AttachmentPath) {
        this.attachmentPath = AttachmentPath;
    }

    /**
     * @return the AttachedFileName
     */
    public String getAttachedFileName() {
        return attachedFileName;
    }

    /**
     * @param AttachedFileName the AttachedFileName to set
     */
    public void setAttachedFileName(String AttachedFileName) {
        this.attachedFileName = AttachedFileName;
    }
}
