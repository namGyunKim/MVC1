package telinfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import telinfoDBConn.TelInfoDBConn;

import telinfoVO.FruitVO;
import telinfoVO.TelInfoVO;
import telinfoVO.BasketVO;
import telinfoVO.AdminVO;

public class AdminDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public AdminDAO() throws ClassNotFoundException, SQLException {
		con = new TelInfoDBConn().getConnection();
	}

	////////////// 아이디 중복체크 ////////////
//	중복되는 아이디가 있다면 참을 반환
	public boolean idCheck(String adminId)// 홍길동
			throws SQLException {
		String sql = "SELECT * FROM adminUser where adminId=?";
		// ? : 아이디 검색
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, adminId);
		rs = pstmt.executeQuery();//

		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}// idCheck()-end
	
	////////////// 비밀번호 체크 ////////////
//	비밀번호가 맞다면 참을 반환
	public boolean pwCheck(String adminId,String adminPw)// 홍길동
			throws SQLException {
		String sql = "SELECT * FROM adminUser where adminId=? and adminPw=?";
		// ? : 아이디 검색
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, adminId);
		pstmt.setString(2, adminPw);
		rs = pstmt.executeQuery();//
		
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}// idCheck()-end

	// 전체 관리자 출력
	public ArrayList<AdminVO> getAllInfo() throws SQLException {
		ArrayList<AdminVO>adarray = new ArrayList<AdminVO>();
		String sql = "SELECT * FROM adminUser ORDER BY 1";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String adminId = rs.getString("adminId");
			String adminPw = rs.getString("adminPw");
			int adminLevel = rs.getInt("adminLevel");

			AdminVO tv = new AdminVO(adminId,adminPw,adminLevel);
			adarray.add(tv);
		}
		return adarray;
	}

	// 관리자 등록
	public boolean join(String adminId,String adminPw,String adminLevel2) {
		String sql = "insert into adminUser\r\n" + "values(?,?,?)";
		int adminLevel=Integer.parseInt(adminLevel2);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.setString(2, adminPw);
			pstmt.setInt(3, adminLevel);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("basket join Exception");
			return false;
		}
		return true;
	}//join-end
	
	
	// 아이디를 입력해서 그사람의 정보
	public AdminVO getIdInfoLevel(String adminId) throws SQLException {
		String sql = "SELECT * FROM adminUser  where adminId=? ";
		AdminVO tv=null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, adminId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String id = rs.getString("adminId");
			String adminPw = rs.getString("adminPw");
			int adminLevel = rs.getInt("adminLevel");

			tv = new AdminVO(id,adminPw,adminLevel);
			
		}
		else {
			tv =null;
		}
		return tv;
		
	}//getIdInfoLevel-end
	
	//관리자 삭제
	public boolean deleteAdmin(String adminId){
		String sql = "delete from adminUser where adminId=?";/////
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}//deleteFruit-end
	
	
}