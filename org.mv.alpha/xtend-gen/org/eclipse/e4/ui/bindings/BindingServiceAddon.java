 
package org.eclipse.e4.ui.bindings;

import javax.inject.Inject;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.eclipse.e4.core.services.events.IEventBroker;

public class BindingServiceAddon {
	@Inject
	IEventBroker eventBroker;
	
	@PostConstruct
	void hookListeners() {
		// Hook event listeners
	}
	
	@PreDestroy
	void unhookListeners() {
		// Unhook event listeners
	}
}