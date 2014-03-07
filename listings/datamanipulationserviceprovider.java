package ppdws.dpws.providers;

// ...

public class DataManipulationServiceProvider {

    public static void main(String[] args) {
        JMEDSFramework.start(args);

        // Creates a new data manipulation device.
        DataManipulationDevice device =
            new DataManipulationDevice();

        // Starts the device.
        try {
            device.start();
        } catch (IOException ex) {
            Logger.getLogger(
                DataManipulationServiceProvider.class
                .getName()).log(Level.SEVERE, null, ex);
        }
    }
}
