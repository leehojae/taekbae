package spms.services;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.google.gson.stream.JsonReader;

public class TmapCarLeadTime {
//	public Excel requests(String startLat, String startLng, String endLat, String endLng) throws IOException, ParserConfigurationException, SAXException
	public void requests() throws IOException, ParserConfigurationException, SAXException
	{
		
		//링크 주소 만들기
//		String requestUrl = "http://apis.daum.net/local/geo/addr2coord";
//		requestUrl += "?apikey=" + "28cfce6944a0730f400b070b2da4abbe05010b0f"; //발급된 키
//        requestUrl += "&q="; //검색어
//        requestUrl += "&output=xml";
		System.out.println("12121");
		java.lang.System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");
		URL url = new URL("https://apis.skplanetx.com/tmap/routes?version=1&reqCoordType=WGS84GEO&startX=127.02807612700347&startY=37.49528869328986&endX=127.02371071727875&endY=37.49394534776091&appKey=53a2d5b1-cf76-38be-a917-e59fd79ce2a9");
		URLConnection conn = url.openConnection();
		JsonReader reader = new JsonReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

			reader.beginObject();
		     while (reader.hasNext()) {
		       String name = reader.nextName();
		       if (name.equals("features")) {
		    	   System.err.println("success");
		       } else {
		         reader.skipValue();
		       }
		     }
		     reader.endObject();
		reader.close();
		
		//API 요청 및 반환
//		URLConnection conn = url.openConnection();
//		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//		DocumentBuilder builder = factory.newDocumentBuilder();
//		Document doc = builder.parse(conn.getInputStream());
//		//channel노드를 객체화 하기
//		Node node = doc.getElementsByTagName("channel").item(0);
//		for (int i=0 ;i< node.getChildNodes().getLength();i++) {
//			Node channelNode = node.getChildNodes().item(i);
//			String nodeName = channelNode.getNodeName();
////			int count = 0;
//			//item 노드들일 경우
//			if ("item".equals(nodeName)) 
//			{
//				//item노드의 자식노드를 검색
//				for (int j=0 ;j< channelNode.getChildNodes().getLength();j++) 
//				{
//					Node itemNode = channelNode.getChildNodes().item(j);
//					//title노드 일 경우 출력
//					if("lat".equals(itemNode.getNodeName())){
//						lat = itemNode.getTextContent();
//					}
//					if("lng".equals(itemNode.getNodeName())){
//						lng = itemNode.getTextContent();
//					}
////					if(lat!=null&lng!=null&count==0) {
////						count++;
////						new Excel(Double.parseDouble(lat), Double.parseDouble(lng));
////					}
//				}
//				
//			}
//		}
//		return new Excel(Double.parseDouble(lat), Double.parseDouble(lng));
	}
}