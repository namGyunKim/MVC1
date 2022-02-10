package telinfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import telinfoDBConn.TelInfoDBConn;

import telinfoVO.FruitVO;
import telinfoVO.TelInfoVO;
import telinfoVO.BasketVO;
import telinfoVO.BoardVO;
import telinfoVO.AdminVO;

public class CustomerServiceDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public CustomerServiceDAO() throws ClassNotFoundException, SQLException {
		con = new TelInfoDBConn().getConnection();
	}



	// 게시판 등록
	public boolean join(String boardTitle,String boardName,String boardContents) {
		String sql = "insert into customerService (boardTitle,boardName,boardContents) values(?,?,?) ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardName);
			pstmt.setString(3, boardContents);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("customerService join Exception");
			return false;
		}
		return true;
	}//join-end
	

	
	//게시판 삭제
	public boolean deleteBoard(String boardName,String boardNumber){
		String sql = "delete from customerService where boardName=? and boardNumber=?";/////
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boardName);
			pstmt.setString(2, boardNumber);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}//deleteFruit-end
	
	// 전체 게시판 출력
	public ArrayList<BoardVO> getAllBoard() throws SQLException {
		ArrayList<BoardVO> tiarray = new ArrayList<BoardVO>();
		String sql = "SELECT * FROM customerService ORDER BY 4";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String boardTitle = rs.getString("boardTitle");
			String boardName = rs.getString("boardName");
			String boardContents = rs.getString("boardContents");
			int boardNumber=rs.getInt("boardNumber");
			Date boardWriteDay=rs.getDate("boardWriteDay");

			BoardVO tv = new BoardVO(boardTitle,boardName,boardContents,boardNumber,boardWriteDay);
			tiarray.add(tv);
		}
		return tiarray;
	}
	
	// 게시판번호를 입력해서 그 게시판의 정보
	public BoardVO getNumberInfo(String boardNumber) throws SQLException {
		String sql = "SELECT * FROM customerService  where boardNumber=? ";
		BoardVO tv=null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, boardNumber);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String boardTitle = rs.getString("boardTitle");
			String boardName = rs.getString("boardName");
			String boardContents = rs.getString("boardContents");
			int boardNumber2=rs.getInt("boardNumber");
			Date boardWriteDay=rs.getDate("boardWriteDay");
			tv = new BoardVO(boardTitle,boardName,boardContents,boardNumber2,boardWriteDay);
			
		}
		else {
			tv =null;
		}
		return tv;
		
	}//getNumberInfo-end
	
	// 해당 유저의 전체 게시판 출력
	public ArrayList<BoardVO> getNameBoard(String boardName) throws SQLException {
		ArrayList<BoardVO> tiarray = new ArrayList<BoardVO>();
		String sql = "SELECT * FROM customerService where boardName=?  ORDER BY 4";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, boardName);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String boardTitle = rs.getString("boardTitle");
			String boardName2 = rs.getString("boardName");
			String boardContents = rs.getString("boardContents");
			int boardNumber=rs.getInt("boardNumber");
			Date boardWriteDay=rs.getDate("boardWriteDay");

			BoardVO tv = new BoardVO(boardTitle,boardName2,boardContents,boardNumber,boardWriteDay);
			tiarray.add(tv);
		}
		return tiarray;
	}
	
	// 회원정보 수정
	public boolean boardDataChange(String boardtitle,String boardContents,int boardnumber) {
		String sql = "update customerService\r\n" + 
				"set boardtitle=?,boardContents=?\r\n" + 
				"where boardnumber=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardtitle);
			pstmt.setString(2, boardContents);
			pstmt.setInt(3, boardnumber);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("change Exception");
			return false;
		}
		return true;
	}
	
	
}