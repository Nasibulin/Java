import java.math.BigInteger;
import java.util.Locale;

/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 20.08.18
 * Time: 12:57
 * To change this template use File | Settings | File Templates.
 */
public class Stepik {


    public static void main(String[] args) {

        byte[] example = {72, 101, 108, 108, 111, 33};
        AsciiCharSequence answer = new AsciiCharSequence(example);
        System.out.println("Последовательность - " + answer.toString());//Hello!
        System.out.println("Размер её - " + answer.length());//6
        System.out.println("Символ под № 1 - " + answer.charAt(1));//e
        System.out.println("Подпоследовательность - " + answer.subSequence(1, 5));//ello
//проверка на нарушение инкапсуляции private поля
        System.out.println(answer.toString());//Hello!
        example[0] = 74;
        System.out.println(answer.toString());//Hello!



    }


    private static String printTextPerRole(String[] roles, String[] textLines) {
        StringBuilder answer = new StringBuilder();
        String subString;
        int i;
        for (String role : roles) {
            answer.append( role +":\n" );
            i=1;
            for (String textLine : textLines) {
                if (textLine.startsWith( role + ":" )) {
                    subString = textLine.substring( role.length()+2 );
                    answer.append(i).append(") ").append(subString).append( "\n" );
                 }
             i++;
            }

            answer.append( "\n" );
        }
        return answer.toString();
    }
    public static boolean isPalindrome(String value) {
        String a = value.replaceAll("[^a-zA-Z0-9]", "");

        StringBuilder c = new StringBuilder(a.toLowerCase(Locale.ENGLISH));
        StringBuilder b = new StringBuilder(a.toLowerCase(Locale.ENGLISH));
        return (c.toString().equals(b.reverse().toString()));

    }
    public static BigInteger factorial(int value) {
        BigInteger y=BigInteger.ONE;
        for (int n = 1; n <= value; n++) {
            y=y.multiply(BigInteger.valueOf(n));
            //          System.out.println(y);
        }
        return y;
    };
    public static int[] mergeArrays(int[] a1, int[] a2) {
        int[] a3 = new int[a1.length + a2.length];

        int i=0, j=0;
        for (int k=0; k<a3.length; k++) {

            if (i > a1.length - 1) {
                int a = a2[j];
                a3[k] = a;
                j++;
            } else if (j > a2.length - 1) {
                int a = a1[i];
                a3[k] = a;
                i++;
            } else if (a1[i] < a2[j]) {
                int a = a1[i];
                a3[k] = a;
                i++;
            } else {
                int b = a2[j];
                a3[k] = b;
                j++;
            }

        }
        return a3; // your implementation here
    }
}
