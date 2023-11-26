package com.test.petwogether.petsitter;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import com.test.petwogether.member.CareServiceDTO;

@Controller
public class PetSitterController {

   @Autowired
   private PetSitterService service;
   
   //유찬 시작 ================================================== 
   //펫시터 등록
   @GetMapping("/petsitter/regpetsitter")
   public String regpetsitter() {
      
      
      return "petsitter.regpetsitter";

   }
   
   @GetMapping("/petsitter/okregpetsitter")
   public String okregpetsitter() {
      
      
      return "petsitter.okregpetsitter";

   }
   
   
   @PostMapping("petsitter/regpetsitterok")
   public String regpetsitterok(String csstart, String csend, HttpServletRequest req, HttpSession session) {
      
      RegisterDTO dto = new RegisterDTO();
      
      //파일
      //파일전용 req 
            MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
            
            String psseq = multi.getParameter("psseq");
            String rtitle = multi.getParameter("rtitle");
            String rcontent = multi.getParameter("rcontent");
                     
//            System.out.println(psseq);
//            System.out.println(rtitle);
//            System.out.println(rcontent);
            
            dto.setPsseq(psseq);
            dto.setRtitle(rtitle);
            dto.setRcontent(rcontent);
            
            //첨부 파일용
            MultipartFile rfile =  multi.getFile("rfile");
            
            // System.out.println(attach.getName()); // attach
            // System.out.println(attach.getOriginalFilename()); // 파일 원래명
            // System.out.println(attach.getContentType()); // 파일 자료형
            // System.out.println(attach.getSize()); // 크기
            
            // 파일 업로드 완료 > 파일이 어디 있는지 ?? > 임시 폴더에 저장 > 우리가 원하는 폴더로 이동
            String filename = rfile.getOriginalFilename();
            String path = req.getRealPath("resources/files");
            
            System.out.println(path);
            
            // 파일명 중복 방지
            filename = getFileName(path,filename); 
            
            // 파일 이동
            File file2 = new File(path + "\\" + filename);
            
            try {
               
               //attach.renameTo(file2) 자바에서 했던 방식 
               rfile.transferTo(file2); 
               
            } catch (Exception e) {
               // TODO: handle exception
            }
            
      dto.setRfile(filename);   
      
      int result1 = service.regPetsitter(dto); //register 등록
      

      //피드백
      if(result1 == 1){ 
         
         
         //register 테이블에 등록이 되야 rseq를 얻을 수 있음
         //그래서 result1이 성공하고 난 후에 
         //rdate 테이블 등록이 되어야함
         
         RDateDTO rddto = new RDateDTO();
         
         String rseq = req.getParameter("rseq");
         
         System.out.println(rseq);
         
         rddto.setRseq(rseq);
         
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
         
         String[] sdate = csstart.split("-");
         String[] edate = csend.split("-");
         
         if(sdate[1].length() == 1) {
            sdate[1] = "0" + sdate[1];
         }

         if(sdate[2].length() == 1) {
            sdate[2] = "0" + sdate[2];
         }

         if(edate[1].length() == 1) {
            edate[1] = "0" + edate[1];
         }

         if(edate[2].length() == 1) {
            edate[2] = "0" + edate[2];
         }
         
         csstart = sdate[0] + "-" + sdate[1] + "-" + sdate[2];
         csend = edate[0] + "-" + edate[1] + "-" + edate[2];
         
         LocalDate startDate = LocalDate.parse(csstart);
         LocalDate endDate = LocalDate.parse(csend);
         
         //두 날짜 사이의 날짜를 담은 배열
         List<LocalDate> dlist = startDate.datesUntil(endDate).collect(Collectors.toList());
      
         dlist.add(endDate);
         
         //해당 날짜 이용불가능으로 바꾸기
         for (int i=0; i<dlist.size(); i++) {
            
            String rddate = (dlist.get(i)).toString();

            rddto.setRseq(psseq);
            rddto.setRddate(rddate);
            
            int rdresult = service.addRDate(rddto);
         
            
            
         }
         
         return "redirect:/petsitter/okregpetsitter";
         
      } else { 
         
      return "redirect:/petsitter/regpetsitter";
      
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
   
   //유찬끝==============
   
   // 영우 부분 시작
   
   @GetMapping("/petsitter/pmypage")
   public String pmypage(HttpSession session, Model model) {
      
      String psseq = (String)session.getAttribute("sseq");
      
      List<PetDTO> list = service.pPet(psseq);
      List<CareServiceDTO> list2 = service.pCare(psseq);
      
      model.addAttribute("list", list);
      model.addAttribute("list2", list2);
      
      return "petsitter.pmypage";
   }
   
   //펫시터 마이페이지-펫추가
      @PostMapping("/petsitter/petaddok")
      public String petaddok(HttpSession session, MultipartHttpServletRequest mreq) {
         
         String psseq = (String) session.getAttribute("sseq");
         
         int result = service.pPetadd(psseq, mreq);
         
         if (result == 1) {
            return "redirect:/petsitter/pmypage";
         } else {
            return "main.index";
         }
      }
      //펫시터 마이페이지-펫수정
      @PostMapping("/petsitter/peteditok")
      public String peteditok(HttpSession session, MultipartHttpServletRequest mreq) {
         
         int result = service.pPetedit(mreq);
         
         if (result == 1) {
            return "redirect:/petsitter/pmypage";
         } else {
            return "main.index";
         }
      }
      //펫시터 마이페이지-펫삭제
      @GetMapping("/petsitter/petdelok")
      public String petdelok(HttpSession session, HttpServletRequest req) {
         
         int result = service.pPetdel(req);
         
         if (result == 1) {
            return "redirect:/petsitter/pmypage";
         } else {
            return "main.index";
         }
      }
      
      //펫시터 돌봄페이지 취소
      @GetMapping("/petsitter/pdiarydel")
      public String mdiarydel(HttpSession session, HttpServletRequest req, Model model) {
         
         String csseq = req.getParameter("csseq"); //돌봄 서비스 번호
         System.out.println(csseq);
         int result = service.pdiarydel(csseq);
       
         if (result == 1) {
            return "redirect:/petsitter/pmypage";
         } else {
            return "main.index";
         }
      }
      
      //펫시터 회원탈퇴
      @GetMapping("/petsitter/poutpetsitter")
      public String poutpetsitter(HttpSession session, HttpServletRequest req) {
         
         String psseq = (String)session.getAttribute("sseq"); //회원 번호
         
         int result = service.poutpetsitter(psseq);
         
         if (result == 1) {
            return "redirect:/member/login"; //회원탈퇴페이지로 변경해야함
         } else {
            return "main.index";
         }
      }
      
      @GetMapping("/petsitter/pdiary")
      public String diary(Model model,HttpSession session, HttpServletRequest req) {
         
         String csseq = req.getParameter("csseq"); //돌봄 서비스 번호
         String pname = req.getParameter("pets"); //반려동물 이름
         DiaryDTO dto = service.getdiary(csseq);
         
         model.addAttribute("csseq",csseq);
         model.addAttribute("pname",pname);
         
         return "petsitter.pdiary";
      }
      
      @PostMapping("/petsitter/pdiaryok")
      public String diaryok(HttpSession session, HttpServletRequest req) {
         
         int result = service.pDiaryadd(req);
         
         if (result == 1) {   
            return "redirect:/petsitter/pmypage";
         } else {
            return "main.index";
         }
      }
      
   
   // 영우 부분 끝
   
}   