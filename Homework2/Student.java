public class Student {
    protected int m_IDNum = 0;
    protected String m_firstName,m_lastName;
    protected int m_age = 0;
    protected int m_creditHours = 0;

public Student(int ID, String firstName, String lastName, int age, int credits){
    m_IDNum = ID;
    m_firstName = firstName;
    m_lastName = lastName;
    m_age = age;
    m_creditHours = credits;
}
public int computeFees(){
    return 0;
}
public void printData(){
    System.out.println("ID number: " + this.m_IDNum);
    System.out.println("Name " + this.m_firstName + " "+ this.m_lastName);
    System.out.println("Age: " + this.m_age);
}
public int getID(){
    return m_IDNum;
}
public void printFees(){
    System.out.println(m_firstName +"'s fees are: $" + computeFees());
}
}