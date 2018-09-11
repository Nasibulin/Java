package newrobot;

/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 03.09.18
 * Time: 15:27
 * To change this template use File | Settings | File Templates.
 */
public class RobotConnectionException extends RuntimeException {

    public RobotConnectionException(String message) {
        super(message);

    }

    public RobotConnectionException(String message, Throwable cause) {
        super(message, cause);
    }
}
