package dbPackage;
import java.sql.*;

/**
 * 
 * @author Hyun Wook Kim
 * Description : �����ͺ��̽��� Ŀ�ؼ��� ����� �������� �����ϴ� ����
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
			stmt.execute("DROP TABLE ���ְ�");
			stmt.execute("COMMIT");
			System.out.println("���ְ� ���̺� ���� �Ϸ�");
			stmt.execute("DROP TABLE ��������");
			stmt.execute("COMMIT");
			System.out.println("�������� ���̺� ���� �Ϸ�");
			stmt.execute("DROP TABLE �����屺");
			stmt.execute("COMMIT");
			System.out.println("�����屺 ���̺� ���� �Ϸ�");
			stmt.execute("DROP TABLE ������");
			stmt.execute("COMMIT");
			System.out.println("������ ���̺� ���� �Ϸ�");
			stmt.execute("DROP TABLE ���");
			stmt.execute("COMMIT");
			System.out.println("��� ���̺� ���� �Ϸ�");
			stmt.execute("DROP TABLE ����");
			stmt.execute("COMMIT");
			System.out.println("���� ���̺� ���� �Ϸ�");
			stmt.execute("DROP TABLE ��ų");
			stmt.execute("COMMIT");
			System.out.println("��ų ���̺� ���� �Ϸ�");
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
