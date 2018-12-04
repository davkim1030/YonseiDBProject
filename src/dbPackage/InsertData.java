package dbPackage;
import java.sql.*;

/**
 * 
 * @author davki
 * Description : ���̺� �����͵��� �����ϴ� �޼ҵ���� ��Ƴ��� Ŭ����
 */
public class InsertData {
    private Statement stmt;     // sql���� statement���� ����� �α��� ���� �����Ѵ�.

    public InsertData(Statement stmt) {
        this.stmt = stmt;       // ����� �α������� �޴´� ���⼭
    } // constructor end

    /**
     * Description : DB�� ��ų ���ڵ带 �߰��ϴ� �޼ҵ�
     * String name : ��ų�̸� char(15)
     * int hpInc : ü������ numeric(8,2)
     * int mpInc : �������� numeric(8,2)
     */
    public String addSkill(String name, int hpInc, int mpInc) {
        try {
            stmt.execute("INSERT INTO ��ų VALUES('" + name + "', " +
                    String.valueOf(hpInc) + ", " + String.valueOf(mpInc) + ")");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Skill " + name + " Insertion Success";
    } // method end
    
    /**
     * Description : DB�� ���� ���ڵ带 �߰��ϴ� �޼ҵ�
     * String name : ������ char(15)
     * int atkCorr : ���ݷº��� numeric(8,2)
     * int defCorr : ���º��� numeric(8,2)
     * int hpCorr : ü�º��� numeric(10,2)
     * int mpCorr : ���º��� numeric(10,2)
     * int powCorr : ������ numeric(4,2)
     * int intCorr : ���ɺ��� numeric(4,2)
     */
    public String addTribe(String name, int atkCorr, int defCorr,
                           int hpCorr, int mpCorr, int powCorr, int intCorr) {
        try {
            stmt.execute("INSERT INTO ���� VALUES('" + name + "', " +
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
     * Description : DB�� ��� ���ڵ带 �߰��ϴ� �޼ҵ�
     * String ID : ��� ID char(10)
     * String PW : PASSWORD char(10)
     * String name : �̸� char(10)
     * int age : ���� int
     * String birthPlace : ����� char(20)
     * int attack : ���ݷ� numeric(8,2)
     * int defense : ���� numeric(8,2)
     * int hp : ü�� numeric(10,2)
     * int mp : ���� numeric(10,2)
     * int power : �� numeric(4,2)
     * int intel : ���� numeric(4,2)
     * String skill : ��ų char(15)
     * String tribe : ���� char(15)
     */
    public String addWarrior(String ID, String PW, String name,
                             int age, String birthPlace, int attack, int defense,
                             int hp, int mp, int power, int intel,
                             String skill, String tribe) {

        try {
            stmt.execute("INSERT INTO ��� VALUES('" + ID + "', '" +
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

    // skill�̶� tribe�� null�� ���
    public String addWarrior(String ID, String PW, String name,
                             int age, String birthPlace, int attack, int defense,
                             int hp, int mp, int power, int intel) {
        try {
            stmt.execute("INSERT INTO ��� VALUES('" + ID + "', '" +
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

    // skill�� null�� ���
    public String addWarriorNoSkill(String ID, String PW, String name,
                                    int age, String birthPlace, int attack, int defense,
                                    int hp, int mp, int power, int intel, String tribe) {
        try {
            stmt.execute("INSERT INTO ��� VALUES('" + ID + "', '" +
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

    // tribe�� null�� ���
    public String addWarriorNoTribe(String ID, String PW, String name,
                                    int age, String birthPlace, int attack, int defense,
                                    int hp, int mp, int power, int intel, String skill) {
        try {
            stmt.execute("INSERT INTO ��� VALUES('" + ID + "', '" +
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
     * Description : DB�� ������ ���ڵ带 �߰��ϴ� �޼ҵ�
     * String name : �������̸� char(15)
     * String type : ���� char(2)
     * int atkInc : ���ݷ����� numeric(8,2)
     * int defInc : �������� numeric(8,2)
     * int powInc : ������ numeric(4,2)
     * int intInc : �������� numeric(4,2)
     * String ID : ���ID char(10)
     */
    public String addItem(String name, String type, int atkInc,
                          int defInc, int powInc, int intInc, String ID) {
        try {
            stmt.execute("INSERT INTO ������ VALUES('" + name + "', '" +
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
     * Description : DB�� �����屺 ���ڵ带 �߰��ϴ� �޼ҵ�
     * String name : �����屺�̸� char(15)
     * int age : ���� int
     * int corpsAtkCorr : ���ܰ��ݷº��� numeric(10,2)
     * int corpsDefCorr : ���ܹ��º��� numeric(10,2)
     * int corpsSpeedCorr : �����̵��º��� numeric(10,2)
     * int corpsMoraleCorr : ���ܻ�⺸�� numeric(10,2)
     * String nemesis : õ������ char(15)
     */
    public String addAbandonGeneral(String name, int age, int corpsAtkCorr, int corpsDefCorr, 
                             int corpsSpeedCorr, int corpsMoraleCorr, String nemesis) {
        try {
            stmt.execute("INSERT INTO �����屺 VALUES('" + name + "', " +
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
     * Description : DB�� �������� ���ڵ带 �߰��ϴ� �޼ҵ�
     * String name : ���������̸� char(15)
     * int troops : ���¼� numeric(10,2)
     * int totalAtk : �Ѱ��ݷ� numeric(10,2)
     * int totalDef : �ѹ��� numeric(10,2)
     * int speed : �̵��� numeric(10,2)
     * int morale : ��� char(15)
     */
    public String addAbandonCorps(String name, int troops, int totalAtk,
                             int totalDef, int speed, int morale) {
        try {
            stmt.execute("INSERT INTO �������� VALUES('" + name + "', " +
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
     * Description : DB�� ���ְ� ���ڵ带 �߰��ϴ� �޼ҵ�
     * String general : �����屺�̸� char(15)
     * String corps : ���������̸� char(15)
     */
    public String addCommander(String general, String corps) {
        try {
            stmt.execute("INSERT INTO ���ְ� VALUES('" + general + "', '" +
            		corps + "')");
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        } // try-catch end
        return "Commander " + general + " : " + corps + " Insertion Success";
    } // method end

} // class end
