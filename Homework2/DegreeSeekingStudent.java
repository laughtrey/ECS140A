public class DegreeSeekingStudent extends Student {
    protected String m_major;
    protected String m_standing;

    DegreeSeekingStudent(int ID, String firstName, String lastName, int age, int credits, String major,
            String standing) {
        super(ID, firstName, lastName, age, credits);
        m_major = parseMajor(major);
        m_standing = parseStanding(standing);
    }

    public int computeFees() {
        int fees = 150 + (m_creditHours * 275);
        if(m_creditHours > 12){
            fees = 3450;
        }
        return fees;
    }

    public void printData(){
        super.printData();
        System.out.println();
        System.out.println(m_firstName + " is a degree-seeking student enrolled in " + m_creditHours + " credits");
        System.out.println(m_firstName + "'s major is " + m_major);
        System.out.println(m_firstName + "'s academic standing is "+ m_standing);
        System.out.println(m_firstName + "'s fees are: $" + computeFees());
    }

    protected String parseMajor(String major){
        String parsedMajor = "";
        if(major.equals("S")){
            parsedMajor = "gaming science";
        }
        else if(major.equals("M")){
            parsedMajor = "hotel management";
        }
        else if(major.equals("A")){
            parsedMajor = "lounge arts";
        }
        else if(major.equals("E")){
            parsedMajor = "beverage engineering";
        }

        return parsedMajor;
    }
    protected String parseStanding(String standing){
        String parsedStanding = "";
        if(standing.equals("G")){
            parsedStanding = "Good";
        }
        else if(standing.equals("W")){
            parsedStanding = "Warning";
        }
        else if(standing.equals("P")){
            parsedStanding = "Probation";
        }

        return parsedStanding;
    }
}
