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
		

		System.out.println(id.addSkill("������", 23, 99));
		System.out.println(id.addSkill("��������", 0, 100));
		System.out.println(id.addSkill("��������", 12, 42));
		System.out.println(id.addSkill("�巹�θ���", 124, 52));
		System.out.println(id.addSkill("�κ�����", 512, 423));
		System.out.println(id.addSkill("��ų1", 53, 23));
		System.out.println(id.addSkill("��ų2", 31, 22));
		System.out.println(id.addSkill("��ų3", 112, 421));
		System.out.println(id.addSkill("��ų4", 512, 272));
		System.out.println(id.addSkill("��ų5", 43, 2));
		System.out.println(id.addSkill("��ų6", 2, 12));
		System.out.println(id.addSkill("��ų7", 12, 523));
		System.out.println(id.addSkill("��ų8", 25, 11));
		System.out.println(id.addSkill("��ų9", 21, 233));
		System.out.println(id.addSkill("��ų10", 234, 152));
		System.out.println(id.addSkill("��ų11", 122, 52));
		System.out.println(id.addSkill("��ų12", 32, 6161));
		System.out.println(id.addSkill("��ų13", 33, 163));
		System.out.println(id.addSkill("��ų14", 5, 78));
		
		System.out.println(id.addWarrior("0000004", "040404", "�ӾƸ�", 24, "����", 15, 42, 1, 2, 3, 4, "������", "�ΰ�"));
		System.out.println(id.addWarrior("0000005", "050505", "�ſ���", 24, "����", 42, 42, 1, 2, 3, 4, "��������", "��ũ"));
		System.out.println(id.addWarrior("0000006", "060606", "ȫ����", 24, "�뱸", 12, 42, 1, 2, 3, 4, "��������", "����"));
		System.out.println(id.addWarrior("0000007", "070707", "�̽ÿ�", 24, "�λ�", 152, 42, 1, 2, 3, 4, "�巹�θ���", "�ΰ�"));
		System.out.println(id.addWarrior("0000008", "080808", "�����", 24, "��õ", 123, 42, 1, 2, 3, 4, "�κ�����", "��ũ"));
		System.out.println(id.addWarrior("0000009", "090909", "��μ�", 24, "����", 413, 42, 1, 2, 3, 4, "��ų1", "����"));
		System.out.println(id.addWarrior("0000010", "101010", "�ּ���", 24, "����", 113, 42, 1, 2, 3, 4, "��ų2", "�ΰ�"));
		System.out.println(id.addWarrior("0000011", "111111", "������", 24, "����", 613, 42, 1, 2, 3, 4, "��ų3", "��ũ"));
		System.out.println(id.addWarrior("0000012", "121212", "���Ѱ�", 24, "��â", 913, 42, 1, 2, 3, 4, "��ų4", "����"));
		System.out.println(id.addWarrior("0000013", "131313", "�Ǹ���", 24, "����", 163, 42, 1, 2, 3, 4, "��ų5", "�ΰ�"));
		System.out.println(id.addWarrior("0000014", "141414", "������", 24, "â��", 135, 42, 1, 2, 3, 4, "��ų6", "��ũ"));
		System.out.println(id.addWarrior("0000015", "151515", "������", 24, "����", 1343, 42, 1, 2, 3, 4, "��ų7", "����"));
		System.out.println(id.addWarrior("0000016", "161616", "������", 24, "����", 132, 42, 1, 2, 3, 4, "��ų8", "�ΰ�"));
		System.out.println(id.addWarrior("0000017", "171717", "�����", 24, "���", 131, 42, 1, 2, 3, 4, "��ų9", "��ũ"));
		System.out.println(id.addWarrior("0000018", "181818", "������", 24, "����", 1233, 42, 1, 2, 3, 4, "��ų10", "����"));
		System.out.println(id.addWarrior("0000019", "191919", "������", 24, "����", 193, 42, 1, 2, 3, 4, "��ų11", "�ΰ�"));
		System.out.println(id.addWarrior("0000020", "202020", "�̽¿�", 24, "�ȵ�", 136, 42, 1, 2, 3, 4, "��ų12", "��ũ"));
		System.out.println(id.addWarrior("0000021", "212121", "������", 24, "����", 130, 42, 1, 2, 3, 4, "��ų13", "����"));
		
		
		System.out.println(id.addItem("�ĸ������", "Į", 8000, 0, 2, 1, "0000001"));
		System.out.println(id.addItem("���κ���", "Ȱ", 4300, 0, 1, 5, "0000002"));
		System.out.println(id.addItem("���ð���", "����", 100, 2000, 3, 5, "0000003"));

		System.out.println(id.addAbandonGeneral("������", 943, 1011, 2022, 4032, 3033, "��ũ"));
		System.out.println(id.addAbandonGeneral("�۸�ȣ", 876, 51, 72, 1123, 933, "�ΰ�"));
		System.out.println(id.addAbandonGeneral("�̿���", 2331, 34, 9022, 23, 33, "����"));
		
		System.out.println(id.addAbandonCorps("ĥ��", 17003, 41141, 53633, 1242, 4235));
		System.out.println(id.addAbandonCorps("�뵵", 22052, 51632, 32536, 5633, 2321));
		System.out.println(id.addAbandonCorps("�̱���", 12604, 85347, 85452, 4353, 1533));
		
		System.out.println(id.addCommander("������", "ĥ��"));
		System.out.println(id.addCommander("�۸�ȣ", "�뵵"));
		System.out.println(id.addCommander("�̿���", "�̱���"));
	}
}
