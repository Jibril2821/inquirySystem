package bean;

public class InquiryList {
	private int inquiryno;
	private String name;
	private String inquiryname;
	private String date;
	private String contents;
	private String reply;
	private String deleted;

	public int getInquiryno() {
		return inquiryno;
	}
	public void setInquiryno(int inquiryno) {
		this.inquiryno = inquiryno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInquiryname() {
		return inquiryname;
	}
	public void setInquiryname(String inquiryname) {
		this.inquiryname = inquiryname;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
}
