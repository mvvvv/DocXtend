package org.mv.docxtend.eclipse.swt

import org.eclipse.swt.custom.PopupList
import org.eclipse.swt.dnd.Clipboard
import org.eclipse.swt.graphics.Color
import org.eclipse.swt.graphics.Cursor
import org.eclipse.swt.graphics.Device
import org.eclipse.swt.graphics.Font
import org.eclipse.swt.graphics.Image
import org.eclipse.swt.graphics.Path
import org.eclipse.swt.graphics.Pattern
import org.eclipse.swt.graphics.Region
import org.eclipse.swt.graphics.TextLayout
import org.eclipse.swt.graphics.Transform
import org.eclipse.swt.printing.PrintDialog
import org.eclipse.swt.widgets.ColorDialog
import org.eclipse.swt.widgets.DirectoryDialog
import org.eclipse.swt.widgets.Display
import org.eclipse.swt.widgets.FileDialog
import org.eclipse.swt.widgets.FontDialog
import org.eclipse.swt.widgets.MessageBox
import org.eclipse.swt.widgets.Shell
import org.eclipse.swt.widgets.Synchronizer
import org.eclipse.swt.widgets.ToolTip
import org.mv.docxtend.XtendNode
import org.mv.docxtend.XtendTree

/** 
 * This class will be xtend(ed)  to a class setting the high level hierarchical tree of  "Standard Widget Toolkit" <br/><br/>
 * 
 * All the xtend(tion) are based upon the "Model Object" (Display Shell Label ...) <br/><br/>
 * 
 * @author mvidal      
 * @version 0.1       
 * @see SwtBuilder
 * @see org.mv.docxtend.eclipse.jface.JfaceBuilder.JfaceBuilder  
 * 
 */
@XtendTree
final class SwtApplicationBuilder {

	@XtendNode( usingConstructors=true,inserts=":_Shell _Synchronizer _Clipboard")
	protected def Display _xtendNodeRootDisplay() {
	}

	@XtendNode(usingConstructors = true, inserts="") protected def Synchronizer _Synchronizer(){}
	@XtendNode(usingConstructors = true, inserts="") protected def Clipboard _Clipboard(){}


	@XtendNode(usingConstructors=true, inserts=#[
					":	_Shell _MessageBox _ColorDialog _FontDialog _FileDialog _DirectoryDialog _PrintDialog
						_ToolTip _PopupList"])
	protected def Shell _Shell() {
	}
	
	@XtendNode(usingConstructors = true, inserts="") protected def MessageBox _MessageBox(){}
	@XtendNode(usingConstructors = true, inserts="") protected def ColorDialog _ColorDialog(){}
	@XtendNode(usingConstructors = true, inserts="") protected def FontDialog _FontDialog(){}
	@XtendNode(usingConstructors = true, inserts="") protected def FileDialog _FileDialog(){}
	@XtendNode(usingConstructors = true, inserts="") protected def DirectoryDialog _DirectoryDialog(){}
	@XtendNode(usingConstructors = true, inserts="") protected def PrintDialog _PrintDialog(){}

	@XtendNode(usingConstructors = true, inserts="") protected def ToolTip _ToolTip(){}
	@XtendNode(usingConstructors = true, inserts="") protected def PopupList _PopupList(){}


	@XtendNode(inserts=":_Image _Path _Pattern _Region _TextLayout _Transform
							_Color _Cursor _Font")
		protected def Device 		__xTendNodeDeviceContainer() {}
					
	@XtendNode(usingConstructors = true, inserts="") protected def Image _Image(){}
	@XtendNode(usingConstructors = true, inserts="") protected def Path _Path(){}
	@XtendNode(usingConstructors = true, inserts="") protected def Pattern _Pattern(){}
	@XtendNode(usingConstructors = true, inserts="") protected def Region _Region(){}
	@XtendNode(usingConstructors = true, inserts="") protected def TextLayout _TextLayout(){}
	@XtendNode(usingConstructors = true, inserts="") protected def Transform _Transform(){}

	//---Graphics
	@XtendNode(usingConstructors = true, inserts="") protected def Color _Color(){}
	@XtendNode(usingConstructors = true, inserts="") protected def Cursor _Cursor(){}
	@XtendNode(usingConstructors = true, inserts="") protected def Font _Font(){}
		

}
