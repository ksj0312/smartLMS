package com.smart.lms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smart.lms.dao.MemberDAO;
import com.smart.lms.vo.MyPageVO;
import com.smart.lms.vo.ProfessorVO;
import com.smart.lms.vo.StudentVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	//학생 로그인
	@Override
	public StudentVO studentLogin(StudentVO vo) {
		 StudentVO svo = memDAO.getStudent(vo);

	      if (svo != null) {
	         boolean isMatch = passwordEncoder.matches(vo.getPwd(), svo.getPwd());
//	    	  boolean isMatch = vo.getPwd().equals(svo.getPwd());
	         if (isMatch) {
	            return svo;
	         }
	      }
	      return null;
	   }

	//학생 정보 한 줄 가져오기
	@Override
	public StudentVO getStudent(StudentVO vo) {
		return  memDAO.getStudent(vo);
	}
	//관리자(교수) 로그인
	@Override
	public ProfessorVO adminLogin(ProfessorVO vo) {
		ProfessorVO pvo = memDAO.getAdmin(vo);
		
	      if (pvo != null) {
	         boolean isMatch = passwordEncoder.matches(vo.getPwd(), pvo.getPwd());
	         if(isMatch){
	            return pvo;
	         }
	      }
	      return null;
	}
	//관리자(교수) 한 줄 가져오기
	@Override
	public ProfessorVO getAdmin(ProfessorVO vo) {
		return  memDAO.getAdmin(vo);
	}
	
	//학생 데이터 인서트
	@Override
	public void insertStudentTx(List<StudentVO> users) throws Exception {
		for(int i = 0; i < users.size(); i++) {
			String encryptedPassword = passwordEncoder.encode(users.get(i).getPwd()); 
			users.get(i).setPwd(encryptedPassword);
			memDAO.insertStudent(users.get(i));
		}
	}
	
	//교수 데이터 인서트
	@Override
	public void insertProfessorTx(List<ProfessorVO> professors) throws Exception {
		for(int i = 0; i < professors.size(); i++) {
			String encryptedPassword = passwordEncoder.encode(professors.get(i).getPwd()); 
			professors.get(i).setPwd(encryptedPassword);
			memDAO.insertProfessor(professors.get(i));
		}
	}

	@Override
	public StudentVO getUserInfo(String userId) {
		return memDAO.getUserInfo(userId);
	}
	
	public void certifiedPhoneNumber(String tel, int code) {
		  String api_key = "NCS665AHFZ154SIC";
	      String api_secret = "XN4S35RRONVXBNYLEPFLP0UUPXMMJBPC";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", tel);    // 수신전화번호
	    params.put("from", "01083818803");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+code+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version
	    System.out.println(tel  + "0");

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
//	        System.out.println(obj.toString()+ randomNumber);
	      } catch (CoolsmsException e) {
//	        System.out.println(e.getMessage() + "2");
//	        System.out.println(e.getCode()  + "3");
	      }
	    
	}

	@Override
	public void updateTel(String tel, String pasttel) {
		memDAO.updateTel(tel,pasttel);
	}

	@Override
	public boolean changePwd(StudentVO vo) {
		 StudentVO svo = memDAO.getStudent(vo);
		 boolean isMatch;
	    if (svo != null) {
//	          isMatch = passwordEncoder.matches(vo.getPwd(), svo.getPwd());
	    	isMatch = vo.getPwd().equals(svo.getPwd());
	         if (isMatch) {
	            return isMatch;
	         }
	         return isMatch;
	      }
//		System.out.println(memDAO.changePwd(pwd, userId));
		return false;
	}

	@Override
	public void changeNewPwd(StudentVO vo) {
			String encryptedPassword = passwordEncoder.encode(vo.getPwd()); 
			vo.setPwd(encryptedPassword);
			System.out.println(vo.getPwd());
			memDAO.changeNewPwd(vo);
		
	}

	@Override
	public void updateMail(String email, String userId) {
		memDAO.updateMail(email, userId);
		
	}

	@Override
	public StudentVO getId(String email) {
		return memDAO.getId(email);
		
	}
	//마이페이지 수강목록
	@Override
	public List<MyPageVO> getClassList(MyPageVO vo) {
		return memDAO.getClassList(vo);
	}
	//마이페이지 수강목록 상세보기

	@Override
	public MyPageVO myPageClassInfo(int c_number, String userId) {
		return memDAO.myPageClassInfo(c_number, userId);
	}

	@Override
	public void updatePost(String zipcode, String addr, String detail_addr, String userId) {
		memDAO.updatePost(zipcode, addr, detail_addr, userId);
	}

	

}
