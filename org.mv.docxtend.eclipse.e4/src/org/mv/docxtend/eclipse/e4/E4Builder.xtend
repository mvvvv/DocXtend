package org.mv.docxtend.eclipse.e4

import java.util.ArrayList
import org.eclipse.e4.ui.model.application.MApplicationFactory
import org.eclipse.e4.ui.model.application.commands.MCommandsFactory
import org.eclipse.e4.ui.model.application.ui.MUIElement
import org.eclipse.e4.ui.model.application.ui.MUiFactory
import org.eclipse.e4.ui.model.application.ui.advanced.MAdvancedFactory
import org.eclipse.e4.ui.model.application.ui.basic.MBasicFactory
import org.eclipse.e4.ui.model.application.ui.menu.MMenuFactory
import org.mv.docxtend.XtendNode
import org.mv.docxtend.XtendTree

/** 
 * This class will be xtend(ed)  to a class setting e4 object to be use either by an e4 application or e4 fragment
 * 
 * @author mvidal     
 * @version 0.1  
 *    
 */  
@XtendTree()
class E4Builder { 
	private val advancedFactory = MAdvancedFactory::INSTANCE
	private val basicFactory = MBasicFactory::INSTANCE
	private val descriptorBasicFactory = org::eclipse::e4::ui::model::application::descriptor::basic::MBasicFactory::INSTANCE
	private val menuFactory = MMenuFactory::INSTANCE
	private val commandsFactory = MCommandsFactory::INSTANCE

	private val mUIFactory = MUiFactory::INSTANCE
	private val applicationFactory = MApplicationFactory::INSTANCE

 
	//---Application factory  
	@XtendNode(inserts="") protected def _MAddon() {applicationFactory.createAddon}

 

	//---Basic Factory
	/** 
	 * MTrimmedWindow inherits MWindow
     * @see #_MWindow   
	 */
	@XtendNode(inserts = "getTrimBars().add	: _MTrimBar")
	protected def _MTrimmedWindow() {basicFactory.createTrimmedWindow}

	@XtendNode(inserts = #[
			"getChildren().add 			: _MInputPart _MPart  _MPartStack _MPartSashContainer _MArea _MPerspectiveStack",
     		"setMainMenu				: _MMenu",
     		"getHandlers().add			: _MHandler",  
     		"getWindows().add			: _MWindow _MTrimmedWindow",
  			"getSharedElements().addAll	:_sharedElements"])
  	protected def _MWindow() {basicFactory.createWindow}



	/**
	 * method used to separate sharedElement from MContainerElement default container (MWindow MTrimmedWindow ...)
	 */
	@XtendNode(inserts = 
	 		"getSharedElements().add 	:_MInputPart _MPart  _MPartStack _MPartSashContainer _MArea")
	protected def _sharedElements() {return new DummySharedElements}




	@XtendNode( inserts = 
			"getChildren().add  : _MPart _MInputPart  _MPartStack _MPartSashContainer _MArea _MPlaceHolder")
	protected def _MPartSashContainer() {basicFactory.createPartSashContainer}



	@XtendNode( inserts = 
			"getChildren().add  : _MPart _MInputPart _MPlaceHolder")
	protected def _MPartStack() {basicFactory.createPartStack}



	@XtendNode( inserts = #[ 
			"getMenus().add			: _MMenu _MPopupMenu _MViewMenu",
     		"getHandlers().add		: _MHandler"])
	protected def _MPart() {basicFactory.createPart}



	@XtendNode( inserts = #[ 
			"getMenus().add			: _MMenu _MPopupMenu _MViewMenu",
     		"getHandlers().add		: _MHandler"])
	protected def _MPartDescriptor() {	/*---oh my ... two MbasicFactory ?!!*/ descriptorBasicFactory.createPartDescriptor}


	@XtendNode protected def _MInputPart() {basicFactory.createInputPart}


	@XtendNode( inserts = 
			"getChildren().add  : _MToolControl _MToolBar")
	protected def _MTrimBar() {	basicFactory.createTrimBar}



	//-----AdvancedFactory
	@XtendNode( inserts = 
			"getChildren().add : _MPerspective")
	protected def _MPerspectiveStack() {advancedFactory.createPerspectiveStack}



	@XtendNode( inserts = #[ 
			"getChildren().add  		: _MPart _MInputPart  _MPartStack _MPartSashContainer _MArea _MPlaceHolder", 
     		"getWindows().add			: _MWindow _MTrimmedWindow"  ])
	protected def _MPerspective() {advancedFactory.createPerspective}


	@XtendNode protected def _MArea() {advancedFactory.createArea}

	@XtendNode protected def _MPlaceHolder() {advancedFactory.createPlaceholder}



	//-----MenuFactory
	@XtendNode( inserts = 
			"getChildren().add  : _MMenu  _MDirectMenuItem _MDynamicMenuContribution _MHandledMenuItem _MMenuSeparator")
	protected def _MMenuContribution() {menuFactory.createMenuContribution}


	@XtendNode( inserts = 
			"getChildren().add  	: _MMenu _MDirectMenuItem _MDynamicMenuContribution _MHandledMenuItem _MMenuSeparator")
	protected def _MMenu() {menuFactory.createMenu}

	/**Dummy View Menu object (do not exist in MMenuFactory)
	 * @see #_MMenu
	 */
	@XtendNode protected def _MViewMenu() {
		val obj = menuFactory.createMenu
		obj.getTags().add("ViewMenu");
		return obj
	}

	@XtendNode( inserts = 
			"getChildren().add  : _MMenu  _MDirectMenuItem _MDynamicMenuContribution _MHandledMenuItem _MMenuSeparator")
	protected def _MPopupMenu() {menuFactory.createPopupMenu}

	@XtendNode protected def _MMenuSeparator() {menuFactory.createMenuSeparator}


	@XtendNode protected def _MDirectMenuItem() {menuFactory.createDirectMenuItem}


	@XtendNode( inserts = 
			"getParameters().add  : _MParameter")
	protected def _MHandledMenuItem() {menuFactory.createHandledMenuItem}



	@XtendNode protected def _MDynamicMenuContribution() {menuFactory.createDynamicMenuContribution}


	@XtendNode( inserts = 
			"getChildren().add  :_MToolBarSeparator _MToolControl _MDirectToolItem  _MHandledToolItem")
	protected def _MToolBarContribution() {	menuFactory.createToolBarContribution}


	@XtendNode( inserts = 
			"getChildren().add  : _MToolBarSeparator _MToolControl _MDirectToolItem  _MHandledToolItem")
	protected def _MToolBar() {menuFactory.createToolBar}


	@XtendNode protected def _MToolBarSeparator() {menuFactory.createToolBarSeparator}

	@XtendNode protected def _MToolControl() {menuFactory.createToolControl}

	@XtendNode protected def _MDirectToolItem() {menuFactory.createDirectToolItem}


	@XtendNode( inserts = 
			"getParameters().add  : _MParameter")
	protected def _MHandledToolItem() {menuFactory.createHandledToolItem}


	@XtendNode( inserts = 
			"getChildren().add  : _MToolControl _MToolBar")
	protected def _MTrimContribution() {menuFactory.createTrimContribution}


	//------Command Factory
	@XtendNode( inserts = 
			"getChildren().add  : _MBindingContext")
	protected def _MBindingContext() {commandsFactory.createBindingContext}


	@XtendNode( inserts = 
			"getBindings().add  : _MKeyBinding")
	protected def _MBindingTable() {commandsFactory.createBindingTable}


	@XtendNode( inserts = 
			"getParameters().add  : _MParameter")
	protected def _MKeyBinding() {commandsFactory.createKeyBinding}


	@XtendNode protected def _MParameter() {commandsFactory.createParameter}

	@XtendNode protected def _MHandler() {commandsFactory.createHandler}


	@XtendNode( inserts = 
			"getParameters().add  : _MCommandParameter")
	protected def _MCommand() {commandsFactory.createCommand}


	@XtendNode protected def _MCommandParameter() {commandsFactory.createCommandParameter}

	@XtendNode protected def _MCategory() {commandsFactory.createCategory}

	//----MUiFactory creating core expression Visibility When
	@XtendNode public def _CoreExpression() {
		mUIFactory.createCoreExpression
	}

}


/** A Dummy SharedElement Container invoked using _sharedElements */
class DummySharedElements extends ArrayList<MUIElement> {
	def getSharedElements() {
		return this
	}
}
