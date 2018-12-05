package dbPackage;
import java.sql.*;

/**
 * 
 * @author davki
 * Descpriction : 처음에 Table Create 하는 클래스
 */
public class CreateTable {

	public CreateTable(Statement stmt) {
		for(int i = 0; i < 7; i++) {
			String query = "", log = "";
			switch(i){
			case 0:
				query = "CREATE TABLE 스킬(스킬이름 varchar(32) primary key,"
						+ "체력증가 int not null, "
						+ "마력증가 int not null)";
				log = "스킬";
				break;
			case 1:
				query = "CREATE TABLE 종족 (종족명 varchar(32) primary key,"
						+ "공격력보정 int not null, "
						+ "방어력보정 int not null, "
						+ "체력보정 int not null, "
						+ "마력보정 int not null, "
						+ "힘보정 int not null, "
						+ "지능보정 int not null)";
				log = "종족";
				break;
			case 2:
				query = "CREATE TABLE 용사 (용사ID varchar(32) primary key,"
						+ "PASSWORD varchar(32) not null,"
						+ "이름 varchar(32) not null, "
						+ "나이 int not null, "
						+ "출생지 varchar(32) not null, "
						+ "공격력 int not null, "
						+ "방어력 int not null, "
						+ "체력 int not null, "
						+ "마력 int not null, "
						+ "힘 int not null, "
						+ "지능 int not null, "
						+ "스킬 varchar(32), "
						+ "종족 varchar(32), "
						+ "foreign key(스킬) references 스킬, "
						+ "foreign key(종족) references 종족)";
				log = "용사";
				break;
			case 3:
				query = "CREATE TABLE 아이템(아이템이름 varchar(32) primary key, "
						+ "종류 varchar(12) not null, "
						+ "공격력증가 int not null, "
						+ "방어력증가 int not null, "
						+ "힘증가 int not null, "
						+ "지능증가 int not null, "
						+ "용사ID varchar(32), "
						+ "foreign key(용사ID) references 용사)";
				log = "아이템";
				break;
			case 4:
				query = "CREATE TABLE 마물장군 (마물장군이름 varchar(32) primary key, "
						+ "나이 int not null, "
						+ "군단공격력보정 int not null, "
						+ "군단방어력보정 int not null, "
						+ "군단이동력보정 int not null, "
						+ "군단사기보정 int not null, "
						+ "종족명 varchar(32), "
						+ "foreign key(종족명) references 종족)";
				log = "마물장군";
				break;
			case 5:
				query = "CREATE TABLE 마물군단 (마물군단이름 varchar(32) primary key, "
						+ "병력수 int not null, "
						+ "총공격력 int not null, "
						+ "총방어력 int not null, "
						+ "이동력 int not null, "
						+ "사기 int not null)";
				log = "마물군단";
				break;
			case 6:
				query = "CREATE TABLE 지휘관 (마물장군이름 varchar(32), "
						+ "마물군단이름 varchar(32), "
						+ "primary key(마물장군이름, 마물군단이름), "
						+ "foreign key(마물장군이름) references 마물장군 on delete cascade, "
						+ "foreign key(마물군단이름) references 마물군단 on delete cascade)";
				log = "지휘관";
				break;
			}
			try {
				stmt.execute(query);
				System.out.println(log + " 테이블 생성 성공!");
				
				if(i==5)
					stmt.execute("ALTER TABLE 마물장군 RENAME COLUMN 종족명 TO 천적종족");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
