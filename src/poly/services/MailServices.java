package poly.services;

public interface MailServices {

	public void send(String from, String to, String subject, String content) throws Exception;

}
