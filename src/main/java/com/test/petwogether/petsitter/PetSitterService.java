package com.test.petwogether.petsitter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.petwogether.PetDTO;
import com.test.petwogether.member.CareServiceDTO;

public interface PetSitterService {


   int regPetsitter(RegisterDTO dto);

   int addRDate(RDateDTO rddto);

   //영우 부분 시작
   List<PetDTO> pPet(String psseq);

   List<CareServiceDTO> pCare(String psseq);

   int pPetadd(String psseq, MultipartHttpServletRequest mreq);

   int pPetedit(MultipartHttpServletRequest mreq);

   int pPetdel(HttpServletRequest req);

   DiaryDTO getdiary(String csseq);

   int pdiarydel(String csseq);

   int poutpetsitter(String psseq);
   
   int pDiaryadd(HttpServletRequest req);
   // 영우 부분 끝

}