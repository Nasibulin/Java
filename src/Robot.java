/**
 * Created with IntelliJ IDEA.
 * User: Nasibulin
 * Date: 23.08.18
 * Time: 13:31
 * To change this template use File | Settings | File Templates.
 */
public class Robot {

    private enum Direction {
        UP,
        DOWN,
        LEFT,
        RIGHT
    }



    public Direction getDirection() {
        // текущее направление взгляда
        return null;
    }

    public int getX() {
        // текущая координата X
        return 0;
    }

    public int getY() {
        // текущая координата Y
        return 0;
    }

    public void turnLeft() {
        // повернуться на 90 градусов против часовой стрелки
    }

    public void turnRight() {
        // повернуться на 90 градусов по часовой стрелке
    }

    public void stepForward() {
        // шаг в направлении взгляда
        // за один шаг робот изменяет одну свою координату на единицу
    }

    public static void moveRobot(Robot robot, int toX, int toY) {



/*        int x=robot.getX();
        int y=robot.getY();
        Direction dir=robot.getDirection();*/
        if (robot.getX()<toX){

            switch (robot.getDirection()) {
                case UP:  robot.turnRight();
                    break;
                case DOWN:robot.turnLeft();
                    break;
                case LEFT:robot.turnRight();robot.turnRight();
                    break;
                case RIGHT:
                    break;
            }
        }
        else if(robot.getX()>toX) {

            switch (robot.getDirection()) {
                case UP:  robot.turnLeft();
                    break;
                case DOWN:robot.turnRight();
                    break;
                case LEFT:
                    break;
                case RIGHT:robot.turnRight();robot.turnRight();
                    break;
            }
        }
        while (robot.getX()!=toX) {

            robot.stepForward();

        }

            if (robot.getY()<toY){

                switch (robot.getDirection()) {
                    case UP:
                        break;
                    case DOWN:robot.turnRight();robot.turnRight();
                        break;
                    case LEFT:robot.turnRight();
                        break;
                    case RIGHT:robot.turnLeft();
                        break;
                }
            }
            else if (robot.getY()>toY) {

                switch (robot.getDirection()) {
                    case UP:robot.turnRight();robot.turnRight();
                        break;
                    case DOWN:
                        break;
                    case LEFT:robot.turnLeft();
                        break;
                    case RIGHT:robot.turnRight();
                        break;
                }

        }
            while (robot.getY()!=toY) {

                robot.stepForward();

            }

        }




}


