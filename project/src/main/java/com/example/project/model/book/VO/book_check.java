package com.example.project.model.book.VO;

import java.util.Arrays;

public class book_check {
	private String checklist[];

	public book_check(String[] checklist) {
		super();
		this.checklist = checklist;
	}

	public book_check() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String[] getChecklist() {
		return checklist;
	}

	public void setChecklist(String[] checklist) {
		this.checklist = checklist;
	}

	@Override
	public String toString() {
		return "book_check [checklist=" + Arrays.toString(checklist) + "]";
	}
	
	
}
