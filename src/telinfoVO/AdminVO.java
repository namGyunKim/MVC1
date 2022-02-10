package telinfoVO;

public class AdminVO {

	private String adminId;		//아이디
	private String adminPw;		//비밀번호
	private int adminLevel;		//관리자레벨
	public AdminVO() {
		
	}
	
	public AdminVO(String adminId,String adminPw,int adminLevel) {
		this.adminId=adminId;
		this.adminPw=adminPw;
		this.adminLevel=adminLevel;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public int getAdminLevel() {
		return adminLevel;
	}

	public void setAdminLevel(int adminLevel) {
		this.adminLevel = adminLevel;
	}
	





	
	
	
	
}
