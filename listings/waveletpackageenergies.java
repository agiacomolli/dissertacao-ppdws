package ppdws.dpws.services;

// ...

public class WaveletPackageEnergiesService
        extends DefaultService {

    public final static String NAMESPACE =
            DataManipulationDevice.NAMESPACE +
            "/WaveletPackageEnergiesService";

    // ...

    public WaveletPackageEnergiesService() {
        super();

        // Defines an endpoint.
        setServiceId(new URI(NAMESPACE));

        // Defines the data type operation.
        SetDataTypeOperation setDataTypeOperation =
                new SetDataTypeOperation();
        addOperation(setDataTypeOperation);

        // Defines the equipment operation.
        SetEquipmentOperation setEquipmentOperation =
                new SetEquipmentOperation();
        addOperation(setEquipmentOperation);
    }

    public class SetEquipmentOperation extends Operation {
        // ...
    }

    public class SetDataTypeOperation extends Operation {
        // ...
    }
}
