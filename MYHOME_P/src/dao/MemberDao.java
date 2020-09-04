package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDto;
import mybatis.config.DBService;

public class MemberDao {

	@SuppressWarnings("unused")
	private SqlSessionFactory factory;
	private MemberDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static MemberDao mDao = new MemberDao();
	public static MemberDao getInstance() {
		return mDao;
	}
	
	//DB 접근 method
	public MemberDto selectBymIdmPw(MemberDto mDto) {
		SqlSession ss = factory.openSession();
		MemberDto resultDto = ss.selectOne("mybatis.mapper.member.selectBymIdmPw",mDto);
		ss.close();
		return resultDto;
	}
	
	public MemberDto selectBymId(String mId) {
		SqlSession ss = factory.openSession();
		MemberDto resultDto = ss.selectOne("mybatis.mapper.member.selectBymId",mId);
		ss.close();
		return resultDto;
	}
	
	public MemberDto selectBymEmail(String mEmail) {
		SqlSession ss = factory.openSession();
		MemberDto resultDto = ss.selectOne("mybatis.mapper.member.selectBymEmail",mEmail);
		ss.close();
		return resultDto;
	}
	
	public MemberDto selectBymIdmPhone(MemberDto mDto) {
		SqlSession ss = factory.openSession();
		MemberDto resultDto = ss.selectOne("mybatis.mapper.member.selectBymIdmPhone",mDto);
		ss.close();
		return resultDto;
	}
	
	public int memberInsert(MemberDto mDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.member.memberInsert",mDto);
		if (result >0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int memberDelete(String mId) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete("mybatis.mapper.member.memberDelete",mId);
		if (result >0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int memberUpdateInfo(MemberDto mDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.member.memberUpdateInfo",mDto);
		if (result >0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public int memberUpdatePw(MemberDto mDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.member.memberUpdatePw",mDto);
		if (result >0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	
}
