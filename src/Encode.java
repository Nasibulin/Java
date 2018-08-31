/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 31.08.18
 * Time: 7:48
 * To change this template use File | Settings | File Templates.
 */
class Encode {
    public static void main(String args[]) {
        String msg = "This is a test";
        String encmsg = "";
        String decmsg = "";
        int key = 88;

        System.out.print("Original message: ");
        System.out.println(msg);

        // зашифровать сообщение
        for (int i=0; i < msg.length(); i++)
            // Построение зашифрованной строки сообщения,
            encmsg = encmsg + (char) (msg.charAt(i) ^ key);

        System.out.print("Encoded message: ");
        System.out.println(encmsg) ;

        // дешифровать сообщение
        for(int i=0; i < msg.length(); i++)
            // Построение дешифрованной строки сообщения.
            decmsg = decmsg + (char) (encmsg.charAt(i) ^ key);

        System.out.print("Decoded message: ");
        System.out.println(decmsg);
    }
}
