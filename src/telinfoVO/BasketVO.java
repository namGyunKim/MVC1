package telinfoVO;

public class BasketVO {

	private String memId;		//아이디
	private String fruitCode;	//식품코드
	private String goodsName;	//상품명
	private int fruitCount;		//재고수량
	private int fruitPrice;	//가격
	public BasketVO() {
		
	}
	
	public BasketVO(String memId,String fruitCode,String goodsName,int fruitCount,int fruitPrice) {
	
		this.memId=memId;
		this.fruitCode=fruitCode;
		this.goodsName=goodsName;
		this.fruitCount=fruitCount;
		this.fruitPrice=fruitPrice;
		
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getFruitCode() {
		return fruitCode;
	}

	public void setFruitCode(String fruitCode) {
		this.fruitCode = fruitCode;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getFruitCount() {
		return fruitCount;
	}

	public void setFruitCount(int fruitCount) {
		this.fruitCount = fruitCount;
	}

	public int getFruitPrice() {
		return fruitPrice;
	}

	public void setFruitPrice(int fruitPrice) {
		this.fruitPrice = fruitPrice;
	}




	
	
	
	
}
