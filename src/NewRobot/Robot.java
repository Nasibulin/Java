import java.util.logging.*;
package NewRobot;
/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 03.09.18
 * Time: 15:41
 * To change this template use File | Settings | File Templates.
 */
public class Robot {
    public static void main(String[] args) {
        int attempt=3;
        while (attempt>0){
            attempt--;
            System.out.println(attempt);
        }
        //
    }

    private static void configureLogging() {


        // your implementation here
    }

    public static void moveRobot(RobotConnectionManager robotConnectionManager, int toX, int toY) {

        int attempts = 3;
        while (attempts > 0) try (RobotConnection conn = robotConnectionManager.getConnection()) {

            conn.moveRobotTo(toX, toY);
            attempts = 0;

        } catch (RobotConnectionException exc) {
            attempts--;
            if (attempts == 0) {
                throw exc;
            }
        }
//        catch (Exception exc_all) {
//            throw exc_all;
//        }     не нужно оказывается

    }
        //if (attempts>3) throw new RobotConnectionException("Ошибка соединения");
        // your implementation here
  }
