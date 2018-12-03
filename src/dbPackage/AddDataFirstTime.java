package dbPackage;
import java.sql.*;

/**
 * 
 * @author davki
 * Description : 초기 데이터들을 넣어주눈 클래스
 */
public class AddDataFirstTime {

	public AddDataFirstTime(Statement stmt) {
		InsertData id = new InsertData(stmt);
		System.out.println(id.addSkill("블레스", 100, 100));
		System.out.println(id.addSkill("체력체력", 200, 0));
		System.out.println(id.addSkill("마나마나", 0, 200));
		System.out.println(id.addTribe("엘프", 3, 5, 10, 40, 20, 30));
		System.out.println(id.addTribe("오크", 7, 2, 60, 10, 70, 20));
		System.out.println(id.addTribe("인간", 6, 5, 45, 35, 55, 65));
		System.out.println(id.addWarrior("0000001", "010101", "김현욱", 25, "엘리니아", 300, 200, 3400, 2030, 23, 34, "블레스", "인간"));
		System.out.println(id.addWarrior("0000002", "020202", "박준수", 45, "배드플레이스", 400, 100, 400, 603, 42, 11, "마나마나", "엘프"));
		System.out.println(id.addWarrior("0000003", "030303", "전도영", 65, "프로스트펑크", 500, 10, 300, 40, 22, 92, "체력체력", "오크"));
		System.out.println(id.addItem("후르츠대거", "칼", 8000, 0, 2, 1, "0000001"));
		System.out.println(id.addItem("래인보우", "활", 4300, 0, 1, 5, "0000002"));
		System.out.println(id.addItem("가시갑옷", "갑옷", 100, 2000, 3, 5, "0000003"));
		System.out.println(id.addAbandonGeneral("남재희", 943, 1011, 2022, 3033, "오크"));
		System.out.println(id.addAbandonGeneral("송명호", 876, 51, 72, 933, "인간"));
		System.out.println(id.addAbandonGeneral("이원준", 2331, 34, 9022, 33, "엘프"));
		System.out.println(id.addAbandonCorps("칠성", 17003, 41141, 53633, 1242, 4235));
		System.out.println(id.addAbandonCorps("노도", 22052, 51632, 32536, 5633, 2321));
		System.out.println(id.addAbandonCorps("이기자", 12604, 85347, 85452, 4353, 1533));
		System.out.println(id.addCommander("남재희", "칠성"));
		System.out.println(id.addCommander("송명호", "노도"));
		System.out.println(id.addCommander("이원준", "이기자"));
	}
}
