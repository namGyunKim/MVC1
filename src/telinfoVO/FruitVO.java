package telinfoVO;

public class FruitVO {

	private String fruitCode;	//식품코드
	private String fruitName;	//식품명
	private String ProductYear;	//생산연도
	private String fruitMaker;	//제조사
	private int fruitPrice;	//가격
	private String goodsName;	//상품명
	private int fruitCount;		//재고수량
	private String fruitImg;	//이미지 이름
	
	public FruitVO() {
		
	}
	
	public FruitVO(String fruitCode,String fruitName,String ProductYear,String fruitMaker,
			int fruitPrice,String goodsName,int fruitCount,String fruitImg) {
	
		this.fruitCode=fruitCode;
		this.fruitName=fruitName;
		this.ProductYear=ProductYear;
		this.fruitMaker=fruitMaker;
		this.fruitPrice=fruitPrice;
		this.goodsName=goodsName;
		this.fruitCount=fruitCount;
		this.fruitImg=fruitImg;
	}

	public String getFruitCode() {
		return fruitCode;
	}

	public void setFruitCode(String fruitCode) {
		this.fruitCode = fruitCode;
	}

	public String getFruitName() {
		return fruitName;
	}

	public void setFruitName(String fruitName) {
		this.fruitName = fruitName;
	}

	public String getProductYear() {
		return ProductYear;
	}

	public void setProductYear(String productYear) {
		ProductYear = productYear;
	}

	public String getFruitMaker() {
		return fruitMaker;
	}

	public void setFruitMaker(String fruitMaker) {
		this.fruitMaker = fruitMaker;
	}

	public int getFruitPrice() {
		return fruitPrice;
	}

	public void setFruitPrice(int fruitPrice) {
		this.fruitPrice = fruitPrice;
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

	public String getFruitImg() {
		return fruitImg;
	}

	public void setFruitImg(String fruitImg) {
		this.fruitImg = fruitImg;
	}

	


	
	
	
	
}
