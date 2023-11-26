package com.test.petwogether.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.test.petwogether.PetDTO;
import com.test.petwogether.petsitter.DiaryDTO;
import com.test.petwogether.petsitter.PetSitterDTO;
import com.test.petwogether.petsitter.RDateDTO;

@Repository
@Primary
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	// 설화 부분 START
	@Override
	public MemberDTO mLoginCheck(MemberDTO dto) {

		return this.sql.selectOne("member.auth", dto);
	}
	
	//설
	   @Override
	   public List<PetDTO> mpet(String mseq) {
	   
	      return this.sql.selectList("member.mpet", mseq);
	   }
	   //설
	   @Override
	   public int petadd(PetDTO dto) {
	      
	      if (dto.getPfile() == null) {
	         return this.sql.insert("member.petaddnf", dto);
	      } 
	      
	      return this.sql.insert("member.petadd", dto);
	   }

	   //설
	   @Override
	   public int mpetadd(String mseq) {
	      
	      return this.sql.insert("member.mpetadd", mseq);
	   }
	   
	   //설
	   @Override
	   public int petedit(PetDTO dto) {
	      
	      return this.sql.update("member.petedit", dto);
	   }

	   //설
	   @Override
	   public int petdel(String pseq) {
	      
	      return this.sql.update("member.petdel", pseq);
	   }

	   //설
	   @Override
	   public DiaryDTO gmdiary(DiaryDTO dto) {
	      
	      return this.sql.selectOne("member.gmdiary", dto);
	   }

	   //설
	   @Override
	   public List<CareServiceDTO> mCare(String mseq) {
	      
	      return this.sql.selectList("member.mcare", mseq);
	   }

	   //설
	   @Override
	   public int mdiarydel(String csseq) {
	      
	      return this.sql.delete("member.mdiarydel", csseq);
	   }

	   //설
	   @Override
	   public List<StrayDTO> mStray(String mseq) {
	      
	      return this.sql.selectList("member.mstray", mseq);
	   }

	   //설
	   @Override
	   public int mstraydel(String sseq) {
	      
	      return this.sql.delete("member.mstraydel", sseq);
	   }

	   //설
	   @Override
	   public int moutmember(String mseq) {
	      
	      return this.sql.update("member.moutmember", mseq);
	   }
	
	// 설화 부분 END
	
	// 지현 ==== START

	   @Override
	   public List<PetDTO> mpetlist(String mseq) {

	      int memberseq = Integer.parseInt(mseq);

	      return sql.selectList("member.mpetlist", memberseq);
	   }

	   @Override
	   public int setcareservice(CareServiceDTO csdto) {

	      return sql.insert("member.setcs", csdto);
	   }


	   public int getmaxcsseq() {

	      return sql.selectOne("member.getcsseq");
	   }

	   public int setrdate(RDateDTO rddto) {
	      
	      return sql.update("petsitter.setrdate", rddto);
	   }
	   
	// 지현 ==== END
	
	//동균 부분 START
		@Override
		public List<PSReviewDTO> getPSReviewList() {
			
			return sql.selectList("member.getPSReviewList");
		}
		
		@Override
		public String getMemberId(String mseq) {
			
			return sql.selectOne("member.getMemberId",mseq);
		}
		
		@Override
		public PSReviewDTO getPSReview(String psrseq) {
			
			return sql.selectOne("member.getPSReview",psrseq);
		}
		
		@Override
		public CareServiceDTO getRService(String psrseq) {
			
			return sql.selectOne("member.getRService",psrseq);
		}
		
		@Override
		public PetSitterDTO getRPetSiiter(String psrseq) {
			
			return sql.selectOne("member.getRPetSiiter",psrseq);
		}
		
		@Override
		public List<CareServiceDTO> getCSSeq(String attribute) {
			
			return sql.selectList("member.getCSSeq",attribute);
		}
		
		@Override
		public int addPSReview(PSReviewDTO dto) {
			
			return sql.insert("member.addPSReview",dto);
		}
		
		@Override
		public int editPSReview(PSReviewDTO dto) {
			// TODO Auto-generated method stub
			return sql.update("member.editPSReview",dto);
		}
		
		@Override
		public void viewCount(String psrseq) {
			
			sql.update("member.viewCount",psrseq);
		}
		
		@Override
		public int psrdeleteok(String psrseq) {
			
			return sql.delete("member.psrdeleteok",psrseq);
		}
		
		@Override
		public List<PSReviewDTO> psreviewsearch(String word) {
			
			return sql.selectList("member.psreviewsearch",word);
		}
			
		@Override
		public int aCnt() {
			// TODO Auto-generated method stub
			return sql.selectOne("member.aCnt");
		}
		
		@Override
		public int mCnt() {
			// TODO Auto-generated method stub
			return sql.selectOne("member.mCnt");
		}
		
		@Override
		public int psCnt() {
			// TODO Auto-generated method stub
			return sql.selectOne("member.psCnt");
		}
		
		@Override
		public int psrCnt() {
			// TODO Auto-generated method stub
			return sql.selectOne("member.psrCnt");
		}
		//동균 부분 END

}