/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 29.08.18
 * Time: 12:34
 * To change this template use File | Settings | File Templates.
 */
public class Main {

    interface TextAnalyzer {
        Label processText(String text);
    }


    public Label checkLabels(TextAnalyzer[] analyzers, String text) {
        for(TextAnalyzer analyzer : analyzers){
            Label label = analyzer.processText(text);
            if(label!=Label.OK)
                return label.OK;
        }
        return Label.OK;
    }

    public abstract class KeywordAnalyzer implements TextAnalyzer{

        abstract Label getKeywords();
        abstract Label getLabel();

    }
    enum Label {
        SPAM, NEGATIVE_TEXT, TOO_LONG, OK
    }
    public class NegativeTextAnalyzer extends KeywordAnalyzer {

        private String[] keywords={":(","=(",":|"};
      //  NegativeTextAnalyzer(){};

        @Override
        Label getKeywords() {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }

        @Override
        Label getLabel() {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }

        public Label processText(String text) {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }

    }
    public class TooLongTextAnalyzer implements TextAnalyzer {

        private int maxLength;

        TooLongTextAnalyzer(int maxLength) {
            this.maxLength = maxLength;
        }


        Label getKeywords() {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }

        Label getLabel() {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }

        public Label processText(String text){

            return getLabel();
        }

    }
    public class SpamAnalyzer extends KeywordAnalyzer {

        private String[] keywords;

        SpamAnalyzer(String[] keywords) {
            this.keywords = keywords;
        }


        SpamAnalyzer() {
            //To change body of implemented methods use File | Settings | File Templates.
        }

        @Override
        Label getKeywords() {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }

        @Override
        Label getLabel() {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }

        public Label processText(String text) {
            return getLabel();  //To change body of implemented methods use File | Settings | File Templates.
        }
    }


    public static void main(String[] args) {
        Main main = new Main();
        main.test();
    }
    public void test() {
        // инициализация анализаторов для проверки в порядке данного набора анализаторов
        String[] spamKeywords = {"spam", "bad"};
        int commentMaxLength = 40;
        TextAnalyzer[] textAnalyzers1 = {
                new SpamAnalyzer(spamKeywords),
                new NegativeTextAnalyzer(),
                new TooLongTextAnalyzer(commentMaxLength)
        };
        TextAnalyzer[] textAnalyzers2 = {
                new SpamAnalyzer(spamKeywords),
                new TooLongTextAnalyzer(commentMaxLength),
                new NegativeTextAnalyzer()
        };
        TextAnalyzer[] textAnalyzers3 = {
                new TooLongTextAnalyzer(commentMaxLength),
                new SpamAnalyzer(spamKeywords),
                new NegativeTextAnalyzer()
        };
        TextAnalyzer[] textAnalyzers4 = {
                new TooLongTextAnalyzer(commentMaxLength),
                new NegativeTextAnalyzer(),
                new SpamAnalyzer(spamKeywords)
        };
        TextAnalyzer[] textAnalyzers5 = {
                new NegativeTextAnalyzer(),
                new SpamAnalyzer(spamKeywords),
                new TooLongTextAnalyzer(commentMaxLength)
        };
        TextAnalyzer[] textAnalyzers6 = {
                new NegativeTextAnalyzer(),
                new TooLongTextAnalyzer(commentMaxLength),
                new SpamAnalyzer(spamKeywords)
        };
        // тестовые комментарии
        String[] tests = new String[8];
        tests[0] = "This comment is so good.";                            // OK
        tests[1] = "This comment is so Loooooooooooooooooooooooooooong."; // TOO_LONG
        tests[2] = "Very negative comment !!!!=(!!!!;";                   // NEGATIVE_TEXT
        tests[3] = "Very BAAAAAAAAAAAAAAAAAAAAAAAAD comment with :|;";    // NEGATIVE_TEXT or TOO_LONG
        tests[4] = "This comment is so bad....";                          // SPAM
        tests[5] = "The comment is a spam, maybeeeeeeeeeeeeeeeeeeeeee!";  // SPAM or TOO_LONG
        tests[6] = "Negative bad :( spam.";                               // SPAM or NEGATIVE_TEXT
        tests[7] = "Very bad, very neg =(, very ..................";      // SPAM or NEGATIVE_TEXT or TOO_LONG
        TextAnalyzer[][] textAnalyzers = {textAnalyzers1, textAnalyzers2, textAnalyzers3,
                textAnalyzers4, textAnalyzers5, textAnalyzers6};
        int numberOfAnalyzer; // номер анализатора, указанный в идентификаторе textAnalyzers{№}
        int numberOfTest = 0; // номер теста, который соответствует индексу тестовых комментариев
        for (String test : tests) {
            numberOfAnalyzer = 1;
            System.out.print("test #" + numberOfTest + ": ");
            System.out.println(test);
            for (TextAnalyzer[] analyzers : textAnalyzers) {
                System.out.print(numberOfAnalyzer + ": ");
                System.out.println(this.checkLabels(analyzers, test));
                numberOfAnalyzer++;
            }
            numberOfTest++;
        }
    }
}