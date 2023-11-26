package com.test.petwogether.petsitter;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.test.petwogether.PetDTO;
import com.test.petwogether.member.CareServiceDTO;

@Repository
@Primary
public class PetSitterDAOimpl implements PetSitterDAO {

	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public PetSitterDTO pLoginCheck(PetSitterDTO dto) {

		return this.sql.selectOne("petsitter.auth", dto);
	}

	// 지현 부분 START

	@Override
	public List<PetSitterDTO> pslist() {

		return sql.selectList("petsitter.list");
	}

	@Override
	public PetSitterDTO psinfo(String psseq) {

		return sql.selectOne("petsitter.info", psseq);
	}

	@Override
	public RegisterDTO rget(String psseq) {
		
		return sql.selectOne("petsitter.rinfo", psseq);
	}

	@Override
	public List<PetDTO> pspet(String psseq) {

		return sql.selectList("petsitter.pspet", psseq);
	}
	
	@Override
	public List<RDateDTO> rdlist(String psseq) {

		return sql.selectList("petsitter.rdlist", psseq);
	}
	
	// 지현 부분 END
	
	   //유찬 부분
	   @Override
	   public int regPetsitter(RegisterDTO dto) {
	      
	      return sql.insert("petsitter.regpetsitter", dto);
	   }

	   @Override
	   public int addRDate(RDateDTO rddto) {
	      
	      return sql.insert("petsitter.addrdate", rddto);
	   }
	   
	   //유찬부분끝
	   
	   // 영우 부분 시작
	   
	   @Override
	   public List<PetDTO> pPet(String psseq) {
	      
	      return this.sql.selectList("petsitter.ppet", psseq);
	   }

	   @Override
	   public List<CareServiceDTO> pCare(String psseq) {

	      return this.sql.selectList("petsitter.pcare", psseq);
	   }

	   @Override
	   public int petadd(PetDTO dto) {

	      if (dto.getPfile() == null) {
	         return this.sql.insert("petsitter.petaddnf", dto);
	      } 
	      
	      return this.sql.insert("petsitter.petadd", dto);
	   }

	   @Override
	   public int pspetadd(String psseq) {

	      return this.sql.insert("petsitter.pspetadd", psseq);
	   }

	   @Override
	   public int petedit(PetDTO dto) {
	      
	      return this.sql.update("petsitter.petedit", dto);
	   }

	   @Override
	   public int petdel(String pseq) {
	      
	      return this.sql.update("petsitter.petdel", pseq);
	   }

	   @Override
	   public DiaryDTO diary(DiaryDTO dto) {

	      return this.sql.selectOne("petsitter.diary", dto);
	   }

	   @Override
	   public int pdiarydel(String csseq) {
	      
	      return this.sql.delete("petsitter.pdiarydel", csseq);
	   }

	   @Override
	   public int poutpetsitter(String psseq) {

	      return this.sql.update("petsitter.poutpetsitter", psseq);
	   }
	   
	   @Override
	   public int setdiaryadd(DiaryDTO dto) {
	      
	      if (dto.getDetc() == null) {
	         return this.sql.insert("petsitter.diaryaddne", dto);
	      }
	      return this.sql.insert("petsitter.diaryadd", dto);
	   }
	   
	   // 영우 부분 끝
	
	

}
