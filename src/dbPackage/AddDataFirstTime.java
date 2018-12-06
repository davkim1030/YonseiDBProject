package dbPackage;
import java.sql.*;

/**
 * 
 * @author davki
 * Description : 초기 데이터들을 넣어주는 클래스
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
		

		System.out.println(id.addSkill("슬래시", 23, 99));
		System.out.println(id.addSkill("매직가드", 0, 100));
		System.out.println(id.addSkill("매직쉴드", 12, 42));
		System.out.println(id.addSkill("드레인마나", 124, 52));
		System.out.println(id.addSkill("인비지블", 512, 423));
		System.out.println(id.addSkill("스킬1", 53, 23));
		System.out.println(id.addSkill("스킬2", 31, 22));
		System.out.println(id.addSkill("스킬3", 112, 421));
		System.out.println(id.addSkill("스킬4", 512, 272));
		System.out.println(id.addSkill("스킬5", 43, 2));
		System.out.println(id.addSkill("스킬6", 2, 12));
		System.out.println(id.addSkill("스킬7", 12, 523));
		System.out.println(id.addSkill("스킬8", 25, 11));
		System.out.println(id.addSkill("스킬9", 21, 233));
		System.out.println(id.addSkill("스킬10", 234, 152));
		System.out.println(id.addSkill("스킬11", 122, 52));
		System.out.println(id.addSkill("스킬12", 32, 6161));
		System.out.println(id.addSkill("스킬13", 33, 163));
		System.out.println(id.addSkill("스킬14", 5, 78));
		
		System.out.println(id.addWarrior("0000004", "040404", "임아름", 24, "수원", 15, 42, 1, 2, 3, 4, "슬래시", "인간"));
		System.out.println(id.addWarrior("0000005", "050505", "신용준", 24, "대전", 42, 42, 1, 2, 3, 4, "매직가드", "오크"));
		System.out.println(id.addWarrior("0000006", "060606", "홍석주", 24, "대구", 12, 42, 1, 2, 3, 4, "매직쉴드", "엘프"));
		System.out.println(id.addWarrior("0000007", "070707", "이시영", 24, "부산", 152, 42, 1, 2, 3, 4, "드레인마나", "인간"));
		System.out.println(id.addWarrior("0000008", "080808", "김민주", 24, "인천", 123, 42, 1, 2, 3, 4, "인비지블", "오크"));
		System.out.println(id.addWarrior("0000009", "090909", "김민선", 24, "전주", 413, 42, 1, 2, 3, 4, "스킬1", "엘프"));
		System.out.println(id.addWarrior("0000010", "101010", "최성현", 24, "광주", 113, 42, 1, 2, 3, 4, "스킬2", "인간"));
		System.out.println(id.addWarrior("0000011", "111111", "김현준", 24, "목포", 613, 42, 1, 2, 3, 4, "스킬3", "오크"));
		System.out.println(id.addWarrior("0000012", "121212", "위한결", 24, "고창", 913, 42, 1, 2, 3, 4, "스킬4", "엘프"));
		System.out.println(id.addWarrior("0000013", "131313", "권명준", 24, "마산", 163, 42, 1, 2, 3, 4, "스킬5", "인간"));
		System.out.println(id.addWarrior("0000014", "141414", "이지훈", 24, "창원", 135, 42, 1, 2, 3, 4, "스킬6", "오크"));
		System.out.println(id.addWarrior("0000015", "151515", "조혜림", 24, "여수", 1343, 42, 1, 2, 3, 4, "스킬7", "엘프"));
		System.out.println(id.addWarrior("0000016", "161616", "고은현", 24, "강릉", 132, 42, 1, 2, 3, 4, "스킬8", "인간"));
		System.out.println(id.addWarrior("0000017", "171717", "김민제", 24, "양양", 131, 42, 1, 2, 3, 4, "스킬9", "오크"));
		System.out.println(id.addWarrior("0000018", "181818", "김윤비", 24, "속초", 1233, 42, 1, 2, 3, 4, "스킬10", "엘프"));
		System.out.println(id.addWarrior("0000019", "191919", "박찬진", 24, "경주", 193, 42, 1, 2, 3, 4, "스킬11", "인간"));
		System.out.println(id.addWarrior("0000020", "202020", "이승욱", 24, "안동", 136, 42, 1, 2, 3, 4, "스킬12", "오크"));
		System.out.println(id.addWarrior("0000021", "212121", "문은영", 24, "남원", 130, 42, 1, 2, 3, 4, "스킬13", "엘프"));
		
		
		System.out.println(id.addItem("후르츠대거", "칼", 8000, 0, 2, 1, "0000001"));
		System.out.println(id.addItem("래인보우", "활", 4300, 0, 1, 5, "0000002"));
		System.out.println(id.addItem("가시갑옷", "갑옷", 100, 2000, 3, 5, "0000003"));

		System.out.println(id.addAbandonGeneral("남재희", 943, 1011, 2022, 4032, 3033, "오크"));
		System.out.println(id.addAbandonGeneral("송명호", 876, 51, 72, 1123, 933, "인간"));
		System.out.println(id.addAbandonGeneral("이원준", 2331, 34, 9022, 23, 33, "엘프"));
		
		System.out.println(id.addAbandonCorps("칠성", 17003, 41141, 53633, 1242, 4235));
		System.out.println(id.addAbandonCorps("노도", 22052, 51632, 32536, 5633, 2321));
		System.out.println(id.addAbandonCorps("이기자", 12604, 85347, 85452, 4353, 1533));
		
		System.out.println(id.addCommander("남재희", "칠성"));
		System.out.println(id.addCommander("송명호", "노도"));
		System.out.println(id.addCommander("이원준", "이기자"));
	}
}
