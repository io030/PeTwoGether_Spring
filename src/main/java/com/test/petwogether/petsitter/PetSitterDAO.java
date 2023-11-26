package com.test.petwogether.petsitter;

import java.util.List;

import com.test.petwogether.PetDTO;
import com.test.petwogether.member.CareServiceDTO;

public interface PetSitterDAO {

	List<PetSitterDTO> pslist();


	PetSitterDTO pLoginCheck(PetSitterDTO dto);

	//지현 부분 START
	PetSitterDTO psinfo(String psseq);

	RegisterDTO rget(String psseq);

	List<PetDTO> pspet(String psseq);

	List<RDateDTO> rdlist(String psseq);

	//지현 부분 END

	//유찬 부분
	int regPetsitter(RegisterDTO dto);


	int addRDate(RDateDTO rddto);
	//유찬 부분 끝
	
	// 영우 부분 시작
	
		List<PetDTO> pPet(String psseq);

	   List<CareServiceDTO> pCare(String psseq);

	   int petadd(PetDTO dto);

	   int pspetadd(String psseq);

	   int petedit(PetDTO dto);

	   int petdel(String pseq);

	   DiaryDTO diary(DiaryDTO dto);

	   int pdiarydel(String csseq);

	   int poutpetsitter(String psseq);

	   int setdiaryadd(DiaryDTO dto);

	// 영우 부분 끝
}
