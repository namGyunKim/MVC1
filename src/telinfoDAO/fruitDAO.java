package telinfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import telinfoDBConn.TelInfoDBConn;

import telinfoVO.FruitVO;
import telinfoVO.TelInfoVO;

public class fruitDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public fruitDAO() throws ClassNotFoundException, SQLException {
		con = new TelInfoDBConn().getConnection();
	}



	// 과일등록
	public boolean join(String fruitCode,String fruitName,String ProductYear,String fruitMaker,
			int fruitPrice,String goodsName,int fruitCount,String fruitImg) {
		String sql = "insert into fruit\r\n" + "values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fruitCode);
			pstmt.setString(2, fruitName);
			pstmt.setString(3, ProductYear);
			pstmt.setString(4, fruitMaker);
			pstmt.setInt(5, fruitPrice);
			pstmt.setString(6, goodsName);
			pstmt.setInt(7, fruitCount);
			pstmt.setString(8, fruitImg);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("join Exception");
			return false;
		}
		return true;
	}//join-end

	
	////////////// 식품코드 중복체크 ////////////
//	중복되는 아이디가 있다면 참을 반환
	public boolean codeCheck(String code)
			throws SQLException {
		TelInfoVO tv = null;
		String sql = "SELECT * FROM fruit where fruitCode=?";
		// ? : 아이디 검색
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, code);
		rs = pstmt.executeQuery();//

		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}// codeCheck()-end
	
	//과일삭제
	public boolean deleteFruit(String fruitCode){
		String sql = "delete from fruit where fruitCode=?";/////
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, fruitCode);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}//deleteFruit-end
	
	// 관리자 권한용 지우면 안됨 전체 고객 출력
	public ArrayList<FruitVO> getAllFruit() throws SQLException {
		ArrayList<FruitVO> fruitAll = new ArrayList<FruitVO>();
		String sql = "SELECT * FROM fruit ORDER BY fruitCode";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String fruitCode =rs.getString("fruitCode");	//식품코드
			String fruitName =rs.getString("fruitName");	//식품명
			String ProductYear =rs.getString("ProductYear");	//생산연도
			String fruitMaker =rs.getString("fruitMaker");	//제조사
			int fruitPrice =rs.getInt("fruitPrice");	//가격
			String goodsName =rs.getString("goodsName");	//상품명
			int fruitCount =rs.getInt("fruitCount");		//재고수량
			String fruitImg =rs.getString("fruitImg");	//이미지 이름

			FruitVO tv = new FruitVO(fruitCode,fruitName,ProductYear,fruitMaker,
					fruitPrice,goodsName,fruitCount,fruitImg);
			fruitAll.add(tv);
		}
		return fruitAll;
	}
	
	
	////////////// 삭제체크 ////////////
//	삭제했는지 체크함
	public boolean fruitDeleteCheck(String code) {
		
		String tmpStr="null코드";
		if (code.equals(tmpStr)) {
			return false;
		} else {
			return true;
		}
	}// fruitDeleteCheck()-end

	////////////// 체인지ok에쓰임 ////////////
//	체인지ok에쓰임
	public boolean fruitChangeOk(String changeOk) {
		
		String tmpStr="null코드";
		if (changeOk.equals(tmpStr)) {
			return false;
		} else {
			return true;
		}
	}// fruitDeleteCheck()-end
	
	
	//식품코드를 파라메터로 받아서 정보 전체를 담아감
	public FruitVO getIdInfo(String code)// 홍길동
			throws SQLException {
		FruitVO tv = null;
		String sql = "SELECT * FROM fruit where fruitCode=?";
//? : 원하는 사람 이름 
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, code);
		rs = pstmt.executeQuery();//
		if (rs.next()) {// 찾았으면 rs종이박스에 홍길동정보가 있다
			String fruitCode = rs.getString("fruitCode");
			String fruitName = rs.getString("fruitName");
			String productYear = rs.getString("ProductYear");
			String fruitMaker = rs.getString("fruitMaker");
			int fruitPrice = rs.getInt("fruitPrice");
			String goodsName = rs.getString("goodsName");
			int fruitCount = rs.getInt("fruitCount");
			String fruitImg = rs.getString("fruitImg");
			tv = new FruitVO(fruitCode,fruitName,productYear,fruitMaker,
					fruitPrice,goodsName,fruitCount,fruitImg);// 생성자 사용하여 vo 그릇에 넣자

		} else { // 그런 이름이 없으면
			tv = null; // tv객체참조변수에 null
		}
		return tv;// tv리턴
	}// search_nametel()-end
	
	// 과일정보 수정
	public boolean fruitDataChange(String fruitCode,String fruitName,String ProductYear,String fruitMaker,
			int fruitPrice,String goodsName,int fruitCount,String fruitImg) {
		String sql = "update fruit "
				+"set fruitName= ? ,productYear= ? ,fruitMaker= ? , "
				+ " fruitPrice= ?, "
				+ " goodsName= ? ,fruitCount= ? ,fruitImg= ?    where fruitCode= ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fruitName);
			pstmt.setString(2, ProductYear);
			pstmt.setString(3, fruitMaker);
			pstmt.setInt(4, fruitPrice);
			pstmt.setString(5, goodsName);
			pstmt.setInt(6, fruitCount);
			pstmt.setString(7, fruitImg);
			pstmt.setString(8, fruitCode);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("change Exception");
			return false;
		}
		return true;
	}
	
	
	
	
	
}