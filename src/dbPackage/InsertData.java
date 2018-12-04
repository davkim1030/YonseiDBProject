package dbPackage;
import java.sql.*;

/**
 * 
 * @author davki
 * Description : 테이블에 데이터들을 삽입하는 메소드들을 모아놓은 클래스
 */
public class InsertData {
    private Statement stmt;     // sql문의 statement변수 사용자 로그인 정보 저장한다.

    public InsertData(Statement stmt) {
        this.stmt = stmt;       // 사용자 로그인정보 받는다 여기서
    } // constructor end

    /**
     * Description : DB에 스킬 레코드를 추가하는 메소드
     * String name : 스킬이름 char(15)
     * int hpInc : 체력증가 numeric(8,2)
     * int mpInc : 마력증가 numeric(8,2)
     */
    public String addSkill(String name, int hpInc, int mpInc) {
        try {
            stmt.execute("INSERT INTO 스킬 VALUES('" + name + "', " +
                    String.valueOf(hpInc) + ", " + String.valueOf(mpInc) + ")");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Skill " + name + " Insertion Success";
    } // method end
    
    /**
     * Description : DB에 종족 레코드를 추가하는 메소드
     * String name : 종족명 char(15)
     * int atkCorr : 공격력보정 numeric(8,2)
     * int defCorr : 방어력보정 numeric(8,2)
     * int hpCorr : 체력보정 numeric(10,2)
     * int mpCorr : 마력보정 numeric(10,2)
     * int powCorr : 힘보정 numeric(4,2)
     * int intCorr : 지능보정 numeric(4,2)
     */
    public String addTribe(String name, int atkCorr, int defCorr,
                           int hpCorr, int mpCorr, int powCorr, int intCorr) {
        try {
            stmt.execute("INSERT INTO 종족 VALUES('" + name + "', " +
                    String.valueOf(atkCorr) + ", " + String.valueOf(defCorr) + ", " +
                    String.valueOf(hpCorr) + ", " + String.valueOf(mpCorr) + ", " +
                    String.valueOf(powCorr) + ", " + String.valueOf(intCorr) + ")");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Tribe " + name + " Insertion Success";
    } // method end

    /**
     * Description : DB에 용사 레코드를 추가하는 메소드
     * String ID : 용사 ID char(10)
     * String PW : PASSWORD char(10)
     * String name : 이름 char(10)
     * int age : 나이 int
     * String birthPlace : 출생지 char(20)
     * int attack : 공격력 numeric(8,2)
     * int defense : 방어력 numeric(8,2)
     * int hp : 체력 numeric(10,2)
     * int mp : 마력 numeric(10,2)
     * int power : 힘 numeric(4,2)
     * int intel : 지능 numeric(4,2)
     * String skill : 스킬 char(15)
     * String tribe : 종족 char(15)
     */
    public String addWarrior(String ID, String PW, String name,
                             int age, String birthPlace, int attack, int defense,
                             int hp, int mp, int power, int intel,
                             String skill, String tribe) {

        try {
            stmt.execute("INSERT INTO 용사 VALUES('" + ID + "', '" +
                    PW + "', '" + name + "', " + String.valueOf(age) + ", '" +
                    birthPlace + "', " +
                    String.valueOf(attack) + ", " + String.valueOf(defense) + ", " +
                    String.valueOf(hp) + ", " + String.valueOf(mp) + ", " + 
                    String.valueOf(power) + ", " + String.valueOf(intel) + ", '" +
                    skill + "', '" + tribe + "')");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Warrior " + ID + " Insertion Success";
    } // method end

    // skill이랑 tribe가 null인 경우
    public String addWarrior(String ID, String PW, String name,
                             int age, String birthPlace, int attack, int defense,
                             int hp, int mp, int power, int intel) {
        try {
            stmt.execute("INSERT INTO 용사 VALUES('" + ID + "', '" +
                    PW + "', '" + name + "', " + String.valueOf(age) + ", '" +
                    birthPlace + "'," +
                    String.valueOf(attack) + ", " + String.valueOf(defense) + ", " +
                    String.valueOf(hp) + ", " + String.valueOf(mp) +
                    String.valueOf(power) + ", " + String.valueOf(intel) + ")");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Warrior " + ID + " Insertion Success";
    } // method end

    // skill이 null인 경우
    public String addWarriorNoSkill(String ID, String PW, String name,
                                    int age, String birthPlace, int attack, int defense,
                                    int hp, int mp, int power, int intel, String tribe) {
        try {
            stmt.execute("INSERT INTO 용사 VALUES('" + ID + "', '" +
                    PW + "', '" + name + "', " + String.valueOf(age) + ", '" +
                    birthPlace + "'," +
                    String.valueOf(attack) + ", " + String.valueOf(defense) + ", " +
                    String.valueOf(hp) + ", " + String.valueOf(mp) +
                    String.valueOf(power) + ", " + String.valueOf(intel) +
                    ", null, '" + tribe + "')");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Warrior " + ID + " Insertion Success";
    } // method end

    // tribe가 null인 경우
    public String addWarriorNoTribe(String ID, String PW, String name,
                                    int age, String birthPlace, int attack, int defense,
                                    int hp, int mp, int power, int intel, String skill) {
        try {
            stmt.execute("INSERT INTO 용사 VALUES('" + ID + "', '" +
                    PW + "', '" + name + "', " + String.valueOf(age) + ", '" +
                    birthPlace + "'," +
                    String.valueOf(attack) + ", " + String.valueOf(defense) + ", " +
                    String.valueOf(hp) + ", " + String.valueOf(mp) +
                    String.valueOf(power) + ", " + String.valueOf(intel) +
                    ", '" + skill + "')");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Warrior " + ID + " Insertion Success";
    } // method end

    /**
     * Description : DB에 아이템 레코드를 추가하는 메소드
     * String name : 아이템이름 char(15)
     * String type : 종류 char(2)
     * int atkInc : 공격력증가 numeric(8,2)
     * int defInc : 방어력증가 numeric(8,2)
     * int powInc : 힘증가 numeric(4,2)
     * int intInc : 지능증가 numeric(4,2)
     * String ID : 용사ID char(10)
     */
    public String addItem(String name, String type, int atkInc,
                          int defInc, int powInc, int intInc, String ID) {
        try {
            stmt.execute("INSERT INTO 아이템 VALUES('" + name + "', '" +
                    type + "', " + String.valueOf(atkInc) + ", " +
                    String.valueOf(defInc) + ", " + String.valueOf(powInc) + ", " + 
                    String.valueOf(intInc) + ", '" + ID + "')");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Item " + name + " Insertion Success";
    } // method end

    /**
     * Description : DB에 마물장군 레코드를 추가하는 메소드
     * String name : 마물장군이름 char(15)
     * int age : 나이 int
     * int corpsAtkCorr : 군단공격력보정 numeric(10,2)
     * int corpsDefCorr : 군단방어력보정 numeric(10,2)
     * int corpsSpeedCorr : 군단이동력보정 numeric(10,2)
     * int corpsMoraleCorr : 군단사기보정 numeric(10,2)
     * String nemesis : 천적종족 char(15)
     */
    public String addAbandonGeneral(String name, int age, int corpsAtkCorr, int corpsDefCorr, 
                             int corpsSpeedCorr, int corpsMoraleCorr, String nemesis) {
        try {
            stmt.execute("INSERT INTO 마물장군 VALUES('" + name + "', " +
                    String.valueOf(age) + ", " + String.valueOf(corpsAtkCorr) + ", " +
                    String.valueOf(corpsDefCorr) + ", " + String.valueOf(corpsSpeedCorr) + ", " +
                    String.valueOf(corpsMoraleCorr) + ", '" + nemesis + "')");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Abandon General " + name + " Insertion Success";
    } // method end

    /**
     * Description : DB에 마물군단 레코드를 추가하는 메소드
     * String name : 마물군단이름 char(15)
     * int troops : 병력수 numeric(10,2)
     * int totalAtk : 총공격력 numeric(10,2)
     * int totalDef : 총방어력 numeric(10,2)
     * int speed : 이동력 numeric(10,2)
     * int morale : 사기 char(15)
     */
    public String addAbandonCorps(String name, int troops, int totalAtk,
                             int totalDef, int speed, int morale) {
        try {
            stmt.execute("INSERT INTO 마물군단 VALUES('" + name + "', " +
                    String.valueOf(troops) + ", " + String.valueOf(totalAtk) + ", " +
                    String.valueOf(totalDef) + ", " + String.valueOf(speed) +
                    ", " + String.valueOf(morale) + ")");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Abandon Corps " + name + " Insertion Success";
    } // method end

    /**
     * Description : DB에 지휘관 레코드를 추가하는 메소드
     * String general : 마물장군이름 char(15)
     * String corps : 마물군단이름 char(15)
     */
    public String addCommander(String general, String corps) {
        try {
            stmt.execute("INSERT INTO 지휘관 VALUES('" + general + "', '" +
            		corps + "')");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Commander " + general + " : " + corps + " Insertion Success";
    } // method end

} // class end
