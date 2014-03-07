package ppdws.plugins;

import net.xeoh.plugins.base.Plugin;

public interface BehaviorPlugin extends Plugin {
    public String name();
    public String description();
    public void execute(double cv);
}
