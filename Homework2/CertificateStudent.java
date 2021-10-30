public class CertificateStudent extends Student {
    protected String m_type;

    public CertificateStudent(int ID, String firstName, String lastName, int age, int credits, String type) {
        super(ID, firstName, lastName, age, credits);
        m_type = parseType(type);
    }

    public int computeFees() {
        int fees = (m_creditHours * 300) + 700;

        return fees;
    }

    public void printData() {
        super.printData();
        System.out.println(m_firstName + " is a certificate-seeking student enrolled in " + m_creditHours + " credits");
        System.out.println(m_firstName + "'s pursued certificate is " + m_type);
        System.out.println(m_firstName + "'s fees are: $" + computeFees());
    }

    protected String parseType(String type) {
        String parsedType = "";

        if (type.equals("S")) {
            parsedType = "gaming science";
        } else if (type.equals("M")) {
            parsedType = "hotel management";
        } else if (type.equals("A")) {
            parsedType = "lounge arts";
        } else if (type.equals("E")) {
            parsedType = "beverage engineering";
        }

        return parsedType;

    }
}
