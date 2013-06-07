package org.mv.docxtend.eclipse.e4

import java.util.ArrayList
import org.eclipse.e4.ui.model.application.MApplicationFactory
import org.eclipse.e4.ui.model.application.ui.MSnippetContainer
import org.eclipse.e4.ui.model.application.ui.MUIElement
import org.mv.docxtend.XtendNode
import org.mv.docxtend.XtendTree

/** 
 * This class will be xtend(ed)  to a class setting the hierarchical tree of a "e4 rcp application"
 * 
 * All the xtend(tion) are based upon the "Model Object Interfaces" (MApplication MWindow MPart ...)<br/><br/>
 * it's also possible to use generic types to avoid repetitions :<br/>
 * 			-->MElementContainer<MWindow>... insertWith="getChildren().add", insert="_MTrimmedWindow _MWindow"<br/>
 *    instead of <br/>
 *  		-->MApplication... insertWith="getChildren().add", insert="_MTrimmedWindow _MWindow"<br/><br/>
 * 
 * but with generic types you have to declare a "dummy method" with an explicit return type 	<br/><br/>
 * 
 * An other advantage of repeating for each real object is precision and therefore helping to construct good practices. 
 * 
 * 
 * @author mvidal        
 * @version 0.1    
 *
 */
@XtendTree(useInsertsFrom=typeof(E4Builder))
class E4ApplicationBuilder { 

	private val applicationFactory = MApplicationFactory::INSTANCE
 	
	@XtendNode(
		inserts = #[
			"getAddons().add 					: _MAddon",
			
			"getChildren().add 					: _MTrimmedWindow _MWindow",
			"getMenuContributions().add 		: _MMenuContribution",
			"getToolBarContributions().add		: _MToolBarContribution",
 			"getTrimContributions().add  		: _MTrimContribution",
 			"getBindingContexts().add    		: _MBindingContext",
 			"getBindingTables().add     		: _MBindingTable",  
 			"getCategories().add        		: _MCategory",  
 			"getDescriptors().add				: _MPartDescriptor",
 			"getCommands().add        			: _MCommand",  
 			"getHandlers().add        			: _MHandler",
 			  
 			"getSnippets().addAll				: _snippets"   	])
	protected def _MApplication() { applicationFactory.createApplication}


	@XtendNode(
		inserts = "getSnippets().add 	: 	_MInputPart _MPart  _MPartStack _MPartSashContainer _MArea
											_MPerspectiveStack _MPerspective _MWindow _MTrimmedWindow _MTrimContribution")
	protected def _snippets() {return new DummySnippetContainer()}
}



/** A Dummy SnippetContainer invoked using _snippets */
class DummySnippetContainer extends ArrayList<MUIElement> implements MSnippetContainer {
	override getSnippets() {
		return this
	}
}
