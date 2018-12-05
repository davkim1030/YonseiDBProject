package dbPackage;
import java.sql.*;

/**
 * 
 * @author davki
 * Descpriction : ó���� Table Create �ϴ� Ŭ����
 */
public class CreateTable {

	public CreateTable(Statement stmt) {
		for(int i = 0; i < 7; i++) {
			String query = "", log = "";
			switch(i){
			case 0:
				query = "CREATE TABLE ��ų(��ų�̸� varchar(32) primary key,"
						+ "ü������ int not null, "
						+ "�������� int not null)";
				log = "��ų";
				break;
			case 1:
				query = "CREATE TABLE ���� (������ varchar(32) primary key,"
						+ "���ݷº��� int not null, "
						+ "���º��� int not null, "
						+ "ü�º��� int not null, "
						+ "���º��� int not null, "
						+ "������ int not null, "
						+ "���ɺ��� int not null)";
				log = "����";
				break;
			case 2:
				query = "CREATE TABLE ��� (���ID varchar(32) primary key,"
						+ "PASSWORD varchar(32) not null,"
						+ "�̸� varchar(32) not null, "
						+ "���� int not null, "
						+ "����� varchar(32) not null, "
						+ "���ݷ� int not null, "
						+ "���� int not null, "
						+ "ü�� int not null, "
						+ "���� int not null, "
						+ "�� int not null, "
						+ "���� int not null, "
						+ "��ų varchar(32), "
						+ "���� varchar(32), "
						+ "foreign key(��ų) references ��ų, "
						+ "foreign key(����) references ����)";
				log = "���";
				break;
			case 3:
				query = "CREATE TABLE ������(�������̸� varchar(32) primary key, "
						+ "���� varchar(12) not null, "
						+ "���ݷ����� int not null, "
						+ "�������� int not null, "
						+ "������ int not null, "
						+ "�������� int not null, "
						+ "���ID varchar(32), "
						+ "foreign key(���ID) references ���)";
				log = "������";
				break;
			case 4:
				query = "CREATE TABLE �����屺 (�����屺�̸� varchar(32) primary key, "
						+ "���� int not null, "
						+ "���ܰ��ݷº��� int not null, "
						+ "���ܹ��º��� int not null, "
						+ "�����̵��º��� int not null, "
						+ "���ܻ�⺸�� int not null, "
						+ "������ varchar(32), "
						+ "foreign key(������) references ����)";
				log = "�����屺";
				break;
			case 5:
				query = "CREATE TABLE �������� (���������̸� varchar(32) primary key, "
						+ "���¼� int not null, "
						+ "�Ѱ��ݷ� int not null, "
						+ "�ѹ��� int not null, "
						+ "�̵��� int not null, "
						+ "��� int not null)";
				log = "��������";
				break;
			case 6:
				query = "CREATE TABLE ���ְ� (�����屺�̸� varchar(32), "
						+ "���������̸� varchar(32), "
						+ "primary key(�����屺�̸�, ���������̸�), "
						+ "foreign key(�����屺�̸�) references �����屺 on delete cascade, "
						+ "foreign key(���������̸�) references �������� on delete cascade)";
				log = "���ְ�";
				break;
			}
			try {
				stmt.execute(query);
				System.out.println(log + " ���̺� ���� ����!");
				
				if(i==5)
					stmt.execute("ALTER TABLE �����屺 RENAME COLUMN ������ TO õ������");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
