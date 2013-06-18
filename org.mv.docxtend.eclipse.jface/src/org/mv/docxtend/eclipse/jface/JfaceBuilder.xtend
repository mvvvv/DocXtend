package org.mv.docxtend.eclipse.jface

import org.eclipse.jface.dialogs.ControlAnimator
import org.eclipse.jface.dialogs.ProgressIndicator
import org.eclipse.jface.fieldassist.AutoCompleteField
import org.eclipse.jface.fieldassist.ContentProposalAdapter
import org.eclipse.jface.fieldassist.ControlDecoration
import org.eclipse.jface.layout.TreeColumnLayout
import org.eclipse.jface.viewers.CheckboxCellEditor
import org.eclipse.jface.viewers.CheckboxTableViewer
import org.eclipse.jface.viewers.CheckboxTreeViewer
import org.eclipse.jface.viewers.ColorCellEditor
import org.eclipse.jface.viewers.ColumnLabelProvider
import org.eclipse.jface.viewers.ComboBoxCellEditor
import org.eclipse.jface.viewers.ComboBoxViewerCellEditor
import org.eclipse.jface.viewers.ComboViewer
import org.eclipse.jface.viewers.ListViewer
import org.eclipse.jface.viewers.TableLayout
import org.eclipse.jface.viewers.TableViewer
import org.eclipse.jface.viewers.TableViewerColumn
import org.eclipse.jface.viewers.TableViewerFocusCellManager
import org.eclipse.jface.viewers.TextCellEditor
import org.eclipse.jface.viewers.TreeViewer
import org.eclipse.jface.viewers.TreeViewerColumn
import org.eclipse.jface.viewers.TreeViewerFocusCellManager
import org.eclipse.jface.window.DefaultToolTip
import org.eclipse.jface.window.SameShellProvider
import org.eclipse.swt.custom.CCombo
import org.eclipse.swt.widgets.Combo
import org.eclipse.swt.widgets.Composite
import org.eclipse.swt.widgets.Control
import org.eclipse.swt.widgets.List
import org.eclipse.swt.widgets.Table
import org.eclipse.swt.widgets.Tree
import org.mv.docxtend.XtendNode
import org.mv.docxtend.XtendTree

/**
 * This class will be xtend(ed)  to a class setting the hierarchical tree of Jface (Standard Widget Toolkit) <br/><br/>
 * 
 * All the xtend(tion) are based upon the "Model Object" (TableViewer ComboEditor ...) <br/><br/>
 * 
 * @author mvidal           
 * @version 0.1        
 *
 * @see org.mv.docxtend.eclipse.swt.SwtApplicationBuilder 
 * @see org.mv.docxtend.eclipse.swt.SwtBuilder          
 */
@XtendTree
class JfaceBuilder {

//	//----Shell
//	@XtendNode(inserts=#[":_ApplicationWindow _WizardDialog _PreferenceDialog 
//			_ErrorDialog _InputDialog _MessageDialog _MessageDialogWithToggle _PopupDialog
//			_ProgressMonitorDialog _StatusDialog _TitleAreaDialog"])	
//	protected def Shell _xDummyShellContainer() {}
//	
//	@XtendNode(usingConstructors=true)	protected def ApplicationWindow _ApplicationWindow() {} 
//	@XtendNode(usingConstructors=true)	protected def WizardDialog _WizardDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def PreferenceDialog _PreferenceDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def ErrorDialog _ErrorDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def InputDialog _InputDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def MessageDialog _MessageDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def MessageDialogWithToggle _MessageDialogWithToggle() {} 
//	@XtendNode(usingConstructors=true)	protected def PopupDialog _PopupDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def ProgressMonitorDialog _ProgressMonitorDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def StatusDialog _StatusDialog() {} 
//	@XtendNode(usingConstructors=true)	protected def TitleAreaDialog _TitleAreaDialog() {} 
	
//	//----Display
//	@XtendNode(inserts=#[":_ColorRegistry"])	
//	protected def Display _xDummyDisplayContainer() {}
//	
//	@XtendNode(usingConstructors=true)	
//	public def ColorRegistry _ColorRegistry() {new ColorRegistry()} //---Bof ... 
	
	
	//----Control
	@XtendNode(inserts=#[":_DefaultToolTip _SameShellProvider
					_AutoCompleteField _ContentProposalAdapter _ControlDecoration
					_ControlAnimator"])	
	protected def Control _xDummyControlContainer() {}
	
	@XtendNode(usingConstructors=true)	protected def DefaultToolTip _DefaultToolTip() {} 
	
	@XtendNode(usingConstructors=true)	protected def SameShellProvider _SameShellProvider() {}
	
	
	@XtendNode(usingConstructors=true)	protected def AutoCompleteField _AutoCompleteField() {}

	@XtendNode(usingConstructors=true)	protected def ContentProposalAdapter _ContentProposalAdapter() {}

	@XtendNode(usingConstructors=true)	protected def ControlDecoration _ControlDecoration() {}
	
	
	@XtendNode(usingConstructors=true)	protected def ControlAnimator _ControlAnimator() {}
	
	//-----Composite  
	@XtendNode( inserts=#["				: 	_CheckboxCellEditor _TextCellEditor _ComboBoxViewerCellEditor
						  					_ComboBoxCellEditor  _ColorCellEditor   
						  					_TableViewer _CheckboxTreeViewer _ComboViewer
						  					_ListViewer _TreeViewer  _ProgressIndicator",
						  "setLayout 	: 	_TableLayout _TreeColumnLayout "])	
	protected def Composite _xDummyCompositeContainer() {}	

	@XtendNode protected def TableLayout _TableLayout() { new TableLayout } 

	@XtendNode protected def TreeColumnLayout _TreeColumnLayout() { new TreeColumnLayout } 



//  This class need org.eclipse.core.runtime plugin for IProgressMonitorWithBlocking ... jface is a mess ...
//	@XtendNode(usingConstructors=true)	
//	protected def ProgressMonitorPart _ProgressMonitorPart() {}

	@XtendNode(usingConstructors=true)	
	protected def ProgressIndicator _ProgressIndicator() {}


	// ---CellEditor ... some can be created without a container 

	@XtendNode(usingConstructors=true)	
	protected def ColorCellEditor _ColorCellEditor() { } 
	
	@XtendNode(usingConstructors=true)
	protected def ComboBoxViewerCellEditor _ComboBoxViewerCellEditor() {}   
	
	
	@XtendNode(usingConstructors=true)	protected def CheckboxCellEditor _CheckboxCellEditor(Object... _) {}
	
	@XtendNode(usingConstructors=true)	protected def ComboBoxCellEditor _ComboBoxCellEditor(Object... _) {}  
	
	@XtendNode(usingConstructors=true)	protected def TextCellEditor _TextCellEditor(Object... _) {}
	
	 
	 
	
	
	//---List
	@XtendNode(inserts=#[":_ListViewer "])	
	protected def List _xDummyListContainer() {}

	@XtendNode(usingConstructors=true)	
	protected def ListViewer _ListViewer() {}  
	
	//----Combo 
	@XtendNode(inserts=#[":_ComboViewer"])	
	protected def CCombo _xDummyCComboContainer() {}
	
	@XtendNode(inserts=#[":_ComboViewer"])	
	protected def Combo _xDummyComboContainer() {}
	
	@XtendNode(usingConstructors=true)	
	protected def ComboViewer _ComboViewer() {}  



	//----Table
	@XtendNode(inserts=#[":_TableViewer _CheckboxTableViewer"])	
	protected def Table _xDummyTableContainer() {}

	@XtendNode(usingConstructors=true, inserts=": _TableViewerColumn _TableViewerFocusCellManager")
	protected def TableViewer _TableViewer() {}



	@XtendNode(usingConstructors=true)	
	protected def CheckboxTableViewer _CheckboxTableViewer() {}

		
	@XtendNode(usingConstructors=true,inserts="setLabelProvider:_ColumnLabelProvider"	) 
	protected def TableViewerColumn _TableViewerColumn() {}
		
	@XtendNode
	protected def ColumnLabelProvider _ColumnLabelProvider() {new ColumnLabelProvider()}
	
	@XtendNode(usingConstructors=true)	
	protected def TableViewerFocusCellManager _TableViewerFocusCellManager() {}


	// ----Tree
	@XtendNode(inserts=#[": _TreeViewer _CheckboxTreeViewer"])
	protected def Tree _xDummyTreeContainer() {}
	
	@XtendNode(usingConstructors=true)	
	protected def CheckboxTreeViewer _CheckboxTreeViewer() {}
	
	@XtendNode(usingConstructors=true, inserts=": _TreeViewerColumn  _TreeViewerFocusCellManager")
	protected def TreeViewer _TreeViewer() {}



	@XtendNode(usingConstructors=true)	
	protected def TreeViewerColumn _TreeViewerColumn() {}
	
	@XtendNode(usingConstructors=true)	
	protected def TreeViewerFocusCellManager _TreeViewerFocusCellManager(){ }
		
		
}