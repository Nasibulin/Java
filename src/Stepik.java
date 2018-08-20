import java.util.Arrays;

/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 20.08.18
 * Time: 12:57
 * To change this template use File | Settings | File Templates.
 */
public class Stepik {


    public static void main(String[] args) {

//        System.out.println("Hello World!");
//        System.out.println("Testing repository...");

        String [] roles= {"Городничий","Аммос Федорович","Артемий Филиппович","Лука Лукич"};
        String [] textLines={"Городничий: Я пригласил вас, господа, с тем, чтобы сообщить вам пренеприятное известие: к нам едет ревизор.",
                "Аммос Федорович: Как ревизор?",
                "Артемий Филиппович: Как ревизор?",
                "Городничий: Ревизор из Петербурга, инкогнито. И еще с секретным предписаньем.",
                "Аммос Федорович: Вот те на!",
                "Артемий Филиппович: Вот не было заботы, так подай!",
                "Лука Лукич: Господи боже! еще и с секретным предписаньем!"};

        System.out.println(printTextPerRole(roles,textLines));

    }
    private static String printTextPerRole(String[] roles, String[] textLines) {
        StringBuilder answer = new StringBuilder();
        String subString = new String();
        for (String role : roles) {
            answer.append( role +":\n" );
            for (String textLine : textLines) {
                if (textLine.startsWith( role + ":" )) {
                    subString = textLine.substring( role.length()+2 );
//                    answer.append(Arrays.asList( textLines ).indexOf(textLine) + 1).append(") ").append(subString).append( "\n" );
                    answer.append(Arrays.asList( textLines ).indexOf(textLine) + 1).append(") ").append(subString).append( "\n" );

                }
            }
            answer.append( "\n" );

            //.append(Arrays.asList( textLines ).indexOf(textLine) + 1)
            //заменил на счетчик i++
            //.append(i)


        }

        return answer.toString();
    }
}
