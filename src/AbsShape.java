/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 31.08.18
 * Time: 10:56
 * To change this template use File | Settings | File Templates.
 */
abstract class TwoDShape {
    private double width;
    private double height;
    private String name;

    // Конструктор no умолчанию.
    TwoDShape() {
        width = height = 0.0;
        name = "null";
    }

    // Параметризированный конструктор.
    TwoDShape(double w, double h, String n) {
        width = w;
        height = h;
        name = n;
    }

    // построить объект с одинаковыми значениями
    // переменных экземпляра width и height
    TwoDShape(double x, String n) {
        width = height = x;
        name = n;
    }

    // построить один объект на основании другого объекта
    TwoDShape(TwoDShape ob) {
        width = ob.width;
        height = ob.height;
        name = ob.name;
    }

    // Методы доступа к переменным width и height,
    double getWidth() { return width; }
    double getHeight() { return height; }
    void setWidth(double w) { width = w; }
    void setHeight(double h) { height = h; }
    String getName() { return name; }

    void showDim()  {
        System.out.println("Width and height are " +
                width + " and " + height);
    }

    // Теперь метод area() является абстрактным.
    abstract double area();
}

// Подкласс, производный от класса TwoDShapeNew,
// для представления треугольников,
class Triangle extends TwoDShape {
    private String style;

    // Конструктор по умолчанию.
    Triangle()  {
        super() ;
        style = "null";
    }

    // Конструктор класса Triangle.
    Triangle(String s, double w, double h) {
        super(w, h, "triangle");

        style = s;
    }

    // Конструктор с одним аргументом для построения треугольника.
    Triangle(double х) {
        super(х, "triangle"); // вызвать конструктор суперкласса
        style =  "isosceles";
    }

    // построить один объект на основании другого объекта
    Triangle(Triangle ob) {
        super(ob); // передать объект конструктору класса TwoDShapeNew
        style = ob.style;
    }

    double area() {
        return getWidth() * getHeight() / 2;
    }

    void showStyle()    {
        System.out.println("Triangle is " + style);
    }
}

// Подкласс, производный от класса TwoDShapeNew,
// для представления прямоугольников.
class Rectangle extends TwoDShape {
    // Конструктор по умолчанию.
    Rectangle() {
        super();
    }

    // Конструктор класса Rectangle.
    Rectangle(double w, double h) {
        super(w, h, "rectangle"); // вызвать конструктор суперкласса
    }

    // построить квадрат
    Rectangle(double х) {
        super(х, "rectangle"); // вызвать конструктор суперкласса
    }

    // построить один объект на основании другого объекта
    Rectangle(Rectangle ob) {
        super(ob); // передать объект конструктору класса TwoDShapeNew
    }

    boolean isSquare() {
        if (getWidth() == getHeight()) return true;
        return false;
    }

    double area() {
        return getWidth() * getHeight();
    }
}

class AbsShape {
    public static void main(String args[]) {
        TwoDShape shapes[] = new TwoDShape[4];
        shapes[0] = new Triangle("right", 8.0, 12.0);

        shapes[1] = new Rectangle(10);
        shapes[2] = new Rectangle(10, 4);
        shapes[3] = new Triangle(7.0);

        for(int i=0; i < shapes.length; i++)    {
            System.out.println("object is " +
                    shapes[i].getName());
            System.out.println("Area is " + shapes[i].area());
            System.out.println();
        }
    }
}
