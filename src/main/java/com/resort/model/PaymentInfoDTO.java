package com.resort.model;

public class PaymentInfoDTO {
	private int payment_no;
	private String payment_res_no;
	private String payment_user_id;
	private String payment_date;
	private int payment_price;
	private String payment_type;
	private String payment_card_company;
	private String payment_card_no;
	private int payment_card_div_month;

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public String getPayment_res_no() {
		return payment_res_no;
	}

	public void setPayment_res_no(String payment_res_no) {
		this.payment_res_no = payment_res_no;
	}

	public String getPayment_user_id() {
		return payment_user_id;
	}

	public void setPayment_user_id(String payment_user_id) {
		this.payment_user_id = payment_user_id;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public int getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getPayment_card_company() {
		return payment_card_company;
	}

	public void setPayment_card_company(String payment_card_company) {
		this.payment_card_company = payment_card_company;
	}

	public String getPayment_card_no() {
		return payment_card_no;
	}

	public void setPayment_card_no(String payment_card_no) {
		this.payment_card_no = payment_card_no;
	}

	public int getPayment_card_div_month() {
		return payment_card_div_month;
	}

	public void setPayment_card_div_month(int payment_card_div_month) {
		this.payment_card_div_month = payment_card_div_month;
	}

}
