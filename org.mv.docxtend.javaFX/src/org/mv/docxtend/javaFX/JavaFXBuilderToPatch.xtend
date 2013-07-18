package org.mv.docxtend.javaFX

import java.util.Collection
import javafx.animation.FadeTransition
import javafx.animation.FillTransition
import javafx.animation.KeyFrame
import javafx.animation.KeyValue
import javafx.animation.ParallelTransition
import javafx.animation.PathTransition
import javafx.animation.PauseTransition
import javafx.animation.RotateTransition
import javafx.animation.ScaleTransition
import javafx.animation.SequentialTransition
import javafx.animation.StrokeTransition
import javafx.animation.Timeline
import javafx.animation.TranslateTransition
import javafx.collections.FXCollections
import javafx.event.ActionEvent
import javafx.event.EventHandler
import javafx.event.EventTarget
import javafx.geometry.Rectangle2D
import javafx.scene.Group
import javafx.scene.ImageCursor
import javafx.scene.Node
import javafx.scene.ParallelCamera
import javafx.scene.Parent
import javafx.scene.PerspectiveCamera
import javafx.scene.Scene
import javafx.scene.SnapshotParameters
import javafx.scene.canvas.Canvas
import javafx.scene.canvas.GraphicsContext
import javafx.scene.chart.PieChart
import javafx.scene.control.Accordion
import javafx.scene.control.Button
import javafx.scene.control.CheckBox
import javafx.scene.control.CheckMenuItem
import javafx.scene.control.ColorPicker
import javafx.scene.control.ContextMenu
import javafx.scene.control.Control
import javafx.scene.control.CustomMenuItem
import javafx.scene.control.Hyperlink
import javafx.scene.control.Label
import javafx.scene.control.Labeled
import javafx.scene.control.Menu
import javafx.scene.control.MenuBar
import javafx.scene.control.MenuButton
import javafx.scene.control.MenuItem
import javafx.scene.control.Pagination
import javafx.scene.control.PasswordField
import javafx.scene.control.ProgressBar
import javafx.scene.control.ProgressIndicator
import javafx.scene.control.RadioButton
import javafx.scene.control.RadioMenuItem
import javafx.scene.control.ScrollBar
import javafx.scene.control.ScrollPane
import javafx.scene.control.Separator
import javafx.scene.control.SeparatorMenuItem
import javafx.scene.control.Slider
import javafx.scene.control.SplitMenuButton
import javafx.scene.control.SplitPane
import javafx.scene.control.Tab
import javafx.scene.control.TabPane
import javafx.scene.control.TextArea
import javafx.scene.control.TextField
import javafx.scene.control.TitledPane
import javafx.scene.control.ToggleButton
import javafx.scene.control.ToolBar
import javafx.scene.control.Tooltip
import javafx.scene.control.cell.MapValueFactory
import javafx.scene.control.cell.PropertyValueFactory
import javafx.scene.effect.Blend
import javafx.scene.effect.Bloom
import javafx.scene.effect.BoxBlur
import javafx.scene.effect.ColorAdjust
import javafx.scene.effect.ColorInput
import javafx.scene.effect.DisplacementMap
import javafx.scene.effect.DropShadow
import javafx.scene.effect.GaussianBlur
import javafx.scene.effect.Glow
import javafx.scene.effect.ImageInput
import javafx.scene.effect.InnerShadow
import javafx.scene.effect.Light
import javafx.scene.effect.Lighting
import javafx.scene.effect.MotionBlur
import javafx.scene.effect.PerspectiveTransform
import javafx.scene.effect.Reflection
import javafx.scene.effect.SepiaTone
import javafx.scene.effect.Shadow
import javafx.scene.image.Image
import javafx.scene.image.ImageView
import javafx.scene.input.KeyCharacterCombination
import javafx.scene.input.KeyCode
import javafx.scene.input.KeyCodeCombination
import javafx.scene.input.KeyCombination
import javafx.scene.input.Mnemonic
import javafx.scene.layout.AnchorPane
import javafx.scene.layout.BorderPane
import javafx.scene.layout.ColumnConstraints
import javafx.scene.layout.FlowPane
import javafx.scene.layout.GridPane
import javafx.scene.layout.HBox
import javafx.scene.layout.Pane
import javafx.scene.layout.Region
import javafx.scene.layout.RowConstraints
import javafx.scene.layout.StackPane
import javafx.scene.layout.TilePane
import javafx.scene.layout.VBox
import javafx.scene.media.Media
import javafx.scene.media.MediaPlayer
import javafx.scene.media.MediaView
import javafx.scene.paint.Color
import javafx.scene.paint.ImagePattern
import javafx.scene.paint.LinearGradient
import javafx.scene.paint.RadialGradient
import javafx.scene.shape.Arc
import javafx.scene.shape.ArcTo
import javafx.scene.shape.Circle
import javafx.scene.shape.ClosePath
import javafx.scene.shape.CubicCurve
import javafx.scene.shape.CubicCurveTo
import javafx.scene.shape.Ellipse
import javafx.scene.shape.HLineTo
import javafx.scene.shape.Line
import javafx.scene.shape.LineTo
import javafx.scene.shape.MoveTo
import javafx.scene.shape.Path
import javafx.scene.shape.Polygon
import javafx.scene.shape.Polyline
import javafx.scene.shape.QuadCurve
import javafx.scene.shape.QuadCurveTo
import javafx.scene.shape.Rectangle
import javafx.scene.shape.SVGPath
import javafx.scene.shape.Shape
import javafx.scene.shape.VLineTo
import javafx.scene.text.Font
import javafx.scene.text.Text
import javafx.scene.transform.Affine
import javafx.scene.transform.Rotate
import javafx.scene.transform.Scale
import javafx.scene.transform.Shear
import javafx.scene.transform.Translate
import javafx.scene.web.HTMLEditor
import javafx.scene.web.WebView
import javafx.stage.Popup
import javafx.stage.Screen
import javafx.stage.Stage
import javafx.util.Duration
import org.mv.docxtend.XtendNode
import org.mv.docxtend.XtendTree

/**
 * Xtend builder for JavaFX 2.2
 *<br/><br/>
 * Every time it was possible, this builder only use the JavaFX constructors that do not have parameters<br/>
 * exception : _Scene _PieChart.Data _AreaChart _Color _Font ...
 *<br/><br/>
 * This DocXtend builder must be extended with JavaFXBuilder.java
 * to turn around the bug of the generic type parameters that can't be passed to
 * duplicated method {@link https://bugs.eclipse.org/bugs/show_bug.cgi?id=412703}
 * 
 * More about DocXtend : {@link http: http://mvvvv.github.io/DocXtend/}
 * @author Matthieu Vidal
 * @version 0.1
 */
@XtendTree
class JavaFXBuilderToPatch {
	var cuucuu = typeof(FXCollections)	// stupid warning
	def killWarning(){cuucuu = null}	// stupid warning
	
	
	//----------------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------------------------
	/**
	 * <b>Group</b> and <b>Pane</b> ... :<br/> ---> getChildren().add(node)<br/><br>
	 * <b>Popup</b> :<br/> --->  getContent().add(node)<br/><br>
	 * <b>TitledPane</b>,<b>ScrollPane</b> and <b>Tab</b>:<br/> --->  getContent().add(node)<br/><br>
	 * <b>SplitPane</b>,<b>ToolBar</b> :<br/> --->  getItems().add(node)<br/><br>
	 * 
	 * @param parent is the container
	 * @param node the node to add
	 * @throws IllegalAccessError if a node is insert in an EventTarget Object that is not in the list above.
	 */
	protected def dispatch dispatchContainer(EventTarget parent, Node node) 	
		{ throw new IllegalAccessError(node.class.simpleName + "(" + node.id + ")" +
			" cannot be a component of " + parent.class.simpleName ) }
	
	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(Group parent, Node node) 		{ parent.getChildren().add(node) }
	
	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(Pane parent, Node node) 		{ parent.getChildren().add(node) }

	//No : protected def dispatch dispatchContainer(BorderPane parent, Node node) 		{ }
	//No : protected def dispatch dispatchContainer(GridPane parent, Node node) 		{ }

	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(Popup parent, Node node) 		{ parent.getContent().add(node) }

	
	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(TitledPane parent, Node node) 	{ parent.setContent(node) }
	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(ScrollPane parent, Node node) 	{ parent.setContent(node) }
	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(Tab parent, Node node) 		{ parent.setContent(node) }

	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(SplitPane parent, Node node) 	{ parent.getItems().add(node) }
	/**@see #dispatchContainer(EventTarget, Node) */
	protected def dispatch dispatchContainer(ToolBar parent, Node node) 	{ parent.getItems().add(node) }
	
	@XtendNode( inserts=#[
	"@dispatchContainer:_Group _Region _Canvas _Pagination
						_PieChart 
						_ImageView _MediaView
						_Button _RadioButton _ToggleButton _CheckBox  _Label _MenuButton _SplitMenuButton
						_TextArea _TextField _PasswordField _ScrollBar  
						_Slider _Separator _ProgressBar _ProgressIndicator
						_Hyperlink    _Accordion  _ColorPicker
						_MenuBar _ToolBar 
						_TabPane _TitledPane _SplitPane _ScrollPane
						_AnchorPane _BorderPane _GridPane _FlowPane _Pane _StackPane _TilePane _VBox _HBox
						_Arc _Circle _CubicCurve _Ellipse _Line _Path _Polygon _Polyline _QuadCurve _Rectangle _SVGPath _Text
						_HTMLEditor _WebView"
						/*TODO : _AreaChart _BarChart _BubbleChart _LineChart _ScatterChart _StackedAreaChart _StackedBarChart */
						/*TODO : _ChoiceBox_ListView _TableView _TreeView _ComboBox  */
		]) protected def EventTarget _xDummyContainerNode (){}
	
	
		
	//----------------------------------------------------------------------------------------------------------
	//------------javafx.animation	!!!DocXtend is not enough here as the animation subject is not the receiver
	
	@XtendNode(inserts="getKeyFrames().add: _KeyFrame") protected def _Timeline(){new Timeline()}
	@XtendNode protected def _Timeline(double targetFrame){new Timeline(targetFrame)}
	
	@XtendNode  protected def _KeyFrame (Duration time, String name, EventHandler<ActionEvent> onFinished, Collection<KeyValue> values)
		 {new KeyFrame(time, name, onFinished, values)}

	
	
	@XtendNode protected def  _FadeTransition()	{new FadeTransition}
	
	public def  _FadeTransition(Node node, (FadeTransition) => void init)	{
		val obj = _FadeTransition => init
		obj.setNode(node)
		return obj
	}

	@XtendNode protected def _FillTransition() {new FillTransition}
	
	public def  _FillTransition(Shape shape, (FillTransition) => void init)	{
		val obj = _FillTransition => init
		obj.setShape(shape)
		return obj
	}

	@XtendNode(inserts = "getChildren().add : 	_FadeTransition _FillTransition _PathTransition _PauseTransition _RotateTransition 
												 _ScaleTransition _StrokeTransition _TranslateTransition")
		public def  _ParallelTransition(Node node, (ParallelTransition) => void init)	{
		val obj = new ParallelTransition(node) => init
		obj.setNode(node)
		return obj
	}

	@XtendNode (inserts="setPath: _Path") protected def  _PathTransition()	{new PathTransition}
	
	public def  _PathTransition(Node node, (PathTransition) => void init)	{
		val obj = _PathTransition => init
		obj.setNode(node)
		return obj
	}	

	@XtendNode protected def _PauseTransition() {new PauseTransition}

	
	@XtendNode protected def  _RotateTransition()	{new RotateTransition}
	
	public def  _RotateTransition(Node node, (RotateTransition) => void init)	{
		val obj = _RotateTransition => init
		obj.setNode(node)
		return obj
	}

	@XtendNode protected def  _ScaleTransition()	{new ScaleTransition}
	
	public def  _ScaleTransition(Node node, (ScaleTransition) => void init)	{
		val obj = _ScaleTransition => init
		obj.setNode(node)
		return obj
	}

	@XtendNode(inserts = "getChildren().add : 	_FadeTransition _FillTransition _PathTransition _PauseTransition _RotateTransition 
												 _ScaleTransition _StrokeTransition _TranslateTransition")
		public def  _SequentialTransition(Node node, (SequentialTransition) => void init)	{
		val obj = new SequentialTransition(node) => init
		obj.setNode(node)
		return obj
	}

	@XtendNode protected def _StrokeTransition() {new StrokeTransition}
	
	public def  _StrokeTransition(Shape shape, (StrokeTransition) => void init)	{
		val obj = _StrokeTransition => init
		obj.setShape(shape)
		return obj
	}

	@XtendNode protected def  _TranslateTransition()	{new TranslateTransition}
	
	public def  _TranslateTransition(Node node, (TranslateTransition) => void init)	{
		val obj = _TranslateTransition => init
		obj.setNode(node)
		return obj
	}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.geometry	
	@XtendNode(usingConstructors = true) protected def Rectangle2D _Rectangle2D(Object... varArgs)		{}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene
	@XtendNode(inserts=":_Scene ")	protected def Parent _xDummyParent() {}  

	@XtendNode(usingConstructors = true, inserts= #[ 
		"setCamera	: _ParallelCamera _PerspectiveCamera",
		"setCursor	: _ImageCursor"
		])	protected def Scene _Scene() {} 

	@XtendNode protected def _ParallelCamera() 		{new ParallelCamera}
	@XtendNode protected def _PerspectiveCamera() 	{new PerspectiveCamera}

	@XtendNode protected def _ImageCursor() 	{new ImageCursor}



	/**@see #_xDummyContainerNode*/
	@XtendNode protected def  _Group() {new Group}		

	@XtendNode(inserts=#[ 			
			"setCursor : _ImageCursor",
			": _Mnemonic",
			"getTransforms().add : _Affine _Rotate _Scale _Shear _Translate",
			"setEffect : _Blend _Bloom _BoxBlur _ColorAdjust _ColorInput _DisplacementMap _DropShadow _GaussianBlur _Glow 
						 _ImageInput _InnerShadow _Lighting _MotionBlur _PerspectiveTransform _Reflection _SepiaTone _Shadow"
		]) protected def Node _xDummyNode() {}
	
	@XtendNode (inserts= #[
		"setCamera		: _ParallelCamera _PerspectiveCamera",
		"setTransform	: _Affine _Rotate _Scale _Shear _Translate"
		])protected def _SnapshotParameter()	{new SnapshotParameters}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.canvas
	@XtendNode protected def _Canvas()	{new Canvas }
	@XtendNode(inserts=#[
			"setFont 	: _Font",
			"setTransform : _Affine",
			"setFill 	: _Color _ImagePattern _LinearGradient _RadialGradient",	 			
			"setEffect 	: _Blend _Bloom _BoxBlur _ColorAdjust _ColorInput _DisplacementMap _DropShadow _GaussianBlur _Glow 
						 _ImageInput _InnerShadow _Lighting _MotionBlur _PerspectiveTransform _Reflection _SepiaTone _Shadow"
	]) protected def GraphicsContext _xDummyGraphicContext() {}

	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.charts
	@XtendNode(inserts=#["getData().add : _PieChart_Data" ]) protected def _PieChart()	{new PieChart}
	@XtendNode protected def  _PieChart_Data(String name, Double value)					{new PieChart.Data(name, value)}
	/* Cannot be processed see JavaFXBuilder4Generics
	@XtendNode(inserts=#[       
		"getData().add : _XYChart_Series"
	])	protected def <X,Y> XYChart<X,Y>  _DummyXYChart()	{}
	@XtendNode (inserts="getData().add : _XYChart_Data") 	protected def <X,Y> _XYChart_Series() {new XYChart.Series<X,Y>()}
	@XtendNode 												protected def <X,Y> _XYChart_Data()   {new XYChart.Data<X,Y> ()}

	@XtendNode protected def <X,Y> _AreaChart(Axis<X> xAxis, Axis<Y> yAxis)			{new AreaChart<X,Y>(xAxis,yAxis)}
	@XtendNode protected def <X,Y> _BarChart(Axis<X> xAxis, Axis<Y> yAxis)			{new BarChart<X,Y>(xAxis,yAxis)}
	@XtendNode protected def <X,Y> _BubbleChart(Axis<X> xAxis, Axis<Y> yAxis)		{new BubbleChart<X,Y>(xAxis,yAxis)}
	@XtendNode protected def <X,Y> _LineChart(Axis<X> xAxis, Axis<Y> yAxis)			{new LineChart<X,Y>(xAxis,yAxis)}
	@XtendNode protected def <X,Y> _ScatterChart(Axis<X> xAxis, Axis<Y> yAxis)		{new ScatterChart<X,Y>(xAxis,yAxis)}
	@XtendNode protected def <X,Y> _StackedAreaChart(Axis<X> xAxis, Axis<Y> yAxis)	{new StackedAreaChart<X,Y>(xAxis,yAxis)}
	@XtendNode protected def <X,Y> _StackedBarChart(Axis<X> xAxis, Axis<Y> yAxis)	{new StackedBarChart<X,Y>(xAxis,yAxis)}
    */
	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.control
	@XtendNode(inserts=#[ 	"setContextMenu	:_ContextMenu ",   
							"setTooltip 	: _Tooltip"	]) 
			protected def Control 		__xDummyControl() {}

	@XtendNode(inserts=#[ 	
		"setGraphic	:_ImageView ", 
		"setFont : _Font"	]) 
			protected def Labeled 		__xDummyLabeled() {}

	@XtendNode(inserts="getPanes().add : _TitledPane") 
			protected def _Accordion() 			{new Accordion}
	
	/**@see #_xDummyContainerNode*/
	@XtendNode protected def _TitledPane() {new TitledPane}
	
	/**@see #_xDummyContainerNode*/
	@XtendNode protected def _ScrollPane() {new ScrollPane}
	
	/**@see #_xDummyContainerNode*/
	@XtendNode protected def _Tab(){new Tab}
	
	/**@see #_xDummyContainerNode*/
	@XtendNode protected def  _SplitPane() {new SplitPane}
	
	@XtendNode(
			inserts="getItems().add :_Menu _MenuItem _RadioMenuItem _CheckMenuItem _CustomMenuItem _SeparatorMenuItem")	
			protected def  _ContextMenu() {new ContextMenu}
		
	@XtendNode( inserts="getMenus().add : _Menu") protected def _MenuBar() 					{new MenuBar}
	@XtendNode( inserts="getItems().add : _Menu _MenuItem _RadioMenuItem _CheckMenuItem _CustomMenuItem _SeparatorMenuItem")	
			protected def _Menu() {new Menu}
	@XtendNode( inserts="getItems().add : _Menu _MenuItem _RadioMenuItem _CheckMenuItem _CustomMenuItem _SeparatorMenuItem")	
			protected def _MenuButton() 				{new MenuButton}
	@XtendNode( inserts="getItems().add : _Menu _MenuItem _RadioMenuItem _CheckMenuItem _CustomMenuItem _SeparatorMenuItem")	
			protected def _SplitMenuButton() 			{new SplitMenuButton}
	@XtendNode(inserts="setAccelerator :_KeyCharacterCombination _KeyCodeCombination") 
			protected def _MenuItem() 					{new MenuItem}
	@XtendNode protected def _RadioMenuItem() 				{new RadioMenuItem("text To Set !!")}
	@XtendNode protected def _CheckMenuItem() 				{new CheckMenuItem}
	@XtendNode protected def _CustomMenuItem() 				{new CustomMenuItem}
	@XtendNode protected def _SeparatorMenuItem() 			{new SeparatorMenuItem}
	
	@XtendNode(
			inserts="getItems().add : _Button _Separator" /*TODO...*/) 
			protected def _ToolBar() 					{new ToolBar}
	

	//----------------------------------------------------------------------------------------------------------
	//----Controls basic  
	@XtendNode	protected def _Button() 					{new Button}

	@XtendNode	protected def _RadioButton() 				{new RadioButton}
	@XtendNode	protected def _ToggleButton() 				{new ToggleButton}
	@XtendNode	protected def _CheckBox() 					{new CheckBox}
	
			
	@XtendNode	protected def  _ColorPicker()				{new ColorPicker()}

	@XtendNode	protected def _Label() 						{new Label}

	@XtendNode	protected def _TextArea() 					{new TextArea}
	@XtendNode	protected def _TextField() 					{new TextField}
	@XtendNode	protected def _PasswordField() 				{new PasswordField}

	@XtendNode	protected def _ScrollBar() 					{new ScrollBar}

	@XtendNode protected def _Slider()						{new Slider} 
	@XtendNode protected def _Separator()					{new Separator} 

	@XtendNode protected def _ProgressBar()					{new ProgressBar}
	@XtendNode protected def _ProgressIndicator()			{new ProgressIndicator}

	@XtendNode protected def _Hyperlink() 					{new Hyperlink}
	@XtendNode protected def _Tooltip() 					{new Tooltip }
	
	
	@XtendNode protected def _Pagination() 					{new Pagination}
	
	@XtendNode(inserts="getTabs().add : _Tab") protected def _TabPane(){new TabPane}

	// TODO : Generics are in JavaFXBuilder4Generics.java
	//	@XtendNode( /*inserts="getItems().add : _Button _Separator" /*TODO...*/) protected def <T> _ListView() {new ListView<T>}  
	//	
	//	@XtendNode( /*inserts="getItems().add : /*TODO...*/) protected def <T> _ChoiceBox()				{new ChoiceBox<T>()}
	//
	//	@XtendNode( inserts = #[ "getColumns().add : _TableColumn" /*,"getItems().add ...*/ ]) 
	//		protected def <S> _TableView(){new TableView<S>} 		
	//	@XtendNode (inserts = #[ 
	//		"setCellValueFactory 	: _PropertyValueFactory _MapValueFactory")]
	//		protected def <S,T> _TableColumn() {new TableColumn<S,T>} 
	@XtendNode protected def <S,T> _PropertyValueFactory(String property) {new PropertyValueFactory<S,T>(property)}
	@XtendNode protected def <T> _MapValueFactory(String property) {new MapValueFactory<T>(property)}


	//	
	//	
	//	@XtendNode(inserts = #["setRoot 			: _TreeItem _CheckBoxTreeItem"])	
	//		protected def  <T> _TreeView() {new TreeView<T>}
	//	@XtendNode(inserts = #["getChildren().add 	: _TreeItem _CheckBoxTreeItem"])	
	//		protected def  <T> _TreeItem() {new TreeItem<T>}
	//	@XtendNode(inserts = #["getChildren().add 	: _TreeItem _CheckBoxTreeItem"])	
	//		protected def  <T> _CheckBoxTreeItem() {new CheckBoxTreeItem<T>}
	//	
	//	
	//	@XtendNode	protected def <T>  _ComboBox() {new ComboBox<T>}
	

	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.effect     
    @XtendNode (inserts= #[
		"setTopInput : 	_Blend _Bloom _BoxBlur _ColorAdjust _ColorInput _DisplacementMap _DropShadow _GaussianBlur _Glow 
					 	_ImageInput _InnerShadow _Lighting _MotionBlur _PerspectiveTransform _Reflection _SepiaTone _Shadow" ])
			 protected def _Blend()					{new Blend} 
    @XtendNode protected def _Bloom()					{new Bloom} 
    @XtendNode protected def _BoxBlur()					{new BoxBlur} 
    @XtendNode protected def _ColorAdjust()				{new ColorAdjust} 
    @XtendNode protected def _ColorInput()				{new ColorInput} 
    @XtendNode protected def _DisplacementMap()			{new DisplacementMap} 
    @XtendNode(inserts="setColor: _Color") 									protected def _DropShadow()		{new DropShadow} 
    @XtendNode protected def _GaussianBlur()			{new GaussianBlur} 
    @XtendNode protected def _Glow()					{new Glow} 
    @XtendNode(inserts="setSource: _Image _WritableImage")					protected def _ImageInput()		{new ImageInput} 
    @XtendNode(inserts="setColor: _Color") 									protected def _InnerShadow()	{new InnerShadow} 
    @XtendNode(inserts="setLight: _LightDistant _LightPoint _LightSpot") 	protected def _Lighting()		{new Lighting} 
    @XtendNode protected def _LightDistant()			{new Light.Distant} 
    @XtendNode protected def _LightPoint()				{new Light.Point} 
    @XtendNode protected def _LightSpot()				{new Light.Spot} 
    @XtendNode protected def _MotionBlur()				{new MotionBlur} 
    @XtendNode protected def _PerspectiveTransform()	{new PerspectiveTransform} 
    @XtendNode protected def _Reflection ()				{new Reflection} 
    @XtendNode protected def _SepiaTone()				{new SepiaTone} 
    @XtendNode protected def _Shadow()					{new Shadow} 

	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.image	
	@XtendNode(inserts = #[
		"setImage 		: _Image _WritableImage",
		"setViewport 	: _Rectangle2D"]) 
		protected def _ImageView()	{new ImageView}
	@XtendNode(usingConstructors = true) protected def Image _Image(Object... varArgs)		{}
	@XtendNode(usingConstructors = true) protected def Image _WritableImage(Object... varArgs)		{}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.input
    @XtendNode protected def _KeyCharacterCombination(String character, KeyCombination.Modifier... modifiers)	
    		{new KeyCharacterCombination (character, modifiers)} 
    @XtendNode protected def _KeyCodeCombination(KeyCode code, KeyCombination.Modifier... modifiers)	
    		{new KeyCodeCombination (code, modifiers)}
    		
 	@XtendNode(usingConstructors = true, inserts="setKeyCombination : _KeyCharacterCombination _KeyCodeCombination")
 		protected def Mnemonic _Mnemonic(){}	

    		 
	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.layout
	@XtendNode protected def  _Region() {new Region}

	/**@see _xDummyContainerNode*/
	@XtendNode protected def _AnchorPane()	{new AnchorPane}
	
	/**@see _xDummyContainerNode*/
	@XtendNode protected def _BorderPane()	{new BorderPane}

	/**@see _xDummyContainerNode*/
	@XtendNode(inserts = #[
		"getColumnConstraints().add : _ColumnConstraints",
		"getRowConstraints().add : _RowConstraints"])
		 protected def _GridPane()	{new GridPane}
		 
	@XtendNode(usingConstructors = true) protected def ColumnConstraints _ColumnConstraints(Object... varArgs)	{}
	@XtendNode(usingConstructors = true) protected def RowConstraints _RowConstraints(Object... varArgs)	{}

	/**@see _xDummyContainerNode*/
	@XtendNode protected def _FlowPane()	{new FlowPane}
	
	/**@see _xDummyContainerNode*/
	@XtendNode protected def _Pane()		{new Pane}

	/**@see _xDummyContainerNode*/
	@XtendNode protected def _StackPane()	{new StackPane}
	
	/**@see _xDummyContainerNode*/
	@XtendNode protected def _TilePane()	{new TilePane}
	
	/**@see _xDummyContainerNode*/
	@XtendNode protected def _HBox()	{new HBox}
	/**@see _xDummyContainerNode*/
	@XtendNode protected def _VBox()	{new VBox}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.media
	@XtendNode(inserts=("setMediaPlayer: _MediaPlayer")) protected def _MediaView()	{new MediaView}

	@XtendNode protected def _MediaPlayer(Media media)	{new MediaPlayer(media)}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.paint ... like understandable constructors ...
	@XtendNode(usingConstructors=true) protected def LinearGradient _LinearGradient(Object... varArgs) {}
	@XtendNode(usingConstructors=true) protected def RadialGradient _RadialGradient(Object... varArgs) {} 

	//Unmodifiable list of the gradients (inserts="getStops().add:_Stop"): @XtendNode protected def _Stop(double offset, Color color)	{new Stop(offset,color)}

	@XtendNode(usingConstructors = true) protected def Color _Color(Object... varAgs){}
	@XtendNode(usingConstructors = true) protected def ImagePattern _ImagePattern(Object... varArgs)	{}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.shape     
    @XtendNode (inserts = #["setFill : _Color _ImagePattern _LinearGradient _RadialGradient"])
    	protected def Shape _xDummyShape(){}
    	
    @XtendNode protected def _Arc()					{new Arc} 
    @XtendNode protected def _Circle()				{new Circle}				
	@XtendNode protected def _CubicCurve()			{new CubicCurve}
	@XtendNode protected def _Ellipse()				{new Ellipse}
	@XtendNode protected def _Line()				{new Line}
	@XtendNode protected def _Polygon()				{new Polygon}
	@XtendNode protected def _Polyline()			{new Polyline}
	@XtendNode protected def _QuadCurve()			{new QuadCurve}
	@XtendNode protected def _Rectangle()			{new Rectangle}
	@XtendNode protected def _SVGPath()				{new SVGPath}

    @XtendNode (inserts = #["getElements().add : _ArcTo _ClosePath _CubicCurveTo _HLineTo _LineTo _MoveTo _QuadCurveTo _VLineTo"])
    	protected def _Path(){ new Path}    	
	@XtendNode protected def _ArcTo()				{new ArcTo}
	@XtendNode protected def _ClosePath()			{new ClosePath}
	@XtendNode protected def _CubicCurveTo()		{new CubicCurveTo}
	@XtendNode protected def _HLineTo()				{new HLineTo}
	@XtendNode protected def _LineTo()				{new LineTo}
	@XtendNode protected def _MoveTo()				{new MoveTo}
	@XtendNode protected def _QuadCurveTo()			{new QuadCurveTo}
	@XtendNode protected def _VLineTo()				{new VLineTo}


	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.text	
	@XtendNode(inserts="setFont : _Font") protected def _Text()				{new Text}
	@XtendNode(usingConstructors = true) protected def Font _Font(Object... varArgs)	{}
	
	
	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.transform	
	@XtendNode protected def _Affine()		{new Affine}
	@XtendNode protected def _Rotate()		{new Rotate}
	@XtendNode protected def _Scale()		{new Scale}
	@XtendNode protected def _Shear()		{new Shear}
	@XtendNode protected def _Translate()	{new Translate}
	
	
	//----------------------------------------------------------------------------------------------------------
	//------------javafx.scene.web	
	@XtendNode protected def _HTMLEditor() 					{new HTMLEditor}
	@XtendNode protected def _WebView() 					{new WebView}

	
	//----------------------------------------------------------------------------------------------------------
	//------------javafx.stage
	/**@see #_xDummyContainerNode*/
	@XtendNode  protected def _Popup()		{new Popup}
	
	@XtendNode(inserts=#[ "getScreens().add: _Screen" ])  protected def _Screen()		{new Screen}

	// Do Not : @XtendNode(inserts="setScene	:_Scene ")	protected def _Stage() {new Stage}   
	// Do Not : @XtendNode(inserts="setScene	:_Scene ")	protected def PopupWindow _xDummyPopupWindow() {}
	   
	@XtendNode(usingConstructors = true,inserts=#[ 
		"getIcons().add: _Image" ])  
		protected def _Stage()		{new Stage}

}