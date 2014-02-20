package spms.vo;

import java.io.Serializable;

public class Car implements Serializable{
  private static final long serialVersionUID = 1L;
	
	public static final int MINIBUS = 0;
	public static final int ONETON = 1;
	public static final int FIVETON = 2;
	public static final int REFRIGERATED = 3;
	
	int no;
	String carNumber;
	int carLoad;
	int carType;
	Member driver;
	public int getNo() {
		return no;
	}
	public Car setNo(int no) {
		this.no = no;
		return this;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public Car setCarNumber(String carNumber) {
		this.carNumber = carNumber;
		return this;
	}
	public int getCarLoad() {
		return carLoad;
	}
	public Car setCarLoad(int carLoad) {
		this.carLoad = carLoad;
		return this;
	}
	public int getCarType() {
		return carType;
	}
	public Car setCarType(int carType) {
		this.carType = carType;
		return this;
	}
	
	

}
