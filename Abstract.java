package Day5;

public class Abstract {

    static abstract class Bird {
        abstract void sound();

        void eat() {
            System.out.println("Bird is eating");
        }
    }

    static class Sparrow extends Bird {
        void sound() {
            System.out.println("Sparrow chirps");
        }
    }

    static class Main {
        public static void main(String[] args) {
            Sparrow s = new Sparrow();

            s.sound();
            s.eat();
        }
    }
}