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

public class BasketDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public BasketDAO() throws ClassNotFoundException, SQLException {
		con = new TelInfoDBConn().getConnection();
	}



	// 장바구니 등록
	public boolean join(String memId,String fruitCode,String goodsName,String fruitCount2,int fruitPrice) {
		String sql = "insert into basket\r\n" + "values(?,?,?,?,?)";
		int fruitCount=Integer.parseInt(fruitCount2);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, fruitCode);
			pstmt.setString(3, goodsName);
			pstmt.setInt(4, fruitCount);
			pstmt.setInt(5, fruitPrice*fruitCount);
			pstmt.executeUpdate();/////////
		} catch (SQLException e) {
			System.out.println("basket join Exception");
			return false;
		}
		return true;
	}//join-end

	
	//장바구니 삭제
	public boolean deleteBasket(String memid,String fruitCode){
		String sql = "delete from basket where fruitCode=?  and  memid=?";/////
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, fruitCode);
			pstmt.setString(2, memid);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}//deleteFruit-end
	
	// 특정 아이디의 장바구니 물품 목록
	public ArrayList<BasketVO> getIdBasket(String memid) throws SQLException {
		ArrayList<BasketVO> basketAll = new ArrayList<BasketVO>();
		String sql = "SELECT * FROM basket where memid =?  ORDER BY fruitCode";

		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, memid);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String thisMemid =rs.getString("memid");	//식품코드
			String fruitCode =rs.getString("fruitCode");	//식품명
			String goodsName =rs.getString("goodsName");	//생산연도
			int fruitCount =rs.getInt("fruitCount");	//제조사
			int fruitPrice =rs.getInt("fruitPrice");	//가격

			BasketVO tv = new BasketVO(thisMemid,fruitCode,goodsName,fruitCount,fruitPrice);
			basketAll.add(tv);
		}
		return basketAll;
	}
	
	
/*null이 아니면 참을 반환*/
	public boolean basketCodeCheck(String code) {
		
		String tmpStr="null코드";
		if (code.equals(tmpStr)) {
			return false;
		} else {
			return true;
		}
	}// fruitDeleteCheck()-end
	
	
	//장바구니 카운트+1
	public boolean basketAdd(String memid,String fruitCode,String fruitCount){
		String sql = "update basket b set b.fruitcount= b.fruitcount+?,b.fruitPrice = b.fruitPrice+"
				+ "(select f.fruitprice from fruit f where fruitcode=?)*?  "
				+ " where fruitCode=?  and  memid=?";/////
		
		int fruitOrder=Integer.parseInt(fruitCount);
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, fruitOrder);
			pstmt.setString(2, fruitCode);
			pstmt.setInt(3, fruitOrder);
			pstmt.setString(4, fruitCode);
			pstmt.setString(5, memid);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("add Exception");
			return false;
		}
		return true;
	}//deleteFruit-end
	
	
	// 그 식품코드가 존재하는가
	public boolean basketIsCode(String code, String memId) throws SQLException {
		String sql = "SELECT * FROM basket where fruitCode =? and memId =?";

		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, code);
		pstmt.setString(2, memId);
		rs = pstmt.executeQuery();

		if ( (rs.next())   ) {
			return true;
		}
		else {
			return false;
		}

	}
	
	public boolean basketOrder(String fruitCode){
		String sql = "update fruit f set f.fruitCount =f.fruitCount -"
				+ "(select fruitCount from basket where fruitCode= ? )  "
				+ " where fruitCode=? ";/////
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, fruitCode);
			pstmt.setString(2, fruitCode);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}//deleteFruit-end
	
	//장바구니 삭제
	public boolean BasketAllDelete(String memid){
		String sql = "delete from basket where memid=?";/////
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memid);
			pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}//deleteFruit-end
	
	
}