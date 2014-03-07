package ppdws.electricactuator.csr6.behaviors;

import ppdws.plugins.BehaviorPlugin;
import net.xeoh.plugins.base.annotations.PluginImplementation;

@PluginImplementation
public class NormalBehavior implements BehaviorPlugin {

    @Override
    public String name() {
        return "Comportamento normal";
    }

    @Override
    public String description() {
        return "Comportamento normal para o atuador "
                "elétrico CSR6.";
    }

    @Override
    public void execute(double cv) {
        /*
         * Codigo, definido pelo usuario, relativo ao
         * comportamento normal que sera executado.
         */
    }
}
