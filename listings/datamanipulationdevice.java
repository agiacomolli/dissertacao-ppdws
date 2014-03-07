public class DataManipulationDevice extends DefaultDevice {

    public final static String NAMESPACE =
            "http://ppdws.org/watchdog/datamanipulation";

    public DataManipulationDevice() {
        super();

        // Adds metadata.
        setPortTypes(new QNameSet(
                new QName("DataManipulationDevice")));

        // Adds device name(name is language specific).
        addFriendlyName("en-US", "Data Manipulation");

        // Adds device manufacture (manufacture is language
        // specific).
        addManufacturer("en-US", "ppdws");

        // Adds model name (model is language specific).
        addModelName("en-US", "...");

        // Creates and adds services.
        FastFourierTransformService ffts =
                new FastFourierTransformService();
        addService(ffts);

        TimeFrequencyMomentsService tfms =
                new TimeFrequencyMomentsService();
        addService(tfms);

        WaveletPackageEnergiesService wpes =
                new WaveletPackageEnergiesService();
        addService(wpes);

        WaveletPackageMomentsService wpms =
                new WaveletPackageMomentsService();
        addService(wpms);
    }
}
