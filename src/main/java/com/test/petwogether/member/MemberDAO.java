package com.test.petwogether.member;

import java.util.List;

import com.test.petwogether.PetDTO;
import com.test.petwogether.petsitter.DiaryDTO;
import com.test.petwogether.petsitter.PetSitterDTO;
import com.test.petwogether.petsitter.RDateDTO;

public interface MemberDAO {
	
	// 설화 부분 START
	
	MemberDTO mLoginCheck(MemberDTO dto);
	
	//설
	   List<PetDTO> mpet(String mseq);
	   //설
	   int petadd(PetDTO dto);
	   //설
	   int mpetadd(String mseq);
	   //설
	   int petedit(PetDTO dto);
	   //설
	   int petdel(String pseq);

	   //설
	   DiaryDTO gmdiary(DiaryDTO dto);
	   //설
	   List<CareServiceDTO> mCare(String mseq);
	   //설
	   int mdiarydel(String csseq);
	   //설
	   List<StrayDTO> mStray(String mseq);

	   //설
	   int mstraydel(String sseq);
	   //설
	   int moutmember(String mseq);
	
	// 설화 부분 END

	
	//지현 ==== START
	
	List<PetDTO> mpetlist(String mseq);

	int setcareservice(CareServiceDTO csdto);
	
	int getmaxcsseq();
	
	int setrdate(RDateDTO rddto);
	
	//지현 ==== END
	
	// 동균 부분 START
		List<PSReviewDTO> getPSReviewList();

		String getMemberId(String mseq);
		
		PSReviewDTO getPSReview(String psrseq);

		CareServiceDTO getRService(String psrseq);

		PetSitterDTO getRPetSiiter(String psrseq);

		int addPSReview(PSReviewDTO dto);

		List<CareServiceDTO> getCSSeq(String attribute);

		int editPSReview(PSReviewDTO dto);

		void viewCount(String psrseq);

		int psrdeleteok(String psrseq);

		List<PSReviewDTO> psreviewsearch(String word);

		int aCnt();

		int mCnt();

		int psCnt();

		int psrCnt();
		// 동균 부분 END
	
	
}