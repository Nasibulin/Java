package NewRobot;

/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 04.09.18
 * Time: 8:28
 * To change this template use File | Settings | File Templates.
 */
public interface IfaceRobotConnection extends AutoCloseable {
    void moveRobotTo(int x, int y);
    @Override
    void close();
}
