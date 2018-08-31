package Schildt;

/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 31.08.18
 * Time: 10:46
 * To change this template use File | Settings | File Templates.
 */
// Применение динамической диспетчеризации методов.
class TwoDShapeNew {
    private double width;
    private double height;
    private String name;

    // Конструктор по умолчанию.
    TwoDShapeNew() {
        width = height = 0.0;
        name = "null";
    }

    // Параметризированный конструктор.
    TwoDShapeNew(double w, double h, String n) {
        width = w;
        height = h;
        name = n;
    }

    // построить объект с одинаковыми значениями
    // переменных экземпляра width и height
    TwoDShapeNew(double x, String n) {
        width = height = x;
        name = n;
    }

    // построить один объект на основании другого объекта
    TwoDShapeNew(TwoDShapeNew ob) {
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

    // Метод area() определен в классе TwoDShapeNew.
    double area() {
        System.out.println("area() must be overridden");
        return 0.0;
    }
}

// Подкласс, производный от класса TwoDShapeNew,
// для представления треугольников,
class Triangle extends TwoDShapeNew {
    private String style;

    // Конструктор по умолчанию.
    Triangle() {
        super();
        style = "null";
    }

    // Конструктор класса Triangle.
    Triangle(String s, double w, double h) {
        super(w, h, "triangle");

        style = s;
    }

    // Конструктор с одним аргументом для построения треугольника
    Triangle(double х) {
        super(х, "triangle"); // вызвать конструктор суперкласса

        style = "isosceles";
    }

    // построить один объект на основании другого объекта
    Triangle(Triangle ob) {
        super(ob); // передать объект конструктору класса TwoDShapeNew
        style = ob.style;
    }

    // Переопределение метода area() для класса Triangle.
    double area()   {
        return getWidth() * getHeight() / 2;
    }

    void showStyle()    {
        System.out.println("Triangle is " + style);
    }
}

// Подкласс, производный от класса TwoDShapeNew,
// для представлёния прямоугольников,
class Rectangle extends TwoDShapeNew {
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

    // Переопределение метода area() для класса Rectangle.
    double area() {
        return getWidth() * getHeight();
    }
}

class DynShapes {
    public static void main(String args[]) {
        TwoDShapeNew shapes[] = new TwoDShapeNew[5];

        shapes[0] = new Triangle("right", 8.0, 12.0);
        shapes[1] = new Rectangle(10);
        shapes[2] = new Rectangle(10, 4);
        shapes[3] = new Triangle(7.0);
        shapes[4] = new TwoDShapeNew(10, 20, "generic");

        for (int i=0; i < shapes.length; i++)   {
            System.out.println("object is " + shapes[i].getName());
            // Требуемый вариант метода area() вызывается
            // для каждой геометрической фигуры в отдельности.
            System.out.println("Area is " + shapes[i].area());
            System.out.println();
        }
    }
}

