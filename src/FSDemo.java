/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 31.08.18
 * Time: 8:17
 * To change this template use File | Settings | File Templates.
 */
class FailSoftArray {
    private int a[];    //  Ссылка на массив.
    private int errval; //  Значение, возвращаемое в    том случае, если
    // в методе get() будет обнаружена ошибка,
    public int length;  //  Переменная length   открыта.

    /* Конструктору данного класса передается   размер  массива и   значение,
       которое должен возвращать метод get() при обнаружении ошибки. */
    public FailSoftArray(int size, int errv) {
        a = new int[size];
        errval = errv;
        length = size;
    }

    // возвратить значение элемента массива по заданному индексу
    public int get(int index) {
        // Отслеживание попытки обращения за границы массива.
        if(ok(index)) return a[index];
        return errval;
    }

    // установить значение элемента no заданному индексу,
    // если возникнет ошибка, возвратить логическое значение false
    public boolean put(int index, int val) {
        // Отслеживание попытки обращения эа границы массива.
        if(ok(index)) {
            a[index] = val;
            return true;
        }
        return false;
    }

    // возвратить логическое значение true, если индекс
    // не выходит за границы массива
    private boolean ok(int index) {
        if(index >= 0 & index < length) return true;
        return false;
    }
}
// продемонстрировать обращение к отказоустойчивому массиву
class FSDemo {
    public static void main(String args[]) {
        FailSoftArray fs = new FailSoftArray(5, -1);
        int x;
        // выявить скрытые сбои при обращении к массиву
        System.out.println("Fail quietly.") ;
        for(int i=0; i < (fs.length * 2); i++)
            // Доступ к массиву должен осуществляться с помощью
            // специально предназначенных для этого методов,
            fs.put(i, i*10);

        for (int i=0; i < (fs.length * 2); i++) {
            // Доступ к массиву должен осуществляться с помощью
            // специально предназначенных для этого методов.
            x = fs.get (i);
            if(x != -1) System.out.print(x + " ");
        }

        System.out.println ("") ;

        // а теперь обработать сбои и вывести сообщения об ошибках
        System.out.println("\nFail with error reports.");
        for (int i=0; i < (fs.length * 2); i++)
            if (!fs.put(i, i*10))
                System.out.println("Index " + i + " out-of-bounds");

        for(int i=0; i < (fs.length * 2); i++)  {
            x = fs.get (i);
            if(x != -1) System.out.print(x + " ") ;
            else
                System.out.println("Index " + i + " out-of-bounds");
        }
    }
}
