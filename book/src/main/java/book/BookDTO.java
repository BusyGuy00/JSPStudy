package book;

import java.util.Date;

public class BookDTO {
	
		//북 변수 선언 
		private String idx;
		private String name;
		private String writer;
		private String publisher;
		private String ofile;
		private String sfile;
		private String cate;
		private String price;
		private String each;
		private String count;
		private String review;
		private Date postdate;
		
		
		public String getSfile() {
			return sfile;
		}
		public void setSfile(String sfile) {
			this.sfile = sfile;
		}
		public String getOfile() {
			return ofile;
		}
		public void setOfile(String ofile) {
			this.ofile = ofile;
		}
		public String getIdx() {
			return idx;
		}
		public void setIdx(String idx) {
			this.idx = idx;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getPublisher() {
			return publisher;
		}
		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}
		public String getCate() {
			return cate;
		}
		public void setCate(String cate) {
			this.cate = cate;
		}
		public String getPrice() {
			return price;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		public String getEach() {
			return each;
		}
		public void setEach(String each) {
			this.each = each;
		}
		public String getCount() {
			return count;
		}
		public void setCount(String count) {
			this.count = count;
		}
		public String getReview() {
			return review;
		}
		public void setReview(String review) {
			this.review = review;
		}
		public Date getPostdate() {
			return postdate;
		}
		public void setPostdate(Date postdate) {
			this.postdate = postdate;
		}
	
}