package dbPackage;
import java.sql.*;

/**
 * 
 * @author Hyun Wook Kim
 * Description : 데이터베이스와 커넥션을 만들고 쿼리들을 실행하는 메인
 */
public class DBConnection {
	private String DB_URL;
	private Connection con;
	static Statement stmt;
	public DBConnection() {
		DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			con = DriverManager.getConnection(DB_URL, /*DatabaseID*/, /*DatabasePassword*/);
			stmt = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public Connection getCon() {
		return con;
	}
	public Statement getStmt() {
		return stmt;
	}
	public static void dropAllTable(Statement stmt) {
		try {
			stmt.execute("DROP TABLE 지휘관");
			stmt.execute("COMMIT");
			System.out.println("지휘관 테이블 삭제 완료");
			stmt.execute("DROP TABLE 마물군단");
			stmt.execute("COMMIT");
			System.out.println("마물군단 테이블 삭제 완료");
			stmt.execute("DROP TABLE 마물장군");
			stmt.execute("COMMIT");
			System.out.println("마물장군 테이블 삭제 완료");
			stmt.execute("DROP TABLE 아이템");
			stmt.execute("COMMIT");
			System.out.println("아이템 테이블 삭제 완료");
			stmt.execute("DROP TABLE 용사");
			stmt.execute("COMMIT");
			System.out.println("용사 테이블 삭제 완료");
			stmt.execute("DROP TABLE 종족");
			stmt.execute("COMMIT");
			System.out.println("종족 테이블 삭제 완료");
			stmt.execute("DROP TABLE 스킬");
			stmt.execute("COMMIT");
			System.out.println("스킬 테이블 삭제 완료");
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {	
		try{
			new DBConnection();
//			dropAllTable(stmt);		// drop all tables 
//			new CreateTable(stmt);		// create tables for first time
			new AddDataFirstTime(stmt);	// inserts initial data
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
