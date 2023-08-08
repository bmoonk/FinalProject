package kr.or.ddit.service.kmw;

import java.util.List;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.vo.kmw.BookInfoVO;
import kr.or.ddit.vo.kmw.CartVO;
import kr.or.ddit.vo.kmw.PaginationVO;

public interface BookService {


	int bookCount(PaginationVO<BookInfoVO> pagingVO);

	List<BookInfoVO> selectBookList(PaginationVO<BookInfoVO> pagingVO);

	BookInfoVO detailBook(BookInfoVO vo);

	List<String> kindBycategory(String ccg_b002);

	ResultStatus inputWishList(BookInfoVO vo);

	boolean existWisthList(BookInfoVO vo);

	boolean existCart(CartVO vo);

	ResultStatus inputCart(CartVO vo);

	List<BookInfoVO> cartList(String ae_id);

	int cartCnt(String ae_id);

	int cartDel(BookInfoVO vo);

	BookInfoVO selectBook(String book_no);

	int wishCnt(String ae_id);

	List<BookInfoVO> selectBookListAll(PaginationVO<BookInfoVO> pagingVO);

	int reviewCheck(BookInfoVO bookVO);

	int reviewCheck2(BookInfoVO bookVO);

	List<BookInfoVO> bestSeller();

	BookInfoVO bestBookInfo(String book_no);

	List<BookInfoVO> koreaBookList();

	List<BookInfoVO> abroadBookList();

	List<BookInfoVO> eBookList();

	List<BookInfoVO> searchCompareBook(String searchBook);

}
