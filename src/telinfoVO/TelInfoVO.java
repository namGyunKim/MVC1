package telinfoVO;

import java.util.Date;

public class TelInfoVO {
	private String memNickName;
	private String memId;
	private String memPw;
	private String memName;
	private String memTel;
	private String memAddress;
	public TelInfoVO() {
		
		// TODO Auto-generated constructor stub
	}
	
	public TelInfoVO(String memNickName,String memId,String memPw,String memName,String memTel,String memAddress) {
		this.memNickName=memNickName;
		this.memId=memId;
		this.memPw=memPw;
		this.memName=memName;
		this.memTel=memTel;
		this.memAddress=memAddress;
		
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	
	
	

	
	

}
