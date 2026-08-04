package Day5;

public class Interface {
}

interface Bird
{
    void sound();
}

class Sparrow implements Bird
{
    public void sound()
    {
        System.out.println("Sparrow chirps");
    }
}

class InterfaceMain
{
    public static void main(String args[])
    {
        Sparrow s = new Sparrow();

        s.sound();
    }
}