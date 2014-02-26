package spms.services;

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import spms.vo.Excel;

public class RestRequest {
	String lat;
	String lng;
	
	public Excel requests(String addr) throws IOException, ParserConfigurationException, SAXException
	{
		
		//링크 주소 만들기
		String requestUrl = "http://apis.daum.net/local/geo/addr2coord";
		requestUrl += "?apikey=" + "28cfce6944a0730f400b070b2da4abbe05010b0f"; //발급된 키
        requestUrl += "&q="; //검색어
        requestUrl += addr; //검색어
        requestUrl += "&output=xml";
		URL url = new URL(requestUrl);
		//API 요청 및 반환
		URLConnection conn = url.openConnection();
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(conn.getInputStream());
		//channel노드를 객체화 하기
		Node node = doc.getElementsByTagName("channel").item(0);
		for (int i=0 ;i< node.getChildNodes().getLength();i++) {
			Node channelNode = node.getChildNodes().item(i);
			String nodeName = channelNode.getNodeName();
//			int count = 0;
			//item 노드들일 경우
			if ("item".equals(nodeName)) 
			{
				//item노드의 자식노드를 검색
				for (int j=0 ;j< channelNode.getChildNodes().getLength();j++) 
				{
					Node itemNode = channelNode.getChildNodes().item(j);
					//title노드 일 경우 출력
					if("lat".equals(itemNode.getNodeName())){
						lat = itemNode.getTextContent();
					}
					if("lng".equals(itemNode.getNodeName())){
						lng = itemNode.getTextContent();
					}
//					if(lat!=null&lng!=null&count==0) {
//						count++;
//						new Excel(Double.parseDouble(lat), Double.parseDouble(lng));
//					}
				}
				
			}
		}
		return new Excel(Double.parseDouble(lat), Double.parseDouble(lng));
	}
}