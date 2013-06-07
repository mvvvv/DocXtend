package org.mv.docxtend.eclipse.swt

import org.eclipse.swt.browser.Browser
import org.eclipse.swt.browser.BrowserFunction
import org.eclipse.swt.custom.CBanner
import org.eclipse.swt.custom.CCombo
import org.eclipse.swt.custom.CLabel
import org.eclipse.swt.custom.CTabFolder
import org.eclipse.swt.custom.CTabItem
import org.eclipse.swt.custom.ControlEditor
import org.eclipse.swt.custom.SashForm
import org.eclipse.swt.custom.ScrolledComposite
import org.eclipse.swt.custom.StyledText
import org.eclipse.swt.custom.StyledTextDropTargetEffect
import org.eclipse.swt.custom.TableCursor
import org.eclipse.swt.custom.TableEditor
import org.eclipse.swt.dnd.DragSource
import org.eclipse.swt.dnd.DragSourceEffect
import org.eclipse.swt.dnd.DropTarget
import org.eclipse.swt.dnd.DropTargetEffect
import org.eclipse.swt.dnd.TableDragSourceEffect
import org.eclipse.swt.dnd.TableDropTargetEffect
import org.eclipse.swt.dnd.TreeDragSourceEffect
import org.eclipse.swt.dnd.TreeDropTargetEffect
import org.eclipse.swt.graphics.Drawable
import org.eclipse.swt.graphics.GC
import org.eclipse.swt.layout.FillLayout
import org.eclipse.swt.layout.FormLayout
import org.eclipse.swt.layout.GridData
import org.eclipse.swt.layout.GridLayout
import org.eclipse.swt.layout.RowLayout
import org.eclipse.swt.opengl.GLCanvas
import org.eclipse.swt.widgets.Button
import org.eclipse.swt.widgets.Canvas
import org.eclipse.swt.widgets.Caret
import org.eclipse.swt.widgets.Combo
import org.eclipse.swt.widgets.Composite
import org.eclipse.swt.widgets.Control
import org.eclipse.swt.widgets.CoolBar
import org.eclipse.swt.widgets.CoolItem
import org.eclipse.swt.widgets.DateTime
import org.eclipse.swt.widgets.Decorations
import org.eclipse.swt.widgets.ExpandBar
import org.eclipse.swt.widgets.ExpandItem
import org.eclipse.swt.widgets.Group
import org.eclipse.swt.widgets.IME
import org.eclipse.swt.widgets.Label
import org.eclipse.swt.widgets.Link
import org.eclipse.swt.widgets.List
import org.eclipse.swt.widgets.Menu
import org.eclipse.swt.widgets.MenuItem
import org.eclipse.swt.widgets.ProgressBar
import org.eclipse.swt.widgets.Sash
import org.eclipse.swt.widgets.Scale
import org.eclipse.swt.widgets.Slider
import org.eclipse.swt.widgets.Spinner
import org.eclipse.swt.widgets.TabFolder
import org.eclipse.swt.widgets.TabItem
import org.eclipse.swt.widgets.Table
import org.eclipse.swt.widgets.TableColumn
import org.eclipse.swt.widgets.TableItem
import org.eclipse.swt.widgets.Text
import org.eclipse.swt.widgets.ToolBar
import org.eclipse.swt.widgets.ToolItem
import org.eclipse.swt.widgets.Tracker
import org.eclipse.swt.widgets.Tree
import org.eclipse.swt.widgets.TreeColumn
import org.eclipse.swt.widgets.TreeItem
import org.mv.docxtend.XtendNode
import org.mv.docxtend.XtendTree

/** 
 * This class will be xtend(ed)  to a class setting the hierarchical tree of  "Standard Widget Toolkit" <br/><br/>
 * 
 * All the xtend(tion) are based upon the "Model Object" (Button Label Combo ...) <br/>
 *  
 *
 * @author mvidal           
 * @version 0.1         
 * @see org.mv.docxtend.eclipse.jface.JfaceBuilder.JfaceBuilder   
 * @See SwtApplicationBuilder    
 */
@XtendTree  
class SwtBuilder { 
	
	
	@XtendNode(usingConstructors=true, inserts=#[
			"			: _Composite _Group _Button _Label _Text _Combo _List 
						  _Link  _ProgressBar _Sash _Scale _Slider _Spinner _TabFolder _Browser _Tracker _DateTime 
						  _Table _Tree _Canvas _GLCanvas _ToolBar _CoolBar
						  _CBanner _CCombo _CLabel _ControlEditor 
						  _CTabFolder _SashForm _ScrolledComposite  _StyledText",  
						  
			"setLayout 	: _FillLayout _RowLayout _GridLayout _FormLayout"])
	protected def Composite _Composite() {}

	@XtendNode(usingConstructors=true)	protected def Group _Group() {}


	//---Dummy container from super classes ...
	@XtendNode(inserts=":_Menu")protected def Decorations 	__xTendNodeDecorationContainer() {}
	
	
	@XtendNode(inserts=#[
			"				:_Menu _DragSource _DragSourceEffect _DropTarget _DropTargetEffect",
			"setLayoutData	: _GridData"])
	protected def Control 		__xTendNodeControlContainer() {}

	//----Menu
	@XtendNode(usingConstructors=true, inserts=":_Menu _MenuItem")	protected def Menu _Menu() {}
	@XtendNode(usingConstructors=true, inserts=":_Menu") protected def MenuItem _MenuItem() {}
	
	//----Drag & Drop
	@XtendNode(usingConstructors=true)	protected def DragSource _DragSource() {}
	@XtendNode(usingConstructors=true)	protected def DragSourceEffect _DragSourceEffect() {}
	@XtendNode(usingConstructors=true)	protected def DropTarget _DropTarget() {}
	@XtendNode(usingConstructors=true)	protected def DropTargetEffect _DropTargetEffect() {}
	

	//----SetLayout
	@XtendNode(usingConstructors=true)  protected def FillLayout _FillLayout(Object... varArgs) {}
	@XtendNode(usingConstructors=true)  protected def RowLayout  _RowLayout (Object... varArgs)	{}
	@XtendNode(usingConstructors=true)  protected def FormLayout _FormLayout(Object... varArgs) {}
	@XtendNode(usingConstructors=true)  protected def GridLayout _GridLayout(Object... varArgs) {}
			


	//----Controls basic
	@XtendNode(usingConstructors=true)	protected def Button _Button() {}

	@XtendNode(usingConstructors=true)	protected def Label _Label() {}

	@XtendNode(usingConstructors=true)	protected def Text _Text() {}

	@XtendNode(usingConstructors=true)	protected def Combo _Combo() {}

	@XtendNode(usingConstructors=true)	protected def List _List() {}


		
	//----Controls more complex
	@XtendNode(usingConstructors=true) protected def Link _Link() {}

	@XtendNode(usingConstructors=true) protected def ProgressBar _ProgressBar(){}

	@XtendNode(usingConstructors=true) protected def Sash _Sash(){}

	@XtendNode(usingConstructors=true) protected def Scale _Scale(){}
 
	@XtendNode(usingConstructors=true) protected def Slider _Slider(){} 

	@XtendNode(usingConstructors=true) protected def Spinner _Spinner(){}
	 
	@XtendNode(usingConstructors=true) protected def DateTime _DateTime(){}
	 
	@XtendNode(usingConstructors=true) protected def Tracker _Tracker(){}

	@XtendNode(usingConstructors=true, inserts=":_TabItem") protected def TabFolder _TabFolder(){}
	@XtendNode(usingConstructors=true) protected def TabItem _TabItem(){}
	
	@XtendNode(usingConstructors=true, inserts=": _BrowserFunction") protected def Browser _Browser(){}
	@XtendNode(usingConstructors=true) protected def BrowserFunction _BrowserFunction(){}

	

	//-----Controls Table...  
	@XtendNode(usingConstructors=true, inserts=#[
			"	:	_TableColumn _TableItem _TableCursor _TableEditor
					_TableDropTargetEffect _TableDragSourceEffect"])	protected def Table _Table() {}

	@XtendNode(usingConstructors=true)	protected def GridData _GridData(Object... varArgs) {	}
	
	@XtendNode(usingConstructors=true) protected def TableColumn _TableColumn(){}

	@XtendNode(usingConstructors=true) protected def TableItem _TableItem(){}

	@XtendNode(usingConstructors=true) protected def TableCursor _TableCursor(){}

	@XtendNode(usingConstructors=true) protected def TableEditor _TableEditor(){}

	@XtendNode(usingConstructors=true)	protected def TableDropTargetEffect _TableDropTargetEffect() {}
	@XtendNode(usingConstructors=true)	protected def TableDragSourceEffect _TableDragSourceEffect() {}


	//-----Controls Tree...
	@XtendNode(usingConstructors=true, inserts=#[
			": _TreeColumn _TreeItem _TreeDropTargetEffect _TreeDragSourceEffect"])	protected def Tree _Tree() {}
			
	@XtendNode(usingConstructors=true) protected def TreeColumn _TreeColumn(){}
	
	@XtendNode(usingConstructors=true, inserts=#[":  _TreeItem "]) 	protected def TreeItem _TreeItem(){}

	@XtendNode(usingConstructors=true)	protected def TreeDropTargetEffect _TreeDropTargetEffect() {}
	@XtendNode(usingConstructors=true)	protected def TreeDragSourceEffect _TreeDragSourceEffect() {}

	
	//-----Controls graphics 
	@XtendNode(inserts=#[": _GC"])
	protected def Drawable __DummyDrawableContainer() {}
	

	@XtendNode(usingConstructors=true)	protected def GC _GC() {}


	@XtendNode(usingConstructors=true) protected def GLCanvas _GLCanvas(){}
	
	@XtendNode(usingConstructors=true) protected def Canvas _Canvas(){}
	@XtendNode(usingConstructors=true) protected def Caret _Caret(){}
	@XtendNode(usingConstructors=true) protected def IME _IME(){}

	//---Font & Color ... a new is enough ...


	//-----Controls Tools bar ..
	@XtendNode(usingConstructors=true) protected def ToolBar _ToolBar(){}
	@XtendNode(usingConstructors=true) protected def ToolItem _ToolItem(){}

	@XtendNode(usingConstructors=true) protected def CoolBar _CoolBar(){}
	@XtendNode(usingConstructors=true) protected def CoolItem _CoolItem(){}
	
	@XtendNode(usingConstructors=true) protected def ExpandBar _ExpandBar(){}
	@XtendNode(usingConstructors=true) protected def ExpandItem _ExpandItem(){}
	


	//----Customs swt controls
	@XtendNode(usingConstructors=true)	protected def CBanner _CBanner() {}

	@XtendNode(usingConstructors=true)	protected def CCombo _CCombo() {}

	@XtendNode(usingConstructors=true)	protected def CLabel _CLabel() {}

	@XtendNode(usingConstructors=true)	protected def ControlEditor _ControlEditor() {}

	@XtendNode(usingConstructors=true) protected def CTabFolder _CTabFolder(){}
	@XtendNode(usingConstructors=true) protected def CTabItem _CTabItem(){}

	@XtendNode(usingConstructors=true) protected def SashForm _SashForm(){}

	@XtendNode(usingConstructors=true) protected def ScrolledComposite _ScrolledComposite(){}

	@XtendNode(usingConstructors=true, inserts=":_StyledTextDropTargetEffect") 
		protected def StyledText _StyledText(){}
	@XtendNode(usingConstructors=true) protected def StyledTextDropTargetEffect _StyledTextDropTargetEffect(){}

	
}

