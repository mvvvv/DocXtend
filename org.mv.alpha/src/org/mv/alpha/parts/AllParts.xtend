package org.mv.alpha.parts

import java.util.List
import javax.annotation.PostConstruct
import org.eclipse.e4.ui.di.Focus
import org.eclipse.jface.viewers.ColumnLabelProvider
import org.eclipse.jface.viewers.ILabelProviderListener
import org.eclipse.jface.viewers.IStructuredContentProvider
import org.eclipse.jface.viewers.ITableLabelProvider
import org.eclipse.jface.viewers.TableViewer
import org.eclipse.jface.viewers.Viewer
import org.eclipse.swt.SWT
import org.eclipse.swt.browser.Browser
import org.eclipse.swt.layout.GridData
import org.eclipse.swt.widgets.Composite
import org.eclipse.swt.widgets.Control
import org.eclipse.swt.widgets.DateTime
import org.eclipse.swt.widgets.Tree
import org.mv.docxtend.eclipse.jface.JfaceBuilder
import org.mv.docxtend.eclipse.swt.SwtApplicationBuilder
import org.mv.docxtend.eclipse.swt.SwtBuilder

/**The samplePart class as define by the new e4 application project creation  */
class SamplePart {

	private var TableViewer tableViewer;

	@PostConstruct
	def createComposite(Composite parent) {
		val extension swtBuilder = new SwtBuilder
		val extension jfaceBuilder = new JfaceBuilder
		
		parent => [
			_GridLayout[]

			_Label(SWT.NONE)[text = "Sample table"]

			tableViewer = _TableViewer[
				add("Sample item 1")
				add("Sample item 2")
				add("Sample item 3")
				add("Sample item 4")
				add("Sample item 5")
				table =>[ _GridData(GridData.FILL_BOTH)[] ]
			]
			_Label(SWT.NONE)[text = "Sample table"]
		]
	}

	@Focus
	public def setFocus() {
		tableViewer.getTable().setFocus();
	}
}

/**Test 1----------------------------------------*/
class SwtTestPart1 {

	var Browser browser
	@PostConstruct
	def createComposite(Composite parent) {
		val extension swtBuilder = new SwtBuilder

		parent => [
			_FillLayout[]
			browser = _Browser(SWT::None) [
				url = "http://www.eclipse.org/xtend" 	]	]	}

	@Focus
	def setFocus() {
		browser.setFocus();
	}
}



/**Test 2----------------------------------------*/ 
class SwtTestPart2 {

	var TableViewer tableViewer
	
	@PostConstruct
	def createComposite(Composite parent) {
		val extension swtBuilder = new SwtBuilder
		val extension jfaceBuilder = new JfaceBuilder
		
		parent => [
			_GridLayout[]
			tableViewer = _TableViewer[
				
				setContentProvider(new AddressBookContentProvider());
    			setInput(#[
    				new AddressEntry ("MARCEL","Lucien",  "Marcel@gagale.com"),
    				new AddressEntry ("MATHIEU","Liucien", "Matt@gagale.fr"),
    				new AddressEntry ("PASCAL","Loucien", "Pascal@gagale.re"),
    				new AddressEntry ("RENE","Gaston", "Gastonl@gagale.re"),
    				new AddressEntry ("GATOR","Ali", "AliGator@gagale.re")
    			]);
    			
    			if (false) {
					setLabelProvider(new AddressBookLabelProvider());
					table => [
						_TableColumn(SWT::LEFT)[text = "First Name"]
						_TableColumn(SWT::LEFT)[text = "Last Name"]
						_TableColumn(SWT::LEFT)[text = "Email"]
					]
				} else {
					_TableViewerColumn(SWT::LEFT) [	column.text = "First Name"
						labelProvider = new AddressBookColumnLabelProvider(0)
					]
					_TableViewerColumn(SWT::LEFT) [	column.text = "LastName"
						labelProvider = new AddressBookColumnLabelProvider(1)
					]
					_TableViewerColumn(SWT::RIGHT) [column.text = "Email"
						labelProvider = new AddressBookColumnLabelProvider(2)
					]

				}
				table => [
					headerVisible = true
					linesVisible = true
					_GridData(SWT::NONE)[
						verticalAlignment = GridData::FILL;
						horizontalSpan = 3;
						grabExcessHorizontalSpace = true;
						grabExcessVerticalSpace = true;
						horizontalAlignment = GridData::FILL;
					]
				]
			]
		]
	    tableViewer.refresh
    	tableViewer.table.columns.forEach[pack]
	}

	@Focus
	def setFocus() {
		tableViewer.getTable().setFocus();
	}
}

@Data
class AddressEntry {
  private var String lastName;
  private var String firstName;
  private var String email;
}


class AddressBookContentProvider implements IStructuredContentProvider {
  override Object[] getElements(Object inputElement) {
    return ( inputElement as List<AddressEntry>).toArray()
  }
  override dispose() {}
  override  inputChanged (Viewer viewer, Object oldInput, Object newInput) { }
}


class AddressBookColumnLabelProvider extends ColumnLabelProvider {
	 val int indexC;
	 new (int columnIndex) {
	 	indexC = columnIndex
	 }
	 
	 override getText(Object element) {
        val ae = element as AddressEntry;
         switch (indexC) {
	    	case 0: return ae.getFirstName()
    		case 1: return ae.getLastName()
    		case 2: return ae.getEmail()
    	}
    	return "";
     }
}


class AddressBookLabelProvider implements ITableLabelProvider {
  override getColumnImage(Object element, int columnIndex) { return null }
  
  override getColumnText(Object element, int columnIndex) {
    val ae = element as AddressEntry;
    switch (columnIndex) {
	    case 0: return ae.getFirstName()
    	case 1: return ae.getLastName()
    	case 2: return ae.getEmail()
    }
    return "";
  }
  override  addListener(ILabelProviderListener listener) { }
  override dispose() {}
  override isLabelProperty(Object element, String property) { return true}
  override removeListener(ILabelProviderListener listener) {}
}




/**Test 3----------------------------------------*/
class SwtTestPart3 {

	var Tree tree

	@PostConstruct
	def createComposite(Composite parent) { 
		val extension swtBuilder = new SwtBuilder
		val t = new SwtApplicationBuilder

		parent => [
			_FillLayout(SWT::VERTICAL)[] 

			_Group(SWT::BORDER) [
				_FillLayout(SWT::VERTICAL)[] 
				_Label(SWT::NONE)[text = "DateTime, Link And Tree Sample"]
				_DateTime(SWT::TIME)[]
				_Link(SWT::BORDER) [
					text = "Following this sample <A>http://www.eclipse.org/xtend/</A> ."
					addListener(SWT::Selection) [ 
						t._MessageBox((widget as Control).shell, SWT::OK) [
							text = "oh no !!"
							message = "Why did you click !!!????     Why ???!!!"
						].open()]]]

			_DateTime(SWT::CALENDAR)[
				addListener(SWT::Selection)[
					val w = widget as DateTime
						t._MessageBox((widget as Control).shell, SWT::OK) [
							message = w.month + "/" + w.day + " year " + w.year
						].open()]]

			tree = _Tree(SWT::BORDER)[
				_TreeItem(SWT::NONE) [text = "youhouu"
					_TreeItem(SWT::BORDER)[text="youpi"]]
				_TreeItem(SWT::NONE) [text = "gabouu"
					_TreeItem(SWT::BORDER)[text="glouppsss"]
					_TreeItem(SWT::BORDER)[text="glouppsss"]
					_TreeItem(SWT::BORDER)[text="glouppsss"]]]
		]
	}


	@Focus
	def setFocus() {
		tree.setFocus();
	}
}