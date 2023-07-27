package com.jose1593.board;
// 롬복 (프로그램 서버 구동하면 자동으로 getter & setter를 만들어준다)
public class PageDTO {
	private int firstRecordIndex, recordCountPerPage;

	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}

	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

}
