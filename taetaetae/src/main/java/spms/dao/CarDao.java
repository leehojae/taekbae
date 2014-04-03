package spms.dao;

import java.util.List;

import spms.vo.Car;

public interface CarDao {
	public List<Car> selectList() throws Exception;
	public Car selectOne(int no) throws Exception;
	public int insert(Car car) throws Exception;
	public int update(Car car) throws Exception;
	public int updateMno(Car car) throws Exception;
	public int delete(int no) throws Exception;
}







