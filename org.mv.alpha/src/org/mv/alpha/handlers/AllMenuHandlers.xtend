package org.mv.alpha.handlers

import java.lang.reflect.InvocationTargetException
import javax.inject.Named
import org.eclipse.core.runtime.IProgressMonitor
import org.eclipse.e4.core.contexts.IEclipseContext
import org.eclipse.e4.core.di.annotations.CanExecute
import org.eclipse.e4.core.di.annotations.Execute
import org.eclipse.e4.ui.model.application.MContribution
import org.eclipse.e4.ui.model.application.ui.MDirtyable
import org.eclipse.e4.ui.services.IServiceConstants
import org.eclipse.e4.ui.workbench.IWorkbench
import org.eclipse.jface.dialogs.MessageDialog
import org.eclipse.jface.dialogs.ProgressMonitorDialog
import org.eclipse.swt.widgets.FileDialog
import org.eclipse.swt.widgets.Shell

/**As defined by New E4 application project */
public class AboutHandler {
	@Execute
	public def execute(@Named(IServiceConstants.ACTIVE_SHELL) Shell shell) {
		MessageDialog.openInformation(shell, "About", "Eclipse 4 Application example.");
	}
}

/**As defined by New E4 application project */
public class OpenHandler {

	@Execute
	public def execute(@Named(IServiceConstants.ACTIVE_SHELL) Shell shell) {
		val dialog = new FileDialog(shell);
		dialog.open();
	}
}

/**As defined by New E4 application project */
public class QuitHandler {
	@Execute
	public def execute(IWorkbench workbench, @Named(IServiceConstants.ACTIVE_SHELL) Shell shell) {
		if (MessageDialog.openConfirm(shell, "Confirmation", "Do you want to exit?")) {
			workbench.close();
		}
	}
}

/**As defined by New E4 application project */
public class SaveHandler {
	@CanExecute
	public def canExecute(@Named(IServiceConstants.ACTIVE_PART) MDirtyable dirtyable) {
		if (dirtyable == null) {
			return false;
		}
		return dirtyable.isDirty();
	}

	@Execute
	public def execute(	IEclipseContext context,
			@Named(IServiceConstants.ACTIVE_SHELL) Shell shell,
			@Named(IServiceConstants.ACTIVE_PART)  MContribution contribution)
			throws InvocationTargetException, InterruptedException {
		val pmContext = context.createChild();

		val dialog = new ProgressMonitorDialog(shell);
		dialog.open();
		dialog.run(true, true, 
			[IProgressMonitor monitor|
				pmContext.set(IProgressMonitor.class.getName(), monitor);
				if (contribution != null) {
					//Object clientObject = contribution.getObject();
					//					ContextInjectionFactory.invoke(clientObject, Persist.class, //$NON-NLS-1$
					//     			    pmContext, null);
				}
				]);
		
		pmContext.dispose();
	}
}