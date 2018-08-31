package bookpack;

/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 31.08.18
 * Time: 14:03
 * To change this template use File | Settings | File Templates.
 */
// Объявление защищенными переменных экземпляра в классе Book,
public class Book {
    // При объявлении этих переменных использован
    // модификатор доступа protected.
    protected String title;
    protected String author;
    protected int pubDate;

    public Book(String t, String a, int d) {
        title = t;
        author = a;
        pubDate = d;
    }

    public void show() {
        System.out.println(title);
        System.out.println(author);
        System.out.println(pubDate);
        System.out.println() ;
    }
}

