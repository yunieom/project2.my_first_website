package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardDto;
import mybatis.config.DBService;

public class BoardDao {
	
	private SqlSessionFactory factory;
	
	private BoardDao( ) {
		factory = DBService.getInstance().getFactory();
	}
	
	private static BoardDao bDao = new BoardDao();
	public static BoardDao getInstance() {
		return bDao;
	}
	
	// access to DB
	public List<BoardDto> selectBoardList(Map<String, Integer> map) {
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.selectBoardList", map);
		ss.close();
		return list;
	
	}
	
	// xml->Dao
	public int selectBoardCount() {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.board.selectBoardCount");
		ss.close();
		return totalRecord;
	}
	public int boardInsert(BoardDto bDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.board.boardInsert", bDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public BoardDto selectBybNo(int bNo) {
		SqlSession ss = factory.openSession();
		BoardDto bDto = ss.selectOne("mybatis.mapper.board.selectBybNo", bNo);
		ss.close();
		return bDto;
	}
	
	public int boardUpdatebHit (int bNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.boardUpdatebHit", bNo);
		if (result > 0 ) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public int replyInsert(BoardDto rDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.board.replyInsert", rDto);
		if (result>0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public int replyUpdatebGroupOrd(BoardDto bDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.replyUpdatebGroupOrd", bDto);
		if (result>0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int boardDelete(int bNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.boardDelete", bNo);
		if (result>0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public List<BoardDto> selectQueryBoardList(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.selectQueryBoardList",map);
		ss.close();
		return list;
	}
	public int selectQueryBoardCount(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		int totalQueryRecord = ss.selectOne("mybatis.mapper.board.selectQueryBoardCount",map);
		ss.close();
		return totalQueryRecord;
	}
	public List<BoardDto> selectMyBoardList(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.selectMyBoardList",map);
		ss.close();
		return list;
	}
	public int selectMyBoardCount(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		int totalQueryRecord = ss.selectOne("mybatis.mapper.board.selectMyBoardCount",map);
		ss.close();
		return totalQueryRecord;
	}
	
}
