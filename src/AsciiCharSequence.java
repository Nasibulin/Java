import java.util.Arrays;

/**
 * Created with IntelliJ IDEA.
 * User: Konstantin
 * Date: 26.08.18
 * Time: 15:09
 * To change this template use File | Settings | File Templates.
 */
public class AsciiCharSequence implements CharSequence {
    private byte[] example;

    AsciiCharSequence(byte[] example) {
     this.example=example.clone();           //To change body of created methods use File | Settings | File Templates.
    }

    @Override
    public int length() {
        return example.length;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public char charAt(int index) {
        char[] convertedChar = new char[example.length];
        return (char)example[index];  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public CharSequence subSequence(int start, int end) {

        StringBuilder convertedString = new StringBuilder();

        for (byte anExample : Arrays.copyOfRange(example,start,end)) {
            convertedString.append((char) anExample);
        }


/*        for(int i=start;i < end;i++){
            convertedString.append((char) example[i]);
        }*/
        return convertedString.toString();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String toString() {
        StringBuilder convertedString=new StringBuilder();

        for (byte anExample : example) {
            convertedString.append((char) anExample);
        }

        return convertedString.toString();  //To change body of implemented methods use File | Settings | File Templates.
    }
}
