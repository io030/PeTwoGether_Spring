package com.test.petwogether.member;

import java.io.File;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.petwogether.PetDTO;
import com.test.petwogether.admin.AdminDAO;
import com.test.petwogether.admin.AdminDTO;
import com.test.petwogether.petsitter.DiaryDTO;
import com.test.petwogether.petsitter.PetSitterDAO;
import com.test.petwogether.petsitter.PetSitterDTO;
import com.test.petwogether.petsitter.RDateDTO;
import com.test.petwogether.petsitter.RegisterDTO;

@Service
@Primary
public class MemberServiceImpl implements MemberService {
	
	// 설화 부분 START
	@Autowired
	private MemberDAO mdao;

	@Autowired
	private PetSitterDAO pdao;

	@Autowired
	private AdminDAO ddao;

	@Override
	public MemberDTO mLoginCheck(String id, String pass) {

		MemberDTO dto = new MemberDTO();
		dto.setMid(id);
		dto.setMpw(pass);

		return mdao.mLoginCheck(dto);

	}

	@Override
	public PetSitterDTO fLoginCheck(String id, String pass) {

		PetSitterDTO dto = new PetSitterDTO();
		dto.setPsid(id);
		dto.setPspw(pass);

		return pdao.pLoginCheck(dto);
	}

	@Override
	public AdminDTO aLoginCheck(String id, String pass) {

		AdminDTO dto = new AdminDTO();
		dto.setAdid(id);
		dto.setAdpw(pass);

		return ddao.aLoginCheck(dto);
	}
	
	//설
	   @Override
	   public List<PetDTO> mPet(String mseq) {
	      
	      List<PetDTO> list = mdao.mpet(mseq);
	      
	      for (PetDTO dto : list) {
	         String pgender = dto.getPgender();
	         pgender = pgender.equals("m") ? "남" : "여";
	         dto.setPgender(pgender);
	         
	         String pfile = dto.getPfile();
	         System.out.println(pfile);
	         pfile = pfile == null ? "default.png" : pfile;
	         dto.setPfile(pfile);
	      }
	      return list;
	   }

	   //설
	   @Override
	   public int mPetadd(String mseq, MultipartHttpServletRequest mreq) {
	      
	      PetDTO dto = new PetDTO();
	      
	      dto.setPname(mreq.getParameter("name"));
	      dto.setPgender(mreq.getParameter("gender").equals("남")? "m" : "f");
	      dto.setPage(mreq.getParameter("age"));
	      dto.setPsize(mreq.getParameter("weight"));
	      dto.setPtype(mreq.getParameter("type"));
	      dto.setPbreed(mreq.getParameter("kind"));
	      
	      MultipartFile file = mreq.getFile("file");
	      String filename = file.getOriginalFilename();
	      
	      String path = mreq.getRealPath("resources/images/pet");

	      System.out.println(path);
	      
	      if(!file.isEmpty()) {
	         String file1 = getFileName(path, filename);

	         try {
	            file.transferTo(new File(path + "\\" + file1));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         dto.setPfile(file1);
	      }
	      
	      
	      int result = mdao.petadd(dto);
	      result = mdao.mpetadd(mseq);
	      
	      return result;
	   }

	   //설
	   private String getFileName(String path, String filename) {
	      int n = 1;
	      int index = filename.lastIndexOf(".");
	      
	      String tempName = filename.substring(0, index); 
	      String tempExt = filename.substring(index); 
	      
	      while (true) { 
	         
	         File file = new File(path + "\\" + filename);
	         
	         if (file.exists()) { 
	            
	            filename = String.format("%s_%d%s", tempName, n, tempExt);
	            n++;   
	         } else {
	            return filename;
	         }
	         
	      }
	   }

	   //설
	   @Override
	   public int mPetedit(MultipartHttpServletRequest mreq) {
	      PetDTO dto = new PetDTO();
	      
	      dto.setPseq(mreq.getParameter("pseq"));
	      dto.setPname(mreq.getParameter("name"));
	      dto.setPgender(mreq.getParameter("gender").equals("남")? "m" : "f");
	      dto.setPage(mreq.getParameter("age"));
	      dto.setPsize(mreq.getParameter("weight"));
	      dto.setPtype(mreq.getParameter("type"));
	      dto.setPbreed(mreq.getParameter("kind"));
	      
	      MultipartFile file = mreq.getFile("file");
	      String filename = file.getOriginalFilename();
	      
	      String path = mreq.getRealPath("resources/images/pet");

	      System.out.println(path);
	      
	      if(!file.isEmpty()) {
	         String file1 = getFileName(path, filename);

	         try {
	            file.transferTo(new File(path + "\\" + file1));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         dto.setPfile(file1);
	      } 
	      
	      int result = mdao.petedit(dto);
	      
	      return result;
	   }

	   //설
	   @Override
	   public int mPetdel(HttpServletRequest req) {

	      String pseq = req.getParameter("pseq");
	      
	      int result = mdao.petdel(pseq);
	      
	      return result;
	   }

	   //설 회원 돌봄서비스
	   @Override
	   public DiaryDTO getmdiary(String csseq) {
	      
	      DiaryDTO dto = new DiaryDTO();
	      dto.setCsseq(csseq);
	      
	      return mdao.gmdiary(dto);   
	   }

	   //설
	   @Override
	   public List<CareServiceDTO> mCare(String mseq) {
	      
	      List<CareServiceDTO> list = mdao.mCare(mseq);
	      
	      for (CareServiceDTO dto : list) {
	         
	         String csstart = dto.getCsstart();
	         String csend = dto.getCsend();
	         String state = "";
	         csstart = csstart.substring(0, 10);
	         csend = csend.substring(0, 10);
	         
	         dto.setCsstart(csstart);
	         dto.setCsend(csend);
	         
	         LocalDate start = LocalDate.parse(csstart);
	         LocalDate end = LocalDate.parse(csend);
	         LocalDate sysdate = LocalDate.now();
	         
	         if (sysdate.isBefore(start)) { //시작날짜보다 작을경우 > 이용예정
	            state="w";
	         } else { //현재날짜가 시작날짜보다 같거나 클경우
	            if (sysdate.isAfter(end)){ // 현재날짜가 종료날짜보다 큰 경우 > 이용 완료
	               state="x";
	            } else { //현재날짜가 시작날짜보다 같거나 크고 종료날짜보다 작거나 같은경우 > 진행중
	               state="o";
	            }
	            
	         }
	         
	         dto.setDstate(state);
	         
	         System.out.println(state);
	         
	         String pname1 = dto.getPname1();
	         String pname2 = dto.getPname2();
	         String pname3 = dto.getPname3();
	         String pets = pname1;
	         
	         if (pname2 != null) {
	            pets +=  " / " + pname2;
	         }
	         
	         if (pname3 != null) {
	            pets +=  " / " + pname3;
	         } 
	         dto.setPets(pets);
	      }
	      return list;
	   }

	   //설
	   @Override
	   public int mdiarydel(String csseq) {
	      
	      int result = mdao.mdiarydel(csseq);   
	      System.out.println(result);
	      return result;
	   }

	   //설
	   @Override
	   public List<StrayDTO> mStray(String mseq) {
	      
	      List<StrayDTO> list = mdao.mStray(mseq);
	      
	      for (StrayDTO dto : list) {
	         String stitle = dto.getStitle();
	         
	         if (stitle.length() > 25) {
	            stitle = stitle.substring(0, 25) + "..";
	            dto.setStitle(stitle);
	         }
	         
	      }
	      return list;
	   }

	   //설
	   @Override
	   public int mstraydel(String sseq) {
	      
	      int result = mdao.mstraydel(sseq);   
	      System.out.println(result);
	      return result;
	   }
	   
	   //설
	   @Override
	   public int moutmember(String mseq) {
	      
	      int result = mdao.moutmember(mseq);   
	      System.out.println(result);
	      return result;
	   }

	// 설화 부분 END

	// 지현 부분 START
	@Override
	public List<PetSitterDTO> pslist() {

		return pdao.pslist();
	}

	@Override
	public PetSitterDTO psinfo(String psseq) {

		return pdao.psinfo(psseq);
	}

	@Override
	public RegisterDTO rget(String psseq) {

		return pdao.rget(psseq);
	}

	@Override
	public List<PetDTO> pspetlist(String psseq) {

		return pdao.pspet(psseq);
	}

	@Override
	public List<RDateDTO> rdlist(String psseq) {

		return pdao.rdlist(psseq);
	}

	@Override
	public List<PetDTO> mpetlist(String mseq) {

		return mdao.mpetlist(mseq);
	}

	@Override
	public int setcareservice(CareServiceDTO csdto) {

		return mdao.setcareservice(csdto);
	}

	@Override
	public int getmaxcsseq() {

		return mdao.getmaxcsseq();
	}
	
	@Override
	public int setrdate(RDateDTO rddto) {
		
		return mdao.setrdate(rddto);
	}
	
	// 지현 부분 END
	
	//동균 부분 START
		@Override
		public List<PSReviewDTO> getPSReviewList() {
			
			return mdao.getPSReviewList();
		}
		
		@Override
		public String getMemberId(String mseq) {
			
			return mdao.getMemberId(mseq);
		}
		
		@Override
		public PSReviewDTO getPSReview(String psrseq) {
			
			return mdao.getPSReview(psrseq);
		}
		
		@Override
		public CareServiceDTO getRService(String psrseq) {
			
			return mdao.getRService(psrseq);
		}
		
		@Override
		public PetSitterDTO getRPetSiiter(String psrseq) {
			
			return mdao.getRPetSiiter(psrseq);
		}
		
		@Override
		public int addPSReview(PSReviewDTO dto) {
			
			return mdao.addPSReview(dto);
		}
		
		@Override
		public List<CareServiceDTO> getCSSeq(String attribute) {
			
			return mdao.getCSSeq(attribute);
		}
		
		@Override
		public int editPSReview(PSReviewDTO dto) {
			
			return mdao.editPSReview(dto);
		}
		
		@Override
		public void viewCount(String psrseq) {
			
			mdao.viewCount(psrseq);
			
		}
		
		@Override
		public int psrdeleteok(String psrseq) {
			
			return mdao.psrdeleteok(psrseq);
		}
		
		@Override
		public List<PSReviewDTO> psreviewsearch(String word) {
			
			return mdao.psreviewsearch(word);
		}
		
		@Override
		public int aCnt() {
			
			return mdao.aCnt();
		}
		
		@Override
		public int mCnt() {
			
			return mdao.mCnt();
		}
		
		@Override
		public int psCnt() {
			
			return mdao.psCnt();
		}
		
		@Override
		public int psrCnt() {
			
			return mdao.psrCnt();
		}
		//동균 부분 END	

}
