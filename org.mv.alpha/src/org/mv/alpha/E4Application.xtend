package org.mv.alpha

import org.eclipse.e4.ui.model.application.MApplication
import org.eclipse.e4.ui.workbench.lifecycle.ProcessAdditions
import org.eclipse.e4.ui.workbench.modeling.EModelService
import org.mv.alpha.handlers.QuitHandler
import org.mv.alpha.handlers.SaveHandler
import org.mv.docxtend.eclipse.e4.E4ApplicationBuilder
import org.mv.docxtend.eclipse.e4.E4Builder

import static org.mv.docxtend.eclipse.e4.E4BestPractice.*

class E4Application {

	@ProcessAdditions
	def createApp(MApplication application, EModelService service) {

		val extension e4 = new E4ApplicationBuilder
		
		// ------------------------------------------------------
		// First we need addons    
		application => [
					
			_MAddon[elementId = "org.eclipse.e4.core.commands.service"
				contributionURI = "bundleclass://org.eclipse.e4.core.commands/org.eclipse.e4.core.commands.CommandServiceAddon"]
			_MAddon[elementId = "org.eclipse.e4.ui.contexts.service"
				contributionURI = "bundleclass://org.eclipse.e4.ui.services/org.eclipse.e4.ui.services.ContextServiceAddon"]
			_MAddon[elementId = "org.eclipse.e4.ui.bindings.service"
				contributionURI = "bundleclass://org.eclipse.e4.ui.bindings/org.eclipse.e4.ui.bindings.BindingServiceAddon"]
			_MAddon[elementId = "org.eclipse.e4.ui.workbench.commands.model"
				contributionURI = "bundleclass://org.eclipse.e4.ui.workbench/org.eclipse.e4.ui.internal.workbench.addons.CommandProcessingAddon"]
			_MAddon[elementId = "org.eclipse.e4.ui.workbench.handler.model"
				contributionURI = "bundleclass://org.eclipse.e4.ui.workbench/org.eclipse.e4.ui.internal.workbench.addons.HandlerProcessingAddon"]
			_MAddon[elementId = "org.eclipse.e4.ui.workbench.contexts.model"
				contributionURI = "bundleclass://org.eclipse.e4.ui.workbench/org.eclipse.e4.ui.internal.workbench.addons.ContextProcessingAddon"]
			_MAddon[elementId = "org.eclipse.e4.ui.workbench.bindings.model"
				contributionURI = "bundleclass://org.eclipse.e4.ui.workbench.swt/org.eclipse.e4.ui.workbench.swt.util.BindingProcessingAddon"]
			
			
			
			//------------------------------------------------------
			// ---We need commands and handlers	
			val saveCommand = _MCommand [
				elementId = Save_Id //"org.eclipse.ui.file.save"
				commandName = Save	//"saveCommand"
			]
			_MHandler [ 				
				elementId = "org.mv.alpha.handler.saveCommand"
				contributionURI = getBundleString(SaveHandler) //"bundleclass://org.mv.alpha/org.mv.alpha.handlers.SaveHandler"
				command = saveCommand
			]
			//----
			val quitCommand = _MCommand [
				elementId = Exit_Id //"org.eclipse.ui.file.exit"
				commandName = Exit	//"ExitCommand"
			]
			_MHandler [
				elementId = "org.mv.alpha.handler.quitCommand"
				contributionURI = getBundleString(QuitHandler) //"bundleclass://org.mv.alpha/org.mv.alpha.handlers.QuitHandler"
				command = quitCommand
			]
			//----
			val openCommand = _MCommand [
				elementId = "org.mv.alpha.open"
				commandName = "openCommand"
			]
			_MHandler [
				elementId = "org.mv.alpha.handler.openCommand"
				contributionURI = "bundleclass://org.mv.alpha/org.mv.alpha.handlers.OpenHandler"
				command = openCommand
			]
			//----
			val aboutCommand = _MCommand [
				elementId = "org.eclipse.ui.help.aboutAction"
				commandName = "aboutCommand"
			]
			_MHandler [
				elementId = "org.mv.alpha.handler.aboutCommand"
				contributionURI = "bundleclass://org.mv.alpha/org.mv.alpha.handlers.AboutHandler"
				command = aboutCommand
			]
			
			//------------------------------------------------------
			// --- We add a window
			val extension e4Element = new E4Builder
			_MTrimmedWindow[
				label = "Example Xe4"
				width = 600
				height = 800
				_sharedElements [
					_MPart [label = "I am shared !!"]
					_MArea []
				]
				_MPerspectiveStack  [
					_MPerspective  [
						_MPartSashContainer [
							_MPart[
								label = "Sample Part"
								contributionURI = "bundleclass://org.mv.alpha/org.mv.alpha.parts.SamplePart"
							]
							_MPartStack[
								_MPart[
									label = "We want a lot of samples ..."
									contributionURI = "bundleclass://org.mv.alpha/org.mv.alpha.parts.SwtTestPart1"
								]
								_MPart[
									label = "... To test all of that ..."
									contributionURI = "bundleclass://org.mv.alpha/org.mv.alpha.parts.SwtTestPart2"
								]
								_MPart[
									label = "... and more"
									contributionURI = "bundleclass://org.mv.alpha/org.mv.alpha.parts.SwtTestPart3"
								]
							]
						]
					]
				]
				//------------------------------------------------------------------
				//------------Main menu
				_MMenu [
					_MMenu [
						label = "File"
						_MHandledMenuItem [
							label = "Open"
							iconURI = "platform:/plugin/org.mv.alpha/icons/sample.gif"
							command = openCommand
						]
						//-----------------------
						_MHandledMenuItem [
							label = "Save"
							iconURI = "platform:/plugin/org.mv.alpha/icons/save_edit.gif"
							command = saveCommand
						]
						//-----------------------
						_MMenuSeparator[]
						//-----------------------
						_MHandledMenuItem [
							label = "quit"
							command = quitCommand
						]
					]
					//-----------------------
					_MMenu [
						label = "Help"
						_MHandledMenuItem [
							label = "About"
							command = aboutCommand
						]
					]
				]
			]
			val myBinding = _MBindingContext [
				elementId = "org.eclipse.ui.contexts.dialogAndWindow"
				name = "In Dialog and Windows"
				_MBindingContext[elementId = "org.eclipse.ui.contexts.window" name = "In Windows"]
				_MBindingContext[elementId = "org.eclipse.ui.contexts.dialog" name = "In Dialogs"]
			]
			_MBindingTable [
				bindingContext = myBinding
				_MKeyBinding [keySequence = "M1+Q" command = quitCommand]
				_MKeyBinding [keySequence = "M1+O" command = openCommand]
				_MKeyBinding [keySequence = "M1+S" command = saveCommand]
				_MKeyBinding [keySequence = "M1+A" command = aboutCommand]
			]
			_snippets [
				_MPart []
				_MWindow[]
			]
		]
	}
}
