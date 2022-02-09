package com.example.project.model.book.dto;

import org.springframework.web.multipart.MultipartFile;

public class bookDTO {

	private int book_id;
	private String  book_name;
	private String  book_img;
	private String  book_genre;
	private String  book_content;
	private String  book_publisher;
	private String  book_author;
	private int  book_counter;
	private int book_check;
	private MultipartFile file; //첨부파일
	
	@Override
	public String toString() {
		return "bookDTO [book_id=" + book_id + ", book_name=" + book_name + ", book_img=" + book_img + ", book_genre="
				+ book_genre + ", book_content=" + book_content + ", book_publisher=" + book_publisher
				+ ", book_author=" + book_author + ", book_counter=" + book_counter + ", book_check=" + book_check
				+ ", file=" + file + "]";
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public String getBook_genre() {
		return book_genre;
	}
	public void setBook_genre(String book_genre) {
		this.book_genre = book_genre;
	}
	public String getBook_content() {
		return book_content;
	}
	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}
	public String getBook_publisher() {
		return book_publisher;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public int getBook_counter() {
		return book_counter;
	}
	public void setBook_counter(int book_counter) {
		this.book_counter = book_counter;
	}
	public int getBook_check() {
		return book_check;
	}
	public void setBook_check(int book_check) {
		this.book_check = book_check;
	}
	
	
}
