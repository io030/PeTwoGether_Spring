package com.test.petwogether.member;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.petwogether.PetDTO;
import com.test.petwogether.admin.AdminDTO;
import com.test.petwogether.petsitter.DiaryDTO;
import com.test.petwogether.petsitter.PetSitterDTO;
import com.test.petwogether.petsitter.RDateDTO;
import com.test.petwogether.petsitter.RegisterDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	
	@GetMapping("/main/index")
	public String index(Model model) {
		
		int mCnt = service.mCnt();
		int psCnt = service.psCnt();
		int aCnt = service.aCnt();
		int psrCnt = service.psrCnt();
		
		List<PSReviewDTO> psrList = service.getPSReviewList();
		
		List<PetSitterDTO> psList = new ArrayList<PetSitterDTO>();
		
		for (PSReviewDTO dto : psrList) {

			psList.add(service.getRPetSiiter(dto.getPsrseq()));

		}
		
		model.addAttribute("mCnt",mCnt);
		model.addAttribute("psCnt",psCnt);
		model.addAttribute("aCnt",aCnt);
		model.addAttribute("psrCnt",psrCnt);
		
		model.addAttribute("psrList",psrList);
		model.addAttribute("psList",psList);
				
		return "main.index";
	}

		
	@GetMapping("/main/template")
	   public String template() {
	      
	      return "main.template";
	   }
	   
	   //설   
	   @GetMapping("/member/login")
	   public String login() {
	      
	      return "member.login";
	   }
	   
	   //설
	   @PostMapping(value="/member/loginok")
	   public String loginok(String user, String id, String pass, HttpSession session, Model model) {
	      
		   String level = "";
	         String sseq = "";
	         
	         
	         if (user.equals("m")) {
	            MemberDTO dto = service.mLoginCheck(id, pass);
	            if (dto != null) {
	               level = dto.getMlevel();
	               sseq = dto.getMseq();
	            }
	            
	         } else if (user.equals("p")) {
	            PetSitterDTO dto = service.fLoginCheck(id, pass);
	            if (dto != null) {
	               level = dto.getPslevel();
	               sseq = dto.getPsseq();
	            }
	         } else {
	            AdminDTO dto = service.aLoginCheck(id, pass);
	            if (dto != null) {
	               level = dto.getAdlevel();
	               sseq = dto.getAdseq();
	            }
	         }
	                  
	         if (!level.equals("")) {
	            //로그인 성공
	            session.setAttribute("auth", id); 
	            session.setAttribute("lv", level);
	            session.setAttribute("sseq",sseq);
	            
	            return "redirect:/main/index";
	         } else {
	            //로그인 실패
	            return "member.login";
	         }
	         
	      }
	   
	   //설   
	   @GetMapping("/member/logout")
	   public String logout(HttpSession session) {
	      
	      session.removeAttribute("auth");
	      session.removeAttribute("lv");   
	      session.removeAttribute("sseq");
	      
	      return "redirect:/member/login";
	   }
	   
	 //설(마이페이지)1/21
	   @GetMapping("/member/mmypage")
	   public String mmypage(HttpSession session, Model model) {
	      
	      String mseq = (String)session.getAttribute("sseq");
	      
	      List<PetDTO> list = service.mPet(mseq);
	      List<CareServiceDTO> list2 = service.mCare(mseq);
	      List<StrayDTO> list3 = service.mStray(mseq);
	      
	      model.addAttribute("list", list);
	      model.addAttribute("list2", list2);
	      model.addAttribute("list3", list3);
	      
	      return "member.mmypage";
	   }
	   
	   //설(마이페이지-펫추가)
	   @PostMapping("/member/petaddok")
	   public String mmypageadd(HttpSession session, MultipartHttpServletRequest mreq) {
	      
	      String mseq = (String) session.getAttribute("sseq");
	      
	      int result = service.mPetadd(mseq, mreq);
	      
	      if (result == 1) {
	         return "redirect:/member/mmypage";
	      } else {
	         return "main.index";
	      }
	   }
	   
	   //설(마이페이지-펫수정)
	   @PostMapping("/member/peteditok")
	   public String mmypageedit(HttpSession session, MultipartHttpServletRequest mreq) {
	      
	      int result = service.mPetedit(mreq);
	      
	      if (result == 1) {
	         return "redirect:/member/mmypage";
	      } else {
	         return "main.index";
	      }
	   }
	   
	   //설(마이페이지-펫삭제)
	   @GetMapping("/member/petdelok")
	   public String mmypagedel(HttpSession session, HttpServletRequest req) {
	      
	      int result = service.mPetdel(req);
	      
	      if (result == 1) {
	         return "redirect:/member/mmypage";
	      } else {
	         return "main.index";
	      }
	   }
	   
	   //설(돌봄페이지 회원 1/25)
	   @GetMapping("/member/mdiary")
	   public String mdiary(HttpSession session, HttpServletRequest req, Model model) {
	      
	      String csseq = req.getParameter("csseq"); //돌봄 서비스 번호
	      String pname = req.getParameter("pets"); //반려동물 이름
	      
	      DiaryDTO dto = service.getmdiary(csseq);
	      
	      model.addAttribute("pname", pname);
	      model.addAttribute("dto", dto);
	      
	      return "member.mdiary";
	   }
	   
	   //설(돌봄페이지 취소 1/25)
	   @GetMapping("/member/mdiarydel")
	   public String mdiarydel(HttpSession session, HttpServletRequest req, Model model) {
	      
	      String csseq = req.getParameter("csseq"); //돌봄 서비스 번호
	      System.out.println(csseq);
	      int result = service.mdiarydel(csseq);
	   
	      if (result == 1) {
	         return "redirect:/member/mmypage";
	      } else {
	         return "main.index";
	      }
	   }
	   
	   //설(찾기 취소 1/26)
	   @GetMapping("/member/mstraydel")
	   public String mstraydel(HttpSession session, HttpServletRequest req, Model model) {
	      
	      String sseq = req.getParameter("sseq"); //찾기 번호
	      System.out.println(sseq);
	      int result = service.mstraydel(sseq);
	      
	      if (result == 1) {
	         return "redirect:/member/mmypage";
	      } else {
	         return "main.index";
	      }
	   }
	   
	   //설(회원탈퇴 1/26)
	   @GetMapping("/member/moutmember")
	   public String moutmember(HttpSession session, HttpServletRequest req) {
	      
	      String mseq = (String)session.getAttribute("sseq"); //회원 번호
	      
	      int result = service.moutmember(mseq);
	      
	      if (result == 1) {
	         return "redirect:/main/unresign"; //회원탈퇴페이지로 변경해야함
	      } else {
	         return "main.index";
	      }
	   }
	   
	   

	   
	//지현 부분 START
	   @GetMapping("/member/careserviceintro")
	   public String careserviceintro(Model model, HttpSession session) {

	      if (session.getAttribute("sseq") != null && session.getAttribute("sseq") != "") {

	         List<PetSitterDTO> plist = service.pslist();

	         model.addAttribute("plist", plist);

	         return "member.careserviceintro";

	      } else {

	         return "member.login";
	      }

	   } // careserviceintro

	   @GetMapping("/member/careservice")
	   public String careservice(Model model, String psseq, HttpSession session) {

	      String mseq = (String) session.getAttribute("sseq");

	      if (mseq != null && mseq != "") {

	         PetSitterDTO psdto = service.psinfo(psseq);
	         RegisterDTO rdto = service.rget(psseq);
	         List<PetDTO> pspetlist = service.pspetlist(psseq);
	         List<RDateDTO> rdlist = service.rdlist(psseq);
	         List<PetDTO> mpetlist = service.mpetlist(mseq);

	         String temp = rdto.getRcontent();
	         String rcontent = temp.replace("-", "<br><br>-");

	         rdto.setRcontent(rcontent);

	         model.addAttribute("mpetlist", mpetlist);
	         model.addAttribute("pspetlist", pspetlist);
	         model.addAttribute("rdlist", rdlist);
	         model.addAttribute("psdto", psdto);
	         model.addAttribute("rdto", rdto);

	         return "member.careservice";

	      } else {
	         return "member.login";
	      }

	   }// careservice

	   @PostMapping("/member/careserviceok")
	   public String careserviceok(String csstart, String csend, HttpSession session, String psseq, String scheck,
	         String mpseq1, String mpseq2, String mpseq3) {
	      
	      String maxcsseq = (service.getmaxcsseq() + 1) + "";

	      if (csend == null) {
	         csend = csstart;
	      }

	      if (mpseq2 == null) {
	         mpseq2 = "null";
	      }

	      if (mpseq3 == null) {
	         mpseq3 = "null";
	      }

	      CareServiceDTO csdto = new CareServiceDTO();

	      String sseq = "";
	      if (scheck.equals("basic")) {
	         sseq = "1";
	      } else if (scheck.equals("basicplus")) {
	         sseq = "2";
	      } else if (scheck.equals("premium")) {
	         sseq = "3";
	      }

	      String mseq = (String) session.getAttribute("sseq");
//	      (csseq, mseq, mpseq1, mpseq2, mpseq3, rseq, sseq, csstart, csend)

	      csdto.setCsseq(maxcsseq);
	      csdto.setMseq(mseq);
	      csdto.setRseq(psseq);
	      csdto.setSseq(sseq);
	      csdto.setCsstart(csstart);
	      csdto.setCsend(csend);
	      csdto.setMpseq1(mpseq1);
	      csdto.setMpseq2(mpseq2);
	      csdto.setMpseq3(mpseq3);

	      RDateDTO rddto = new RDateDTO();

	      // String maxrdseq = (service.getmaxrdseq()+1) + "";

	      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	      String[] sdate = csstart.split("-");
	      String[] edate = csend.split("-");

	      if (sdate[1].length() == 1) {
	         sdate[1] = "0" + sdate[1];
	      }

	      if (sdate[2].length() == 1) {
	         sdate[2] = "0" + sdate[2];
	      }

	      if (edate[1].length() == 1) {
	         edate[1] = "0" + edate[1];
	      }

	      if (edate[2].length() == 1) {
	         edate[2] = "0" + edate[2];
	      }

	      csstart = sdate[0] + "-" + sdate[1] + "-" + sdate[2];
	      csend = edate[0] + "-" + edate[1] + "-" + edate[2];

	      LocalDate startDate = LocalDate.parse(csstart);
	      LocalDate endDate = LocalDate.parse(csend);

	      // 두 날짜 사이의 날짜를 담은 배열
	      List<LocalDate> dlist = startDate.datesUntil(endDate).collect(Collectors.toList());

	      dlist.add(endDate);

	      // 해당 날짜 이용불가능으로 바꾸기
	      for (int i = 0; i < dlist.size(); i++) {

	         String rddate = (dlist.get(i)).toString();

	         rddto.setRseq(psseq);
	         rddto.setRddate(rddate);

	         int rdresult = service.setrdate(rddto);


	      }

	      int result = service.setcareservice(csdto);


	      return "member.careserviceapply";
	   }

	   // 지현 부분 END
		
	//동균 부분 START
		@GetMapping("/member/psreviewlist")
		public String psreviewlist(Model model) {

			List<PSReviewDTO> list = service.getPSReviewList();


			for (PSReviewDTO dto : list) {

				dto.setMid(service.getMemberId(dto.getMseq()));

				dto.setPsrregdate(dto.getPsrregdate().substring(0,10));

			}


			model.addAttribute("PSRList",list);

			return "member.psreviewlist";
		}

		@GetMapping("/member/psreview")
		public String psreview(Model model,String psrseq,String mseq) {

			
			service.viewCount(psrseq);

			PSReviewDTO rList = service.getPSReview(psrseq);

			CareServiceDTO sList = service.getRService(psrseq);

			PetSitterDTO pList = service.getRPetSiiter(psrseq);
			
			sList.setCsstart(sList.getCsstart().substring(0,10));
			sList.setCsend(sList.getCsend().substring(0,10));


			
			model.addAttribute("rList",rList);
			model.addAttribute("sList",sList);
			model.addAttribute("pList",pList);
			model.addAttribute("mseq",mseq);


			return "member.psreview";
		}


		@GetMapping("/member/psreviewadd") 
		public String psreviewadd(Model model,HttpSession session) {

			List<CareServiceDTO> cList = service.getCSSeq((String)session.getAttribute("sseq"));

			model.addAttribute("cList",cList);
			
			for (CareServiceDTO dto : cList) {

				dto.setCsstart(dto.getCsstart().substring(0,10));
				dto.setCsend(dto.getCsend().substring(0,10));

			}

			// 어떤 돌봄 신청에 대한 건지 그냥 하나로 하는게 아니라 고르게 하는걸로 바꿔서 다시 해보자 
			return "member.psreviewadd"; }



		@PostMapping("/member/psreviewaddok")
		public String psreviewaddok(HttpServletRequest req) {
			
			PSReviewDTO dto = new PSReviewDTO();
			
			
			//파일
			//파일전용 req 
					MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
					
					System.out.println(dto.getPsrseq());
					System.out.println(dto.getCsseq());
					System.out.println(dto.getMseq());
					System.out.println(dto.getPsrtitle());
					System.out.println(dto.getPsrcontent());
					System.out.println(dto.getPsrrate());
					System.out.println(dto.getPsrfile());
					
//					String subject = multi.getParameter("subject");
//					String content = multi.getParameter("content");
	//
//					bdto.setSubject(subject);
//					bdto.setContent(content);
					
					String csseq = multi.getParameter("csseq");
					String mseq = multi.getParameter("mseq");
					String psrtitle = multi.getParameter("psrtitle");
					String psrcontent = multi.getParameter("psrcontent");
					String psrrate = multi.getParameter("psrrate");
								
					dto.setCsseq(csseq);
					dto.setMseq(mseq);
					dto.setPsrtitle(psrtitle);
					dto.setPsrcontent(psrcontent);
					dto.setPsrrate(psrrate);
					
					//첨부 파일용
					MultipartFile psrfile =  multi.getFile("psrfile");
					
					// System.out.println(attach.getName()); // attach
					// System.out.println(attach.getOriginalFilename()); // 파일 원래명
					// System.out.println(attach.getContentType()); // 파일 자료형
					// System.out.println(attach.getSize()); // 크기
					
					// 파일 업로드 완료 > 파일이 어디 있는지 ?? > 임시 폴더에 저장 > 우리가 원하는 폴더로 이동
					String filename = psrfile.getOriginalFilename();
					String path = req.getRealPath("resources/files");
					
					System.out.println(path);
					
					// 파일명 중복 방지
					filename = getFileName(path,filename); 
					
					// 파일 이동
					File file2 = new File(path + "\\" + filename);
					
					try {
						
						//attach.renameTo(file2) 자바에서 했던 방식 
						psrfile.transferTo(file2); 
						
					} catch (Exception e) {
						// TODO: handle exception
					}
					
			dto.setPsrfile(filename);	
			
			int result = service.addPSReview(dto);

			//피드백
			if(result == 1){ 

			return "redirect:/member/psreviewlist";
			
			} else { 
				
			return "redirect:/member/psreviewadd";
			
			}

		}
		
		@GetMapping("/member/psreviewedit")
		public String psreviewedit(Model model,String psrseq,String csseq) {
			
			//model.addAttribute("psrseq",psrseq);
			
			PSReviewDTO rList = service.getPSReview(psrseq);
			
			model.addAttribute("psrseq",psrseq);
			model.addAttribute("rList",rList);
			model.addAttribute("csseq",csseq);
			
			return "member.psreviewedit";
		}
		
		@PostMapping("/member/psrevieweditok")
		public String psrevieweditok(HttpServletRequest req) {
			
			PSReviewDTO dto = new PSReviewDTO();
			
			
			//파일
			//파일전용 req 
					MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
									
//					String subject = multi.getParameter("subject");
//					String content = multi.getParameter("content");
	//
//					bdto.setSubject(subject);
//					bdto.setContent(content);
					
					String csseq = multi.getParameter("csseq");
					String mseq = multi.getParameter("mseq");
					String psrtitle = multi.getParameter("psrtitle");
					String psrcontent = multi.getParameter("psrcontent");
					String psrrate = multi.getParameter("psrrate");
					String psrseq = multi.getParameter("psrseq");
								
					dto.setPsrseq(psrseq);
					dto.setCsseq(csseq);
					dto.setMseq(mseq);
					dto.setPsrtitle(psrtitle);
					dto.setPsrcontent(psrcontent);
					dto.setPsrrate(psrrate);
					
					//첨부 파일용
					MultipartFile psrfile =  multi.getFile("psrfile");
					
					// System.out.println(attach.getName()); // attach
					// System.out.println(attach.getOriginalFilename()); // 파일 원래명
					// System.out.println(attach.getContentType()); // 파일 자료형
					// System.out.println(attach.getSize()); // 크기
					
					// 파일 업로드 완료 > 파일이 어디 있는지 ?? > 임시 폴더에 저장 > 우리가 원하는 폴더로 이동
					String filename = psrfile.getOriginalFilename();
					String path = req.getRealPath("resources/files");
					
					System.out.println(path);
					
					// 파일명 중복 방지
					filename = getFileName(path,filename); 
					
					// 파일 이동
					File file2 = new File(path + "\\" + filename);
					
					try {
						
						//attach.renameTo(file2) 자바에서 했던 방식 
						psrfile.transferTo(file2); 
						
					} catch (Exception e) {
						// TODO: handle exception
					}
					
			dto.setPsrfile(filename);	
			
			int result = service.editPSReview(dto);

			//피드백
			if(result == 1){ 

			return "redirect:/member/psreview?psrseq=" + psrseq + "&mseq=" + mseq;
			
			} else { 
				
			return "redirect:/main/psreviewlist";
			
			}
		}
		
		@GetMapping("/member/psrdeleteok")
		public String psrdeleteok(String psrseq,String mseq) {
			
			int result = service.psrdeleteok(psrseq);
			
			if(result == 1){ 

			return "redirect:/member/psreviewlist";
			
			} else { 
				
			return "redirect:/main/psreview?psrseq=" + psrseq + "&mseq=" + mseq;
			
			}
		}
			
		private String getFileName(String path, String filename) {

			// 저장 폴더내의 파일명을 중복하지 않게 만들기
			// path = "resources/files"
			// filename = "test.txt"

			// 중복되면 (n) 방식 , test(1).txt , test(2).txt
			int n = 1; // 인덱스 숫자
			int index = filename.lastIndexOf(".");

			String tempName = filename.substring(0,index);// "test"
			String tempExt = filename.substring(index); // .txt


			while (true) {
				File file = new File(path + "//" + filename);

				if(file.exists()) { // 파일이 이미 있다 > 중복 > 이름 변경
					filename = String.format("%s(%d)%s", tempName,n,tempExt);
					n++;
				} else { // 파일이 없다 > 파일명 그대로 사용

					return filename;
				}

			}
		}
		//동균 부분 END
		
		   //유찬 추가 ==========================
		   @PostMapping("/member/careserviceapply")
		   public String careserviceapply() {
		      
		      return "member.careserviceapply";
		   }
		   
		   @GetMapping("/main/registerok")
		   public String registerok() {
		      
		      return "main.registerok";
		   }
		   
		   @GetMapping("/main/unresign")
		   public String unresign() {
		      
		      return "main.unresign";
		   }
		   //유찬 끝 ============================
	
	
	
}
