package dbPackage;
import java.sql.*;

/**
 * 
 * @author davki
 * Description : �ʱ� �����͵��� �־��ִ� Ŭ����
 */
public class AddDataFirstTime {

	public AddDataFirstTime(Statement stmt) {
		InsertData id = new InsertData(stmt);
		System.out.println(id.addSkill("����", 100, 100));
		System.out.println(id.addSkill("ü��ü��", 200, 0));
		System.out.println(id.addSkill("��������", 0, 200));
		System.out.println(id.addTribe("����", 3, 5, 10, 40, 20, 30));
		System.out.println(id.addTribe("��ũ", 7, 2, 60, 10, 70, 20));
		System.out.println(id.addTribe("�ΰ�", 6, 5, 45, 35, 55, 65));
		System.out.println(id.addWarrior("0000001", "010101", "������", 25, "�����Ͼ�", 300, 200, 3400, 2030, 23, 34, "����", "�ΰ�"));
		System.out.println(id.addWarrior("0000002", "020202", "���ؼ�", 45, "����÷��̽�", 400, 100, 400, 603, 42, 11, "��������", "����"));
		System.out.println(id.addWarrior("0000003", "030303", "������", 65, "���ν�Ʈ��ũ", 500, 10, 300, 40, 22, 92, "ü��ü��", "��ũ"));
		System.out.println(id.addItem("�ĸ������", "Į", 8000, 0, 2, 1, "0000001"));
		System.out.println(id.addItem("���κ���", "Ȱ", 4300, 0, 1, 5, "0000002"));
		System.out.println(id.addItem("���ð���", "����", 100, 2000, 3, 5, "0000003"));
		System.out.println(id.addAbandonGeneral("������", 943, 1011, 2022, 3033, "��ũ"));
		System.out.println(id.addAbandonGeneral("�۸�ȣ", 876, 51, 72, 933, "�ΰ�"));
		System.out.println(id.addAbandonGeneral("�̿���", 2331, 34, 9022, 33, "����"));
		System.out.println(id.addAbandonCorps("ĥ��", 17003, 41141, 53633, 1242, 4235));
		System.out.println(id.addAbandonCorps("�뵵", 22052, 51632, 32536, 5633, 2321));
		System.out.println(id.addAbandonCorps("�̱���", 12604, 85347, 85452, 4353, 1533));
		System.out.println(id.addCommander("������", "ĥ��"));
		System.out.println(id.addCommander("�۸�ȣ", "�뵵"));
		System.out.println(id.addCommander("�̿���", "�̱���"));
	}
}
