package com.three.kidult.model.biz;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.three.kidult.dto.MemberDto;
import com.three.kidult.model.dao.MemberDao;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto idchk(String id) {
		
		return dao.idchk(id);
	}

	@Override
	public MemberDto emailchk(String email) {
		
		return dao.emailchk(email);
	}

	@Override
	public int signup(MemberDto dto) {
		
		return dao.signup(dto);
	}

	@Override
	public List<MemberDto> selectList() {
		
		return dao.selectList();
	}

	@Override
	public MemberDto login(String id, String pw) {
		
		return dao.login(id, pw);
	}

	@Override
	public MemberDto forgotId(String name, String email) {
		
		return dao.forgotId(name, email);
	}

	@Override
	public MemberDto forgotPw(String id, String name, String email) {
		
		return dao.forgotPw(id, name, email);
	}

	@Override
	public int updatePw(String id, String pw) {
		
		return dao.updatePw(id, pw);
	}

	@Override
	public int goodbyeUser(MemberDto dto) {
		
		return dao.goodbyeUser(dto);
	}

	@Override
	public String kakaoGetAccessToken(String authorize_code) {
		
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=0e2f445e50f3854d752de29fe5f4f3b6");
			sb.append("&redirect_uri=http://localhost:8787/mvc03/kakaoLogin.do");
			sb.append("&code="+authorize_code);
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			
			br.close();
			bw.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public HashMap<String, Object> kakaoGetUserInfo(String access_Token) {
		
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			String kakaoId = element.getAsJsonObject().get("id").getAsString();
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			if(email != null) {
				
				userInfo.put("email", email);
			}
			
			userInfo.put("kakaoId", kakaoId);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userInfo;
	}

	@Override
	public int roleupdate(String enabled, String id) {
		return dao.roleupdate(enabled, id);
	}

	@Override
	public int deleteid(String id) {
		return dao.deleteid(id);
	}

}
