public class FinAidStudent extends DegreeSeekingStudent{
    int m_AvailFinAid = 0;

    public FinAidStudent(int ID, String firstName, String lastName, int age, int credits, String major, String standing, int AvailFinAid){
        super(ID, firstName, lastName, age, credits, major, standing);
        m_AvailFinAid = AvailFinAid;
    }
    public int computeFees(){
        int fees = super.computeFees();
        if(fees - m_AvailFinAid < 0){
            return 0;
        }
        return fees - m_AvailFinAid;
    }
    public void printData(){
        super.printData();
        System.out.println(m_firstName + " recieves $" + m_AvailFinAid +" in financial assistance per term");

    }
}
