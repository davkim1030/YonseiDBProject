/**
 * @date : 2018.11.29 THU
 * @author : Hyun Wook Kim
 * @description : �α���, �α׾ƿ�, ��������, ���� �ѱ��/�ޱ� ��
 * �α��� ���õ� �κ��� ó���ϴ� Ŭ�����̴�.
 */
package dbPackage;
import java.sql.*;

public class LogInOut {
	private String userId;		// ���� id
	private boolean isLogin;	// �α��� ����
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
	public LogInOut(Connection con, Statement stmt) {
		userId = "";
		isLogin = false;
		this.con = con;
		this.stmt = stmt;
	}
	
	public String getUserId() { return userId; }
	public boolean getIsLogin() { return isLogin; }
	
	/**
	 * @description : ��񿡼� id pwd Ȯ���ؼ� �α����ϰ� ���� ���θ� ����
	 * @param id	: ����ڰ� �Է��� String Ÿ�� ���̵�
	 * @param pwd	: ����ڰ� �Է��� String Ÿ�� ��й�ȣ
	 * @return		: �����ϸ� true, �����ϸ� false
	 */
	public boolean logIn(String id, String pwd) {
		try{
			rs = stmt.executeQuery("SELECT ID, PASSWORD " +
					"FROM ������ WHERE ID='" + id + "' AND PASSWORD='" + pwd + "'");
			if(rs.next()) {
				isLogin = true;
				return true;
			}
			else {
				isLogin = false;
				return false;
			}				
		} catch(Exception sqle){
			System.out.println(sqle.toString());
			return false;
		}
	}

}
