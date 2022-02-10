package telinfoVO;

import java.util.Date;

public class BoardVO {

	private String boardTitle;		//글제목
	private String boardName;		//작성자
	private String boardContents;	//글내용
	private int boardNumber;		//글번호
	private Date boardWriteDay;		//글작성일
	public BoardVO() {
		
	}
	
	public BoardVO(String boardTitle,String boardName,String boardContents,int boardNumber,Date boardWriteDay) {
		this.boardTitle=boardTitle;
		this.boardNumber=boardNumber;
		this.boardName=boardName;
		this.boardContents=boardContents;
		this.boardWriteDay=boardWriteDay;
	}
	
	public BoardVO(String boardTitle,String boardName,String boardContents) {
		this.boardTitle=boardTitle;
		this.boardName=boardName;
		this.boardContents=boardContents;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public Date getBoardWriteDay() {
		return boardWriteDay;
	}

	public void setBoardWriteDay(Date boardWriteDay) {
		this.boardWriteDay = boardWriteDay;
	}

	
}
