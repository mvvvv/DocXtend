package org.mv.javaFX.alpha

import javafx.collections.FXCollections
import javafx.scene.chart.NumberAxis
import javafx.scene.control.Label
import javafx.scene.layout.AnchorPane
import javafx.scene.layout.VBox
import javafx.scene.paint.Color
import javafx.scene.shape.Rectangle
import javafx.stage.Stage
import org.mv.docxtend.javaFX.JavaFXBuilder

/**A simple class to create a dialog window showing samples of the complex objects
 * <br/>  
 * More about DocXtend : {@link http: http://mvvvv.github.io/DocXtend/}
 * <br/>
 * @author Matthieu Vidal
 * @version 0.1
 */
class GenericWindow extends Stage {
	var cuucuu = typeof(FXCollections)	// stupid warning
	def killWarning(){cuucuu = null}	// stupid warning
	
	extension JavaFXBuilder eb = new JavaFXBuilder
	
	var Label comment 
	
	new() {
 		
		this.title="Here are the generics classes"
		new VBox => [
			this.setScene(_Scene(600, 400)[])
			_Accordion [
				
				_TitledPane [ text = "Tree<String>";
					<String>_TreeView[ 
						_TreeItem [value = "menu"
							_TreeItem [value = "Entries"];
							_TreeItem [value = "Main course"]
							_CheckBoxTreeItem[ value = "dessert"
								selected = true
								_CheckBoxTreeItem[value = "with blue jelly"];
								_CheckBoxTreeItem[value = "with red jelly" selected = true]
							]
						]
					]
				]
				_TitledPane [ text = "TableView<Person>";
					<Person>_TableView[
						editable = true
						_TableColumn[text = "Fist Name"; <Person,String>_PropertyValueFactory("firstName")[]]
						_TableColumn[text = "Last Name"; <Person,String>_PropertyValueFactory("lastName")[]]
						_TableColumn[text = "eMail"; 	 <Person,String>_PropertyValueFactory("eMail")[]]
						items += #[
							new Person("Lucien", "Dupont", "lucien@world.com"),
							new Person("Odile", "Crock", "CrockO@world.com"),
							new Person("Alber", "Durand", "albert@world.com"),
							new Person("robert", "Robert", "robert@world.com")
						]
						items.add( new Person("Marcel","Jules","marcel@lucien.com"))
					]
					
				]
				_TitledPane [ text = "ListView<?>, ChoiceBox<?> and ComboBox<?>";
					_HBox[
						_ListView[ items.all = #["hello", "Bonjour","Ave","Salut"]]
						_Separator[];
						_ChoiceBox [ items.addAll ("Fist Choice", "Second Choice", "Third Choice")];
						_Separator[];
						_ComboBox[
							items.add (new Rectangle( 32,32,Color.GREEN))
							items.add (new Rectangle( 32,32,Color.RED))
							items.add (new Rectangle( 32,32,Color.BLUE))
							
							setOnShowing ([ comment.text = "OnShowing"])
							setOnShown ([ comment.text = "OnShown"])
							
							 
						]
						
					]
				]
				_TitledPane [ text = "AreaChart"
					_VBox [
						_AreaChart( new NumberAxis(1,31,1), new NumberAxis )[
							title = "A graph very very significant"
							_XYChart_Series[ name = "May"
								_XYChart_Data[ XValue=1  YValue=20]
								_XYChart_Data[ XValue=3  YValue=15]
								_XYChart_Data[ XValue=6  YValue=15]
								_XYChart_Data[ XValue=9  YValue=8 ]
								_XYChart_Data[ XValue=12 YValue=15]
								_XYChart_Data[ XValue=15 YValue=18]
								_XYChart_Data[ XValue=18 YValue=25]
								_XYChart_Data[ XValue=21 YValue=23]
								_XYChart_Data[ XValue=31 YValue=23]
							]
							_XYChart_Series[ name = "June"
								_XYChart_Data[ XValue=1  YValue=20]
								_XYChart_Data[ XValue=3  YValue=30]
								_XYChart_Data[ XValue=6  YValue=15]
								_XYChart_Data[ XValue=9  YValue=12]
								_XYChart_Data[ XValue=12 YValue=11]
								_XYChart_Data[ XValue=15 YValue=8]
								_XYChart_Data[ XValue=18 YValue=3]
								_XYChart_Data[ XValue=21 YValue=2]
								_XYChart_Data[ XValue=31 YValue=1]
							]
						]
					]
				]
				_TitledPane [ text = "PieChart"
					_VBox [
						_PieChart[
							title = "A graph very very significant"
							_PieChart_Data("2000", 12.0)[]
							_PieChart_Data("2001", 13.5)[]
							_PieChart_Data("2005", 32.0)[]
							_PieChart_Data("2006", 11.0)[]
							_PieChart_Data("2007", 10.0)[]
						]
					]
					
				]	
			]
			comment = _Label [text = "Sometimes I change !!!" id="comment"]
			
		]
	}
}

/**A simple class to create a dialog window with a nice anchorPane
 * <br/>  
 * More about DocXtend : {@link http: http://mvvvv.github.io/DocXtend/}
 * <br/>
 * @author Matthieu Vidal
 * @version 0.1
 */
class ShowWindow extends Stage {
	
	extension JavaFXBuilder eb = new JavaFXBuilder
	
	new(String paneTitle, AnchorPane pane) { 
		
		this.title=paneTitle
		pane => [this.setScene(it._Scene(800, 600)[])
			children.forEach[
				AnchorPane.setTopAnchor(it,10.0)
				AnchorPane.setLeftAnchor(it,10.0)
				AnchorPane.setRightAnchor(it,10.0)
				AnchorPane.setBottomAnchor(it,10.0)
			]
		]
			
	}
}

/**One line Class ---> Test the TableView Person */
@Data class Person{	String firstName String lastName String eMail}
