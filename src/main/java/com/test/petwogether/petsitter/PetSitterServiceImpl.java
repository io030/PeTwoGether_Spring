package com.test.petwogether.petsitter;

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
import com.test.petwogether.member.CareServiceDTO;

@Service
@Primary
public class PetSitterServiceImpl implements PetSitterService {

      @Autowired
      private PetSitterDAO psdao;

      @Override
      public int regPetsitter(RegisterDTO dto) {
         
         return psdao.regPetsitter(dto);
      }

      @Override
      public int addRDate(RDateDTO rddto) {
         
         return psdao.addRDate(rddto);
      }
      
      // 영우 부분 시작
      
      
      //영우
      @Override
      public List<PetDTO> pPet(String psseq) {

         List<PetDTO> list = psdao.pPet(psseq);
         
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

      @Override
      public List<CareServiceDTO> pCare(String psseq) {

         List<CareServiceDTO> list = psdao.pCare(psseq);
         
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

      @Override
      public int pPetadd(String psseq, MultipartHttpServletRequest mreq) {
         
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
         
         
         int result = psdao.petadd(dto);
         result = psdao.pspetadd(psseq);
         
         return result;
      }
      
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

      @Override
      public int pPetedit(MultipartHttpServletRequest mreq) {
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
         
         int result = psdao.petedit(dto);
         
         return result;
      }

      @Override
      public int pPetdel(HttpServletRequest req) {

         String pseq = req.getParameter("pseq");
         
         int result = psdao.petdel(pseq);
         
         return result;
      }

      @Override
      public DiaryDTO getdiary(String csseq) {
         
         DiaryDTO dto = new DiaryDTO();
         dto.setCsseq(csseq);
         
         return psdao.diary(dto);   
      }

      @Override
      public int pdiarydel(String csseq) {
         
         int result = psdao.pdiarydel(csseq);   
         System.out.println(result);
         return result;
      }

      @Override
      public int poutpetsitter(String psseq) {
         
         int result = psdao.poutpetsitter(psseq);   
         System.out.println(result);
         return result;
      }
      
      @Override
      public int pDiaryadd(HttpServletRequest req) {

         DiaryDTO dto = new DiaryDTO();
         
         dto.setCsseq(req.getParameter("csseq"));
         dto.setDtime(req.getParameter("walk"));
         dto.setDmeal(req.getParameter("meal"));
         dto.setDetc(req.getParameter("etc"));
         
         int result = psdao.setdiaryadd(dto);
         
         return result;
      }
      
      // 영우 부분 끝




      
}