package newrobot;

import java.util.logging.ConsoleHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.XMLFormatter;


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
        Logger loggerA = Logger.getLogger("org.stepic.java.logging.ClassA");
        Logger loggerB = Logger.getLogger("org.stepic.java.logging.ClassB");
        Logger loggerC = Logger.getLogger("org.stepic.java");
        loggerC.setUseParentHandlers(false);

        loggerA.setLevel(Level.ALL);
        loggerB.setLevel(Level.WARNING);
        loggerC.setLevel(Level.ALL);

        ConsoleHandler handlerA = new ConsoleHandler();
        ConsoleHandler handlerB = new ConsoleHandler();
        ConsoleHandler handlerC = new ConsoleHandler();


        handlerA.setFormatter(new XMLFormatter());
        handlerA.setLevel(Level.ALL);


        handlerB.setFormatter(new XMLFormatter());
        handlerB.setLevel(Level.WARNING);

        handlerC.setFormatter(new XMLFormatter());
        handlerC.setLevel(Level.ALL);

//        loggerA.addHandler(handlerA);
//        loggerB.addHandler(handlerB);
        loggerC.addHandler(handlerC);


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
