package kr.or.ddit.mapper.omn.books;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.omn.MngBooksVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.NewBookRequestVO;

@Mapper
public interface MngBookRequestMapper {
	public NewBookRequestVO requestList(String nbr_no);
	public int requestCount(MngPaginationInfoVO<NewBookRequestVO> pagingVO);
	public int requestAllCount(String nbr_no);
	public List<NewBookRequestVO> selectRequestList(MngPaginationInfoVO<NewBookRequestVO> pagingVO);
	public int booksInsert(MngBooksVO mngBooksVO);
	public int paperBookInsert(MngBooksVO mngBooksVO);
	public int ebookInsert(MngBooksVO mngBooksVO);
	public void requestApproval(NewBookRequestVO newBookRequestVO);
	public int requestRefuse(NewBookRequestVO newBookRequestVO);
	public int countBookReq();
}
