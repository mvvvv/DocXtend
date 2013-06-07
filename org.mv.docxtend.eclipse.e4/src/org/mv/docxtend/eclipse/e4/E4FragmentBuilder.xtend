package org.mv.docxtend.eclipse.e4

import org.eclipse.e4.ui.model.fragment.MFragmentFactory
import org.mv.docxtend.XtendNode
import org.mv.docxtend.XtendTree

/** 
 * This final class will be xtend(ed)  to a final class setting the hierarchical tree of a "e4 rcp fragment"
 * @author mvidal 
 * @version 0.1  
 */
@XtendTree(useInsertsFrom=typeof(E4Builder))
class E4FragmentBuilder {
	private val fragmentFactory = MFragmentFactory::INSTANCE

	@XtendNode(
		inserts = #[
			"getImports().add 	: 
				_MAddon _MArea _MBindingContext _MBindingTable _MCategory _MCommand _MCommandParameter _CoreExpression
				_MDirectMenuItem _MDirectToolItem _MDynamicMenuContribution _MHandledMenuItem _MHandledToolItem _MHandler
				_MInputPart _MKeyBinding _MMenu _MMenuContribution _MMenuSeparator _MParameter _MPart _MPartDescriptor
	        	_MPartStack _MPartSashContainer _MPerspective _MPerspectiveStack _MPlaceHolder _MPopupMenu
	        	_MToolBar _MToolBarContribution _MToolBarSeparator _MToolControl _MTrimBar _MTrimContribution
	        	_MTrimmedWindow _MWindow",
	        	
			"getFragments().add 	: _MStringModelFragment"
		])
	protected def _MModelFragments() { fragmentFactory.createModelFragments }

	@XtendNode(
		inserts = #[
			"getElements().add 	: 
				_MAddon _MArea _MBindingContext _MBindingTable _MCategory _MCommand _MCommandParameter _CoreExpression
				_MDirectMenuItem _MDirectToolItem _MDynamicMenuContribution _MHandledMenuItem _MHandledToolItem _MHandler
				_MInputPart _MKeyBinding _MMenu _MMenuContribution _MMenuSeparator _MParameter _MPart _MPartDescriptor
		       	_MPartStack _MPartSashContainer _MPerspective _MPerspectiveStack _MPlaceHolder _MPopupMenu
		       	_MToolBar _MToolBarContribution _MToolBarSeparator _MToolControl _MTrimBar _MTrimContribution
		       	_MTrimmedWindow _MWindow"
		       	
		])
	 protected def _MStringModelFragment() {fragmentFactory.createStringModelFragment}
}
