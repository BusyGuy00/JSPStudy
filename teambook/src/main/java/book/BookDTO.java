package book;

import java.util.Date;

public class BookDTO {
	//북 변수 선언 
	private String 번호;
	private String 이름;
	private String 저자;
	private String 출판사;
	private String 삽입이미지;
	private String 출력이미지;
	private String 카테고리;
	private String 금액;
	private String 수량;
	private String 판매량;
	private String 리뷰수;
	private Date 발매일;
	public String get번호() {
		return 번호;
	}
	public void set번호(String 번호) {
		this.번호 = 번호;
	}
	public String get이름() {
		return 이름;
	}
	public void set이름(String 이름) {
		this.이름 = 이름;
	}
	public String get저자() {
		return 저자;
	}
	public void set저자(String 저자) {
		this.저자 = 저자;
	}
	public String get출판사() {
		return 출판사;
	}
	public void set출판사(String 출판사) {
		this.출판사 = 출판사;
	}
	public String get삽입이미지() {
		return 삽입이미지;
	}
	public void set삽입이미지(String 삽입이미지) {
		this.삽입이미지 = 삽입이미지;
	}
	public String get출력이미지() {
		return 출력이미지;
	}
	public void set출력이미지(String 출력이미지) {
		this.출력이미지 = 출력이미지;
	}
	public String get카테고리() {
		return 카테고리;
	}
	public void set카테고리(String 카테고리) {
		this.카테고리 = 카테고리;
	}
	public String get금액() {
		return 금액;
	}
	public void set금액(String 금액) {
		this.금액 = 금액;
	}
	public String get수량() {
		return 수량;
	}
	public void set수량(String 수량) {
		this.수량 = 수량;
	}
	public String get판매량() {
		return 판매량;
	}
	public void set판매량(String 판매량) {
		this.판매량 = 판매량;
	}
	public String get리뷰수() {
		return 리뷰수;
	}
	public void set리뷰수(String 리뷰수) {
		this.리뷰수 = 리뷰수;
	}
	public Date get발매일() {
		return 발매일;
	}
	public void set발매일(Date 발매일) {
		this.발매일 = 발매일;
	}
	
	
}
