package kr.or.ddit.mapper.odh;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.kmw.BookInfoVO;
import kr.or.ddit.vo.kmw.CartVO;

public interface wishListMapper {

	public List<BookInfoVO> selectWishList(String userId);

	public int deleteList(@Param("ae_id") String id, @Param("book_no") String bookNo);

	public int delete(@Param("book_no") String book_no, @Param("ae_id")String id);

	public int existCart(CartVO vo);

	public int inputCart(CartVO vo);

	public int insert(CartVO vo);

}
