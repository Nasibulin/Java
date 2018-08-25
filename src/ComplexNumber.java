/**
 * Created with IntelliJ IDEA.
 * User: Konstantin
 * Date: 25.08.18
 * Time: 8:23
 * To change this template use File | Settings | File Templates.
 */
public final class ComplexNumber {
    private final double re;
    private final double im;

    public ComplexNumber(double re, double im) {
        this.re = re;
        this.im = im;
    }

    public double getRe() {
        return re;
    }

    public double getIm() {
        return im;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ComplexNumber that = (ComplexNumber) o;

        if (Double.compare(that.im, im) != 0) return false;
        if (Double.compare(that.re, re) != 0) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        temp = re != +0.0d ? Double.doubleToLongBits(re) : 0L;
        result = (int) (temp ^ (temp >>> 32));
        temp = im != +0.0d ? Double.doubleToLongBits(im) : 0L;
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
