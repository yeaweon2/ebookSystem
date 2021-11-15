package co.ebook.prj.login.serviceImpl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import co.ebook.prj.login.mapper.LoginMapper;
import co.ebook.prj.login.service.LoginService;
import co.ebook.prj.login.vo.LoginVO;

@Repository
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper map;
	
	@Override
	public LoginVO getLoginInfo(LoginVO vo) {
		LoginVO lVo=map.getLoginInfo(vo);
		if(lVo != null  && lVo.getMemberStCd().equals("01")) {
			map.insertLoginHistory(vo);
		}
		return lVo;
	}

//	비밀번호변경
	@Override
	public int updatePwd(LoginVO vo) {
		return map.updatePwd(vo);
	}

//	아이디찾기
	@Override
	public LoginVO findId(LoginVO vo) {
		return map.findId(vo);
	}

//	비밀번호찾기
	@Override
	public LoginVO findPassword(LoginVO vo) {
		return map.findPassword(vo);
	}

//	로그아웃
	@Override
	public int updateLogoutHistory(LoginVO vo) {
		return map.updateLogoutHistory(vo);
	}
	
	
	
	
	
	@Override
    public String getReturnAccessToken(String code) {
         String access_token = "";
         String refresh_token = "";
         String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
             //HttpURLConnection 설정 값 셋팅
             conn.setRequestMethod("POST");
             conn.setDoOutput(true);
             
             
             // buffer 스트림 객체 값 셋팅 후 요청
             BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
             StringBuilder sb = new StringBuilder();
             sb.append("grant_type=authorization_code");
             sb.append("&client_id=[내 애플리케이션 Key 값]");  //앱 KEY VALUE
             sb.append("&redirect_uri=http://localhost:8080/kakao_callback"); // 앱 CALLBACK 경로
             sb.append("&code=" + code);
             bw.write(sb.toString());
             bw.flush();
             
             //  RETURN 값 result 변수에 저장
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             String br_line = "";
             String result = "";
 
             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }
 
             JsonParser parser = new JsonParser();
             JsonElement element = parser.parse(result);
 
             
             // 토큰 값 저장 및 리턴
             access_token = element.getAsJsonObject().get("access_token").getAsString();
             refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
 
             br.close();
             bw.close();
         } catch (IOException e) {
             e.printStackTrace();
         }
 
         return access_token;
     }

	
	
	
	
	
	
	
	
	
	
	@Override
    public Map<String,Object> getUserInfo(String access_token) {
        Map<String,Object> resultMap =new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
         try {
             URL url = new URL(reqURL);
             HttpURLConnection conn = (HttpURLConnection) url.openConnection();
             conn.setRequestMethod("GET");
 
            //요청에 필요한 Header에 포함될 내용
             conn.setRequestProperty("Authorization", "Bearer " + access_token);
 
             int responseCode = conn.getResponseCode();
             System.out.println("responseCode : " + responseCode);
 
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
 
             String br_line = "";
             String result = "";
 
             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }
            System.out.println("response:" + result);
 
             JsonParser parser = new JsonParser();
             JsonElement element = parser.parse(result);
 
             JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
             JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
 
             String memberNm = properties.getAsJsonObject().get("memberNm").getAsString();
             String memberNickNm = properties.getAsJsonObject().get("memberNickNm").getAsString();
             resultMap.put("memberNickNm", memberNickNm);
             resultMap.put("memberNm", memberNm);
             
         } catch (IOException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
         return resultMap;
     }
	
	
	
	
	
	
	
	
}
