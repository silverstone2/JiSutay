package com.pina.jisutay.users.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pina.jisutay.notice.dto.NoticeDto;
import com.pina.jisutay.users.dao.UsersDao;
import com.pina.jisutay.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao dao;
	
	// 회원가입 기능 서비스
	@Override
	public void addUser(UsersDto dto) {
		String password = dto.getPassword();
		
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(password);
		
		dto.setPassword(encodedPwd);
		dao.insert(dto);
	}

	@Override
	public Map<String, Boolean> checkId(String id) {
		UsersDto dto = dao.checkId(id);
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		
		if(dto == null) {
			result.put("isExist", false);
		} else {
			result.put("isExist", true);
		}
		
		return result;
	}

	
	// 로그인 기능 서비스
	@Override
	public void checkUser(UsersDto dto, ModelAndView mav, HttpServletRequest req, HttpServletResponse res) {
		String id = dto.getId();
		String password = dto.getPassword();
		Boolean isValid = false;
		// 이동 url 파라미터
		String param = req.getParameter("url");
		System.out.println(param);
		// url 파라미터에 다른 파라미터가 붙어 있을 경우
		String url = param;
		String num = null;
		String sort = null;
		if(param.split(",").length > 1) {
			url = param.split(",")[0];
			num = param.split(",")[1];
			sort = param.split(",")[2];
		}
		
		UsersDto savedDto = dao.checkId(id);
		HttpSession session = req.getSession();
		
		if(savedDto != null && password != "") {
			// id와 password가 존재할 경우
			String encodedPwd = savedDto.getPassword();
			
			isValid=BCrypt.checkpw(password, encodedPwd);
		} else {
			// id 또는 password 둘 중 하나가 없는 경우
			session.setAttribute("isFail", true);
			mav.setViewName("redirect:/users/loginform.do?url="+param);
			return;
		}
		
		if(isValid) {
			session.removeAttribute("isFail");
			session.setAttribute("id", id);
			
			String autoLogin = req.getParameter("autoLogin");
			if(req.getParameter("autoLogin") == null) {
				autoLogin = "off";
			}
			
			// isAutoLogin : 자동 로그인 여부를 저장하는 쿠키(로그인 페이지에 '자동 로그인' 체크박스 선택을 위한 용도)
			// sessionId : 세션 id로써 쿠키에는 암호화된 상태로 저장된다.
			// 로그아웃 시, sessionId는 삭제하고 isAutoLogin은 유지함
			// isAutoLogin 쿠키는 로그인할 때만 컨트롤한다.
			// sessionId는 isAutoLogin과 함께 유지되지만, 로그아웃 시 강제 삭제되도록 한다.
			// 다시 자동 로그인을 선택한 상태에서 로그인할 경우에만 다시 생성하도록 한다.
			if(autoLogin.equals("on")) {
				// isAutoLogin 쿠키 생성
				Cookie cookie_autoLogin = new Cookie("isAutoLogin", "true");
				cookie_autoLogin.setMaxAge(60 * 60 * 24 * 7);
				cookie_autoLogin.setPath("/");
				res.addCookie(cookie_autoLogin);
				
				// sessionId를 위한 암호화된 session.getId() 값 만들
				String sessionGetId = session.getId();
				String encodedSessionId = null;
				try {
					aes256Util();
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				try {
					encodedSessionId = aesEncode(sessionGetId);
				} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException
						| NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException
						| BadPaddingException e) {
					e.printStackTrace();
				}
				
				// sessionId 쿠키 생성
				Cookie cookie_sessionId = new Cookie("sessionId", encodedSessionId);
				cookie_sessionId.setMaxAge(60 * 60 * 24 * 7);
				cookie_sessionId.setPath("/");
				res.addCookie(cookie_sessionId);
				
				// 복호화한 session.getId() 값 DB에 저장하기
				UsersDto updateDto = new UsersDto();
				updateDto.setId(id);
				updateDto.setSessionId(sessionGetId);
				dao.insertSessionId(updateDto);
			} else {
				// isAutoLogin 삭제
				Cookie cookie_autoLogin = new Cookie("isAutoLogin", null);
				cookie_autoLogin.setMaxAge(0);
				cookie_autoLogin.setPath("/");
				res.addCookie(cookie_autoLogin);
			}
			
			String returnUrl = null;
			if(num!=null && sort!=null) {
				// 세부 객실 redirect
				returnUrl = "redirect:"+url+"?num="+num+"&sort="+sort+"#review";
			} else if(url.contains("reservation")) {
				// 예약 페이지 redirect
				returnUrl = "redirect:"+url+"#focus";
			} else {
				// index 페이지 redirect
				returnUrl = "redirect:"+url;
			}
			
			mav.setViewName(returnUrl);
		} else {
			session.setAttribute("isFail", true);
			mav.setViewName("redirect:/users/loginform.do?url="+param);
		}
	}

	// 로그아웃 기능 서비스
	@Override
	public void logout(HttpServletRequest req, HttpServletResponse res) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				// sessionId 라는 쿠키가 존재하면 해당 쿠키 삭제
				if(name.equals("sessionId")) {
					// sessionId 쿠키 강제 삭제
					Cookie cookie_sessionId = new Cookie("sessionId", null);
					cookie_sessionId.setMaxAge(0);
					cookie_sessionId.setPath("/");
					res.addCookie(cookie_sessionId);
				}
			}
		}
		
		// DB에서 sessionId 값과 session 값 삭제
		HttpSession session = req.getSession();
		
		dao.deleteSessionId((String)session.getAttribute("id"));
		session.removeAttribute("id");
	}
	
	// Interceptor에서 들어온 요청 핸들러 사용
	// Cookie sessionId와 DB sessionId 검증 후, 자동 로그인 처리
	@Override
	public void authSessionId(HttpServletRequest req) throws NoSuchAlgorithmException, NoSuchPaddingException {
		// 쿠키 조회
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String cookieSessionId = cookie.getValue();
				if(name.equals("sessionId")) {
					// Cookie에 sessionId가 있다면 DB에서 sessionId를 가져와 검증
					String decodedSessionId = null;
					try {
						aes256Util();
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					try {
						decodedSessionId = aesDecode(cookieSessionId);
					} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException
							| NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException
							| BadPaddingException e) {
						e.printStackTrace();
					}
					
					UsersDto dto = dao.selectSessionIdExist(decodedSessionId);
					// dto가 존재하면, session 생성
					if(dto != null) {
						String id = dto.getId();
						HttpSession session = req.getSession();
						session.setAttribute("id", id);
					}
				}
			}
		}
	}
	
	// 로그인 페이지에서 자동 로그인 체크박스 선택 Flag 값 반환
	@Override
	public void autoLoginFlag(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				if(name.equals("isAutoLogin")) {
					req.setAttribute("isAutoLogin", "on");
				}
			}
		}
	}
	
	// 암호화, 복호화 관련 메소드
	private Key keySpec;
    private String iv;
    private String key = "1684561846457799";

    public void aes256Util() throws UnsupportedEncodingException {
        iv = this.key.substring(0, 16);
        byte[] keyBytes = new byte[16];
        byte[] b = iv.getBytes("UTF-8");
        int len = b.length;
        if(len > keyBytes.length)
            len = keyBytes.length;
        System.arraycopy(b, 0, keyBytes, 0, len);
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

        this.keySpec = keySpec;
    }

    // 암호화
    public String aesEncode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException,
            NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException,
            IllegalBlockSizeException, BadPaddingException {
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(this.iv.getBytes()));

        byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
        String enStr = new String(Base64.encodeBase64(encrypted));

        return enStr;
    }

    //복호화
    public String aesDecode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException,
            NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException,
            IllegalBlockSizeException, BadPaddingException {
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(this.iv.getBytes("UTF-8")));

        byte[] byteStr = Base64.decodeBase64(str.getBytes());

        return new String(c.doFinal(byteStr),"UTF-8");
    }
    // ----------------------------
    // 마이페이지 정보 가져오기
	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 읽어온다. 
		String id=(String)session.getAttribute("id");
		//DB 에서 회원 정보를 얻어와서 
		UsersDto dto=dao.getData(id);
		//ModelAndView 객체에 담아준다.
		mView.addObject("dto", dto);
	}

	@Override
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView, HttpServletRequest request) {
		//세션 영역에서 로그인된 아이디 읽어오기
		String id=(String)session.getAttribute("id");
		//DB 에 저장된 회원정보 얻어오기
		UsersDto resultDto=dao.getData(id);
		//DB 에 저장된 암호화된 비밀 번호
		String encodedPwd=resultDto.getPassword();
		//클라이언트가 입력한 비밀번호
		String inputPwd=dto.getPassword();
		//두 비밀번호가 일치하는지 확인
		boolean isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		//만일 일치 한다면
		if(isValid) {
			//새로운 비밀번호를 암호화 한다.
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodedNewPwd=encoder.encode(dto.getNewpassword());
			//암호화된 비밀번호를 dto 에 다시 넣어준다.
			dto.setNewpassword(encodedNewPwd);
			//dto 에 로그인된 아이디도 넣어준다.
			dto.setId(id);
			//dao 를 이용해서 DB 에 수정 반영한다.
			dao.updatePwd(dto);
			//로그아웃 처리
			session.removeAttribute("id");
		}
		//작업의 성공여부를 ModelAndView 객체에 담아 놓는다(결국 HttpServletRequest 에 담긴다)
		mView.addObject("isSuccess", isValid);
		//로그인된 아이디도 담아준다.
		mView.addObject("id", id);
	}

	@Override
	public void deleteUser(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 얻어와서 
		String id=(String)session.getAttribute("id");
		//해당 정보를 DB 에서 삭제하고
		dao.delete(id);
		//로그아웃 처리도 한다.
		session.removeAttribute("id");
		//ModelAndView 객체에 탈퇴한 회원의 아이디를 담아준다.
		mView.addObject("id", id);
	}

	@Override
	public void updateUser(UsersDto dto, HttpSession session) {
		//수정할 회원의 아이디
		String id=(String)session.getAttribute("id");
		//UsersDto 에 아이디도 담아 주고
		dto.setId(id);
		//UsersDao 를 이용해서 수정 반영한다.
		dao.update(dto);
	}

}
    
