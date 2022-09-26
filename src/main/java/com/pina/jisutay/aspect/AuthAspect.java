package com.pina.jisutay.aspect;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class AuthAspect {
	

	@Around("execution(org.springframework.web.servlet.ModelAndView auth*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] args=joinPoint.getArgs();
		for(Object tmp:args) {
			if(tmp instanceof HttpServletRequest) {
				HttpServletRequest request=(HttpServletRequest)tmp;
				String id=(String)request.getSession().getAttribute("id");
				if(id == null) {//만일 로그인을 하지 않았으면
					String url=request.getRequestURI();
					String query=request.getQueryString();
					String encodedUrl=null;
					url = url.replace("/jisutay", "");
					
					if(query==null) {//전송 파라미터가 없다면 
						encodedUrl=URLEncoder.encode(url);
					}else {
						encodedUrl=URLEncoder.encode(url+"?"+query);
					}
						ModelAndView mView=new ModelAndView();
						mView.setViewName("redirect:/users/loginform.do?url="+encodedUrl);
						return mView;
					}
				}
			}
			//로그인을 했으면 아래의 코드가 수행되고 ModelAndView 객체가 Object type 으로 리턴된다. 
			Object obj=joinPoint.proceed();

			return obj;
		}
		@Around("execution(java.util.Map auth*(..))")
		public Object loginCheckAjax(ProceedingJoinPoint joinPoint) throws Throwable {
			Object[] args=joinPoint.getArgs();
			//메소드에 전달된 인자중에서 HttpServletRequest 객체를 찾는다.
			for(Object tmp:args) {
				if(tmp instanceof HttpServletRequest) {
					//type이 안 맞으면 exception 이 발생하기 때문에 instanceof로 먼저 검사를 한다.
					//찾았으면 원래 type 으로 casting
					HttpServletRequest request=(HttpServletRequest)tmp;
					//HttpSession 객체의 참조값 얻어와서 로그인 여부를 알아낸다.
					String id=(String)request.getSession().getAttribute("id");
					if(id == null) {//만일 로그인을 하지 않았으면
						//예외를 발생 시켜서 정상적인 응답을 받을수 없도록 한다.
						throw new RuntimeException("로그인이 필요 합니다.");
					}
				}
			}

			//로그인을 했으면 아래의 코드가 수행되고 ModelAndView 객체가 Object type 으로 리턴된다. 
			Object obj=joinPoint.proceed();

			return obj;
		}
	}

