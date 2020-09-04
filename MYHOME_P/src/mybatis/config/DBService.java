package mybatis.config;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * 1. MyBatis 는 모든 쿼리문(SQL)을 Mapper 에 저장한다.
 * 
 * 2. Mapper 에 접근해서 쿼리문을 실행하는 역할을 SqlSession 클래스가 담당한다.
 * 
 * 3. SqlSession 클래스를 사용하려면 다음 과정을 거친다.
 * 
 *    1) SqlSessionFactoryBuilder 를 통해서 SqlSessionFactory 를 만든다.
 *    2) SqlSessionFactory 를 통해서 SqlSession 을 만든다.
 * 
 * 4. DBService 클래스는 SqlSessionFactory 를 만들어서 리턴하는 역할이다.
 */

public class DBService {

	// SqlSessionFactory 는 singleton pattern 으로 생성해야 한다.
	
	// 필드
	private SqlSessionFactory factory;
	
	// 생성자 (factory 만드는 역할)
	private DBService() {
		try {
			String resource = "mybatis/config/sqlmap-config.xml";  // 패키지 경로와 파일명에 따라서 작성해야 한다.
			InputStream inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 생성자가 private 이므로 여기서 DBService() 를 new 해야 한다.
	private static DBService service = new DBService();
	
	// new DBService() 가 호출되면 SqlSessionFactory factory 가 생성된다.
	// 생성된 factory 를 호출할 수 있는 DBService service 객체를 리턴할 수 있는 getter 를 만든다.
	public static DBService getInstance() {
		return service;
	}
	
	// private SqlSessionFactory factory 를 외부에 리턴하는 getter 를 만든다.
	public SqlSessionFactory getFactory() {
		return factory;
	}
	
	// 정리
	// 외부에서는 다음 과정으로 factory 를 가져다 사용한다.
	// 1. DBService 객체를 생성한다.
	//    DBService.getInstance()
	// 2. DBService 객체를 이용해 getFactory() 를 호출한다.
	//    DBService.getInstance().getFactory()
	
}
