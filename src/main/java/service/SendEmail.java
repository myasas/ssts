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

import configuration.ConfigurationMaster;
import configuration.StaticReferences;
import data.DatabaseConnection;

/**
 * 
 * @author Yasas De Silva
 *
 */
public class SendEmail {
//Default Sender Email Address and Password hardcoded to prevent user dissatisfaction due to a broken link with email.
    private String emailUserName="emindlibrarysystem@gmail.com";
    private String emailPassword="emind123456";

       
    
    //Default receiver email address set to test any defects in setting receiver email address
    private String receiverEmail="myasas@gmail.com";
    private String mailSubject="SSTS - Your most dedicated and intelligent virtual speech therapist for Stammer...";
    private String mailBody="Hi User, \n Thank you for registering with SSTS";
    private String attachmentPath;
    private String attachedFileName;
    

    
    public void sendAnEmail(SendEmail emailSendeObj){
//    //Always sets the email configuration from the configuration file.     
//   	 ConfigurationMaster cm = new ConfigurationMaster();
//   	 emailUserName = cm.configsFromConfigFile().getEmailUserName();
//   	 emailPassword = cm.configsFromConfigFile().getEmailPassword();    
   	 
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port","465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
         
        Session session =Session.getDefaultInstance(props,
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
                
//AAA-Diables the part which adds the attachment feature                        
//                messageBodyPart=new MimeBodyPart();
//                javax.activation.DataSource source = new FileDataSource(getAttachmentPath());//Attachment path set
//                messageBodyPart.setDataHandler(new DataHandler(source));//same continued
//                messageBodyPart.setFileName(getAttachedFileName());//Attachment file  name set
//                multipart.addBodyPart(messageBodyPart);// Adds atachement path and attachment name to the mail
//AAA               
                message.setContent(multipart);
                
                Transport.send(message);
//Since jsp can not show JoptionPane
//                JOptionPane.showMessageDialog(null,"Email Sent !");
                
           }catch(Exception e)  
           {
//Since jsp can not show JoptionPane        	   
//               JOptionPane.showMessageDialog(null,"Problem occured. Kindly refer to the Emind user guide. \nDetails: "+ e);
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
				try{
			      SendEmail se = new SendEmail();
			      se.setReceiverEmail(userLogin);
			      se.setMailSubject(StaticReferences.emailSubjectWelcome);
			      se.setMailBody("Hi "+dbUsername+", \n\nWelcome to Smart Speech Therapist ! \n\nPlease click on the following link (Or copy and paste the URL in your web browser) to activate your SSTS account.\n\nActivation URL :"+activationURL+" \n\nThank you,\nSSTS\n(Smart Speech Therapist for Stammer)");     
			      
			      se.sendAnEmail(se);
			      isemailSucsessfullySent=true;
			      System.out.println("Account activation email sent to "+userLogin+".");

				}catch(Exception e){
					System.out.println("There was a problem in sending the Activation email. Problem: "+e);
				}
			  } else {
			      	System.out.println("Could not find the user account: "+userLogin+" in the database.");
			  }
		
        } catch (SQLException e) {
			// TODO Auto-generated catch block
        	System.out.println("SQL Exception occured. Problem: "+e);
		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println("Exception occured while trying to send the activation email. Problem :");
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
