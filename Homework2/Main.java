import java.util.Scanner;
import java.util.ArrayList;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class Main {
    public static void main(String[] args) throws FileNotFoundException {
        File inputFile;

        if (args.length < 1) {
            System.out.println("Please run with input file");
        }

        inputFile = new File(args[0]);
        ArrayList<Student> studentList = parsefile(inputFile);

        printFees(studentList);
        System.out.println();
        printSummary(studentList);

    }

    public static ArrayList<Student> parsefile(File inputFile) throws FileNotFoundException {
        ArrayList<Student> studentList = new ArrayList<Student>();
        final int MAX_LENGTH_OF_DATA = 10;

        Scanner input = new Scanner(inputFile);
        int line_count = 0;

        while (input.hasNextLine()) {
            line_count++;
            String line = input.nextLine();
            String[] listingData = line.split(";"); // Expected for degree seeking: [0]id # | [1]first name | [2]last
                                                    // name |[3]age |[4]credit hours
                                                    // [5]Degree status |[6]Major |[7]Academic Standing |[8]FinAid
                                                    // Status |[9]FinAssistance per term
                                                    // Expected for non-degree: [0]id # | [1]first name | [2]last name
                                                    // |[3]age |[4]credit hours
                                                    // [5]Degree status |[6]CertOrSenior |[7]Certificate Type
            if (listingData.length > MAX_LENGTH_OF_DATA) {
                input.close();
                throw new IllegalArgumentException("Error in input file on line: " + line_count); // This will throw an
                                                                                                  // error message if
                                                                                                  // input data is not
                                                                                                  // formatted
                                                                                                  // correctly.
            }
            if (listingData[5].equals("Y")) {// Degree Seeking
                if (listingData.length > 9) {// make sure to not go out of bounds
                    if (listingData[8].equals("Y")) {// Fin Aid Recieving
                        studentList.add(new FinAidStudent(Integer.parseInt(listingData[0]), listingData[1],
                                listingData[2], Integer.parseInt(listingData[3]), Integer.parseInt(listingData[4]),
                                listingData[6], listingData[7], Integer.parseInt(listingData[9])));
                    }
                }
                else{//no Fin Aid
                    studentList.add(new DegreeSeekingStudent(Integer.parseInt(listingData[0]), listingData[1],
                    listingData[2], Integer.parseInt(listingData[3]), Integer.parseInt(listingData[4]),
                    listingData[6], listingData[7]));
                }

            } else if (listingData[5].equals("N")) {// Non-DegreeSeeking
                if(listingData.length > 6){// make sure to not go out of bounds
                    if(listingData[6].equals("C")){//Cert seeking
                        studentList.add(new CertificateStudent(Integer.parseInt(listingData[0]), listingData[1],
                        listingData[2], Integer.parseInt(listingData[3]), Integer.parseInt(listingData[4]), listingData[7]));
                    }
                    else{//senior citizen
                        studentList.add(new SeniorCitizen(Integer.parseInt(listingData[0]), listingData[1],
                        listingData[2], Integer.parseInt(listingData[3]), Integer.parseInt(listingData[4])));
                    }
                }
            }
        }

        if (line_count > 100) {
            System.out.println("Too much Data, please enter 100 or less students.");
            System.exit(0);
            // error out here.
        }

        input.close();

        return studentList;
    }

    public static void printFees(ArrayList<Student> list) {
        for(int i = 0; i < list.size(); i++){
            list.get(i).printFees();
        }
    }

    public static void printSummary(ArrayList<Student> list) {
        int degreeFees = 0;
        int withFinAidFees = 0;
        int certFees = 0;
        int seniorFees = 0;
        for(int i = 0; i < list.size(); i++){
            if(list.get(i) instanceof DegreeSeekingStudent){
                degreeFees += list.get(i).computeFees();
            }
            else if(list.get(i) instanceof FinAidStudent){
                withFinAidFees += list.get(i).computeFees();
            }
            else if(list.get(i) instanceof CertificateStudent){
                certFees += list.get(i).computeFees();
            }
            else if(list.get(i) instanceof SeniorCitizen){
                seniorFees += list.get(i).computeFees();
            }
        }
        int totalFees = degreeFees + withFinAidFees + certFees + seniorFees;
        System.out.println("Summary of student fees assessed:");
        System.out.println("Degree-seeking students without financial assistance: $" + degreeFees);
        System.out.println("Degree-seeking students with financial assistance: $" + withFinAidFees);
        System.out.println("Certificat students: $" + certFees);
        System.out.println("Senior Citizens: $" + seniorFees);
        System.out.println();
        System.out.println("Total: $" + totalFees);

    }


}