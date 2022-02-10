package telinfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import telinfoDBConn.TelInfoDBConn;

import telinfoVO.TelInfoVO;

public class TelInfoDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public TelInfoDAO() throws ClassNotFoundException, SQLException {
		con = new TelInfoDBConn().getConnection();
	}

	public void pstmtClose() throws SQLException {
		if (pstmt != null) {
			pstmt.close();
		}
	}

	public void getAllInfoClose() throws SQLException {
		;
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (con != null) {
			con.close();
		}
	}


	// 회원가입 지우면안됨
	public boolean join(String memNickName, String memId, String memPw, String memName, String memTel,
			String memAddress) {
		String sql = "insert into customer\r\n" + "values(?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memNickName);
			pstmt.setString(2, memId);
			pstmt.setString(3, memPw);
			pstmt.setString(4, memName);
			pstmt.setString(5, memTel);
			pstmt.setString(6, memAddress);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}

	// 관리자 권한용 지우면 안됨 전체 고객 출력
	public ArrayList<TelInfoVO> getAllInfo() throws SQLException {
		ArrayList<TelInfoVO> tiarray = new ArrayList<TelInfoVO>();
		String sql = "SELECT * FROM customer ORDER BY memName";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String memNickName = rs.getString("memNickName");
			String memId = rs.getString("memId");
			String memPw = rs.getString("memPw");
			String memName = rs.getString("memName");
			String memTel = rs.getString("memTel");
			String memAddress = rs.getString("memAddress");

			TelInfoVO tv = new TelInfoVO(memNickName, memId, memPw, memName, memTel, memAddress);
			tiarray.add(tv);
		}
		return tiarray;
	}

	////////////// 아이디 중복체크 ////////////
//	중복되는 아이디가 있다면 참을 반환
	public boolean idCheck(String id)// 홍길동
			throws SQLException {
		TelInfoVO tv = null;
		String sql = "SELECT * FROM customer where memId=?";
		// ? : 아이디 검색
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();//

		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}// idCheck()-end

	
	////////////// 비밀번호 체크 ////////////
//	비밀번호가 맞다면 참을 반환
	public boolean pwCheck(String id,String pw)// 홍길동
			throws SQLException {
		TelInfoVO tv = null;
		String sql = "SELECT * FROM customer where memid=? and mempw=?";
		// ? : 아이디 검색
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();//
		
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}// idCheck()-end

	
	//아이디를 파라메터로 받아서 정보 전체를 담아감
	public TelInfoVO getIdInfo(String id)// 홍길동
			throws SQLException {
		TelInfoVO tv = null;
		String sql = "SELECT * FROM customer where memid=?";
//? : 원하는 사람 이름 
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();//
		if (rs.next()) {// 찾았으면 rs종이박스에 홍길동정보가 있다
			String memNickName = rs.getString("memNickName");
			String memId = rs.getString("memId");
			String memPw = rs.getString("memPw");
			String memName = rs.getString("memName");
			String memTel = rs.getString("memTel");
			String memAddress = rs.getString("memAddress");
			tv = new TelInfoVO(memNickName, memId, memPw, memName, memTel, memAddress);// 생성자 사용하여 vo 그릇에 넣자

		} else { // 그런 이름이 없으면
			tv = null; // tv객체참조변수에 null
		}
		return tv;// tv리턴
	}// getIdInfo-end
	
	public boolean deleteCustomer2(String memid){
		String sql = "delete from customer where memid= ? ";/////
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memid);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}
	

	// 회원정보 수정
	public boolean customDataChange(String memNickName, String memid, String memPw, String memName, String memTel,
			String memAddress ) {
		String sql = "update customer "
				+"set memnickname= ? ,mempw= ? ,memname= ? ,"
				+ "memtel= ? ,memaddress= ?    where memid= ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memNickName);
			pstmt.setString(2, memPw);
			pstmt.setString(3, memName);
			pstmt.setString(4, memTel);
			pstmt.setString(5, memAddress);
			pstmt.setString(6, memid);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("change Exception");
			return false;
		}
		return true;
	}
	
	
	

	
	
	
	
}