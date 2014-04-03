package spms.vo;

import java.io.Serializable;

public class Car implements Serializable{
	
	int no; // mno
	int mnoUpdate;
	String carNumber;
	String carModel;
	

	String carType;
	String driver;
	
	
	
	
	
	public int getNo() {
		return no;
	}
	public int getMnoUpdate() {
		return mnoUpdate;
	}
	public void setMnoUpdate(int mnoUpdate) {
		this.mnoUpdate = mnoUpdate;
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
	public String getCarModel() {
		return carModel;
	}
	public Car setCarModel(String carModel) {
		this.carModel = carModel;
		return this;
	}
	public String getCarType() {
		return carType;
	}
	public Car setCarType(String carType) {
		this.carType = carType;
		return this;
	}
	public String getDriver() {
		return driver;
	}
	public Car setDriver(String driver) {
		this.driver = driver;
		return this;
	}
	
	
}
