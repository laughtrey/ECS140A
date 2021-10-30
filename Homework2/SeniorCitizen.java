public class SeniorCitizen extends Student{
    
    public SeniorCitizen(int ID, String firstName, String lastName, int age, int credits){
        super(ID, firstName, lastName, age, credits);
    }

    public int computeFees(){
        int fees = 100;
        if(m_creditHours > 6){
            m_creditHours -= 6;
            fees += m_creditHours * 50;
        }
        return fees;
    }
    public void printData(){
        super.printData();
        System.out.println(m_firstName + " is a senior citizen student");
        System.out.println(m_firstName + "'s fees are: $"+ computeFees());
    }
}
