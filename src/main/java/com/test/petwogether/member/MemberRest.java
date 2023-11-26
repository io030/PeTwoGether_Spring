package com.test.petwogether.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberRest {

	@Autowired
	private MemberService service;
	
	@GetMapping("/member/psreviewsearch")
	@ResponseBody 
	public List<PSReviewDTO> list(String word){
		
		
		List<PSReviewDTO> rsList = service.psreviewsearch(word);
		
		for (PSReviewDTO dto : rsList) {

			dto.setMid(service.getMemberId(dto.getMseq()));

			dto.setPsrregdate(dto.getPsrregdate().substring(0,10));

		}
		
		
		return rsList;
	}
}
