/**
 * @date : 2018.11.29 THU
 * @author : Hyun Wook Kim
 * @description : 로그인, 로그아웃, 세션유지, 세션 넘기기/받기 등
 * 로그인 관련된 부분을 처리하는 클래스이다.
 */
package dbPackage;
import java.sql.*;
import javax.crypto.spec.*;

public class LogInOut {
	private String userId;		// 유저 id
	private boolean isLogin;	// 로그인 여부
	private Statement stmt;
	private ResultSet rs;
	PwdEncryption pe;
	public LogInOut(Connection con, Statement stmt) {
		userId = "";
		isLogin = false;
		this.stmt = stmt;
		pe = new PwdEncryption();
	}
	
	public String getUserId() { return userId; }
	public boolean getIsLogin() { return isLogin; }
	
	/**
	 * @description : 디비에서 id pwd 확인해서 로그인하고 성공 여부를 리턴
	 * @param id	: 사용자가 입력한 String 타입 아이디
	 * @param pwd	: 사용자가 입력한 String 타입 비밀번호
	 * @return		: 성공하면 true, 실패하면 false
	 */
	public boolean logIn(String id, String pwd) {

		try{
			rs = stmt.executeQuery("SELECT ID, PASSWORD " +
					"FROM 관리자 WHERE ID='" + id + "' AND PASSWORD='" + pe.encrypt(pwd) + "'");
			pe.encrypt(pwd);
			if(rs.next()) {
				isLogin = true;
				return true;
			}
			else {
				isLogin = false;
				return false;
			}				
		} catch(Exception e){
			e.printStackTrace();;
			return false;
		}
	}
	

}
