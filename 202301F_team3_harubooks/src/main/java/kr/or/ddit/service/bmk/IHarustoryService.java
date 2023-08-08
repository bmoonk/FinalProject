package kr.or.ddit.service.bmk;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.bmk.BoardVO;
import kr.or.ddit.vo.bmk.ReplyVO;

public interface IHarustoryService {

	public List<BoardVO> boardList(BoardVO vo);

	public int storyInsert(BoardVO boardVO);

	public Map<String,Object> boardOne(BoardVO vo);

	public int updateHarustory(BoardVO boardVO);

	public String insertFeed(BoardVO bvo) throws IOException;

	public String deleteHarustory(BoardVO vo);

	public String likeCehck(BoardVO vo);

	public String replyInsert(ReplyVO vo);

	public List<ReplyVO> getReplyList(ReplyVO vo);

	public List<ReplyVO> getSubReplyList(ReplyVO vo);

	public String replyDelete(ReplyVO vo);

	public String updateApply(ReplyVO vo);

	public List<BoardVO> getMyStoryList(BoardVO ae_id);

	public List<BoardVO> getMyStoryListBell(String userId);

	public List<ReplyVO> boardBellCount(String board_no);
	
}