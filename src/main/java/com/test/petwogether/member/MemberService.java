package com.test.petwogether.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.petwogether.PetDTO;
import com.test.petwogether.admin.AdminDTO;
import com.test.petwogether.petsitter.DiaryDTO;
import com.test.petwogether.petsitter.PetSitterDTO;
import com.test.petwogether.petsitter.RDateDTO;
import com.test.petwogether.petsitter.RegisterDTO;

public interface MemberService {
	// 설화 부분 START
	MemberDTO mLoginCheck(String id, String pass);

	PetSitterDTO fLoginCheck(String id, String pass);

	AdminDTO aLoginCheck(String id, String pass);
	
	//설
	   List<PetDTO> mPet(String mseq);
	   //설
	   int mPetadd(String mseq, MultipartHttpServletRequest mreq);
	   //설
	   int mPetedit(MultipartHttpServletRequest mreq);
	   //설
	   int mPetdel(HttpServletRequest req);

	   //설(돌봄일지조회-회원)
	   DiaryDTO getmdiary(String csseq);

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
	   
	// 지현 부분 START
	List<PetSitterDTO> pslist();

	PetSitterDTO psinfo(String psseq);

	RegisterDTO rget(String psseq);

	List<PetDTO> pspetlist(String psseq);

	List<RDateDTO> rdlist(String psseq);

	List<PetDTO> mpetlist(String mseq);

	int setcareservice(CareServiceDTO csdto);

	int getmaxcsseq();

	int setrdate(RDateDTO rddto);

	// 지현 부분 END

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

	int mCnt();

	int psCnt();

	int aCnt();

	int psrCnt();

	// 동균 부분 END

}
