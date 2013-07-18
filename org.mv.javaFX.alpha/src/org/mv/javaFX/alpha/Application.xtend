package org.mv.javaFX.alpha

import javafx.animation.KeyValue
import javafx.animation.Timeline
import javafx.application.Application
import javafx.beans.value.ObservableValue
import javafx.event.ActionEvent
import javafx.geometry.Orientation
import javafx.geometry.Pos
import javafx.geometry.VPos
import javafx.scene.Group
import javafx.scene.Node
import javafx.scene.control.Button
import javafx.scene.control.Label
import javafx.scene.control.Slider
import javafx.scene.control.ToggleGroup
import javafx.scene.effect.BlendMode
import javafx.scene.effect.FloatMap
import javafx.scene.input.KeyCode
import javafx.scene.input.KeyCodeCombination
import javafx.scene.input.KeyCombination
import javafx.scene.layout.AnchorPane
import javafx.scene.layout.GridPane
import javafx.scene.layout.Region
import javafx.scene.layout.StackPane
import javafx.scene.layout.VBox
import javafx.scene.media.AudioClip
import javafx.scene.media.Media
import javafx.scene.paint.Color
import javafx.scene.paint.CycleMethod
import javafx.scene.paint.Stop
import javafx.scene.text.Font
import javafx.scene.text.FontWeight
import javafx.stage.FileChooser
import javafx.stage.Popup
import javafx.stage.Stage
import javafx.util.Duration
import org.mv.docxtend.javaFX.JavaFXBuilder

/**Here is a list of JavaFX samples created with JavaFXBuilder
 * <br/>  
 * More about DocXtend : {@link http: http://mvvvv.github.io/DocXtend/}
 * <br/>
 * @author Matthieu Vidal
 * @version 0.1
 */
class MainAppli extends Application {
	
	extension JavaFXBuilder eb = new JavaFXBuilder
	
	val services = getHostServices();
	
	 
	static def void main(String[] args) {
		
		 
		launch(args)
	}

	var Label comment 
	
	def getResourceURI (String fileName) {return services.resolveURI(services.getDocumentBase(),"resources/" + fileName);}
	
	/*Create The scene */
	override start(Stage primaryStage) {
		 
 		primaryStage.title = "Hello Xtend World !"  
		new Group => [
			primaryStage.setScene(_Scene(500, 200)[])
			 _VBox[
				_MenuBar[
					_Menu[
						text = "_Fichier"
						mnemonicParsing = true
						_MenuItem[
							text = "_Open"
							setOnAction[comment.text = "Open activated"
								val fC = new FileChooser() => [
									title = "Select a file ... for nothing"
									extensionFilters.add = new FileChooser.ExtensionFilter("*","*")
								]
								val file = fC.showOpenDialog(primaryStage)
								if (file != null )
									comment.text = "You've select " + file.toString
								else
									comment.text = "You've cancel the file chooser" 
							]
							_KeyCodeCombination(KeyCode.O, #[KeyCombination.CONTROL_DOWN])[]
						]
						_SeparatorMenuItem[]
						_MenuItem[
							text = "E_xit"
							setOnAction[comment.text = "Exit activated ... but you stay;" this.stop]
							_KeyCodeCombination(KeyCode.Q, #[KeyCombination.CONTROL_DOWN])[]
						]
					]
					_Menu[text = "_Edit"
						_MenuItem[text="Launch the window for generic"]
						setOnAction[
							val w = new GenericWindow()
							w.show
						]
					]
					_Menu[text = "_Help"
						_MenuItem [text = "Help Content"
							setOnAction[
								val p = new Popup => [
									_Rectangle[width=300 height=100 fill=Color.GREEN]
									_Label [text = "no help here ... it's a trap !!! ESC to go"]
								]
								p.show(primaryStage)
							]
						]
					]
				]
				
				_FlowPane[ 
					_Button[text="Animations" 			setOnAction [ animationPane.show ]	]
					_Button[text="Slider and Progress" 	setOnAction [ sliderPane.show ]		]
					_Button[text="Buttons" 				setOnAction [ buttonsPane.show ]	]
					_Button[text="Tool Bar" 			setOnAction [ toolbarPane.show ]	]
					_Button[text="Pagination" 			setOnAction [ paginationPane.show ]	]
					_Button[text="Panes"	 			setOnAction [ Panes.show 	]		]
					_Button[text="Effects" 				setOnAction [ effectPane.show ]		]
					_Button[text="Split Pane" 			setOnAction [ SplitPane.show ]		]
					_Button[text="Media, Audio & Web" 	setOnAction [ mediaPane.show ]		]
					_Button[text="Shapes" 				setOnAction [ shapePane.show ]		]
					_Button[text="Complex objects" 		setOnAction [ (new GenericWindow).show ]	]
				]
				
				comment = _Label [text = "Click and contemplate ..." id="comment"]

			]
		]
		
		primaryStage.show

	}
	/*Create The scene */
	def animationPane() {
		new ShowWindow( "Animation ", new AnchorPane => [
			_TabPane [
				_Tab[ text = "Fade & Scale Transition"
					_Pane [
						_Rectangle[x=20 y=20 width=200 height=100 fill = Color.BLUE ]
						_FadeTransition [fromValue = 1	toValue = 0.3
							duration = Duration.millis(1000)							
							cycleCount = Timeline.INDEFINITE
							autoReverse = true
						].play
						_Text[x=120 y=120 text= "Bonjour" _Font("Arial Bold", 60)[] 
							_ScaleTransition [ byX=1.5f byY=1.5f
								duration = Duration.millis(3000)							
								cycleCount = Timeline.INDEFINITE
								autoReverse = true
							].play
						]
						
					]
				]
				_Tab[ text = "Fill & Rotate Transition"
					_Pane [
						_Rectangle[x=20 y=20 width=200 height=100 fill = Color.BLUE 
							_FillTransition[ fromValue=Color.BLUE toValue=Color.RED
								duration = Duration.millis(3000)
								cycleCount = Timeline.INDEFINITE
								autoReverse = true
							].play
						
						]
						_Text[x=10 y=60 text= "Welcome on Xtend for JavaFX" _Font("Arial Bold", 35)[] 
							_RotateTransition [ byAngle = 180
								duration = Duration.millis(4000)
								cycleCount = Timeline.INDEFINITE
								autoReverse = true
							].play
						]
					]
				]
				_Tab[ text = "ParallelTransition"
					_Pane [
						_Rectangle[x=20 y=20 width=200 height=100 fill = Color.BLUE 
							_ParallelTransition[
								val sec2 = Duration.millis(2000)
								val sec3 = Duration.millis(3000)
								_FillTransition [fromValue=Color.BLUE toValue=Color.RED
									duration = sec2
									cycleCount = Timeline.INDEFINITE
									autoReverse = true
								]
								_FadeTransition [fromValue = 1 toValue = 0.3
									duration = sec3
									cycleCount = Timeline.INDEFINITE
									autoReverse = true
								]
							].play
						
						]
						_Text[x=10 y=60 text= "Simple code for complex logic" _Font("Arial Bold", 25)[] ]
					]
				]
				_Tab[ text = "TimeLine"
					_Pane [
						val r = _Rectangle[x=20 y=20 width=200 height=100 fill = Color.BLUE]
						val t = new Timeline => [
							cycleCount = Timeline.INDEFINITE
							autoReverse = true
							_KeyFrame (Duration.millis(500), "name" ,null,#[new KeyValue(r.xProperty(),300)])[]
						]
						t.play 
						_Text[x=10 y=60 text= "Inference every where" _Font("Arial Bold", 35)[] ]
					]
				]
				_Tab[ text = "PathTransition"
					_Pane [
						_Rectangle[x=20 y=20 width=200 height=300 fill = Color.BLUE ]
						_Text[x=10 y=80 text= "I'm moving" _Font("Arial Bold", 20)[]
							_PathTransition [
								duration = Duration.millis(3000)
								cycleCount = Timeline.INDEFINITE
								autoReverse = true
								_Path[
									_MoveTo		[x=400		y=50]
									_ArcTo 		[x=100		y=10]
									_ArcTo 		[x=300		y=150]
									_ClosePath[]
								]
							].play
						]
					]
					
				]
				_Tab[ text = "Stroke & Translate Transition"
					_Pane [
						_Rectangle[x=20 y=20 width=200 height=300 fill = Color.WHITE 
							_StrokeTransition [ fromValue=Color.BLUE toValue=Color.RED
								duration = Duration.millis(2000)
								cycleCount = Timeline.INDEFINITE
								autoReverse = true
							].play
						]
						_Text[x=10 y=80 text= "I'm moving" _Font("Arial Bold", 20)[]
							_TranslateTransition [ byX = 200
								duration = Duration.millis(2000)
								cycleCount = Timeline.INDEFINITE
								autoReverse = true
							].play
							
						]
					]
				]
			]
		])
	}
	
	
	/*Create The scene */
	def sliderPane() {
		new ShowWindow( "Sliders, Progress and scrollbar", new AnchorPane => [ 
			_VBox [spacing = 10
				_ScrollBar [orientation = Orientation.HORIZONTAL]
				_HBox[
					val pG = _ProgressBar [ progress = 1F]
					val pI = _ProgressIndicator []
					
					_Separator[ orientation = Orientation.VERTICAL]
					
					_Slider [ min=0 max=100 showTickLabels=true
						valueProperty.addListener([ObservableValue<? extends Number> ov, Number old_val, Number new_val|
	                						val progress = new_val.doubleValue / 100
	                						pG.progress = 1 - progress
	                						pI.progress = progress ])
						
					
					]
				]
			] 
		])
	}

	/*Create The scene */
	def buttonsPane() {
		new ShowWindow( "Buttons", new AnchorPane => [ 
			_VBox [spacing = 10
				_MenuButton[text = "I'm a menuButton" 
					_Mnemonic (new KeyCodeCombination(KeyCode.B,#[KeyCombination.CONTROL_DOWN]))[]
					_MenuItem[text = "I'm a menuItem"] 
					_CheckMenuItem[text = "I'm a checkMenuItem" selected = true]
					_RadioMenuItem[text = "I'm a radioMenuItem"]
				]
				
				_SplitMenuButton[text = "I'm a Split menuButton"
					_MenuItem[text = "I'm a menuItem"] 
					_CheckMenuItem[text = "I'm a checkMenuItem" selected = true]
					_RadioMenuItem[text = "I'm a radioMenuItem"]
					setOnAction[comment.text = "You've clicked the button ... well done !!"]
				]
				
				_ToolBar[
					_Tooltip[text = "I'm a toolbar"]
					_Button[ text = "One button"]
					_Button[ text = "two button"]
					_Separator[]
					_Button[ text = "three button"]
					_Button[ text = "four button"]
					_Button[ text = "five button"]
				]
				
				_Separator[]
				
				_HBox[ 
					_Label [text = "Don't know the question but the answer is : "]
					val tG = new ToggleGroup 
					_ToggleButton[text = "Maybe" 	toggleGroup = tG]
					_ToggleButton[text = "Yes" 		toggleGroup = tG]
					_ToggleButton[text = "No" 		toggleGroup = tG]
				]
				_Separator[]
				
				_ColorPicker[]

				_Separator[]

				_HBox[
					_Label[ text = "Enter the password"]
					_PasswordField []
					_Button [text = "Connexion" 
						setOnAction ([comment.text = "This is clearly an intrusion attempt !!! It's a shame !!"])
					]
				]
			]
		])
	}

	/*Create The scene */
	def toolbarPane() {
		new ShowWindow( "Link and context menu", new AnchorPane => [
			_VBox[
				_Label [text = "Right click the link !!!"];
				_Hyperlink[
					text = "www.eclipse.org/xtend/"
					_ImageView[_Rectangle2D(1, 1, 20, 40)[]]
					setOnAction([comment.text = "Where do you want to go ? It'a fake link ..."])
					_ContextMenu[ 
						_MenuItem[text = "About" setOnAction([comment.text = "About menu activated"])]
						_MenuItem[text = "Preference"
							setOnAction([comment.text = "Preferences menu activated"])]
						_CustomMenuItem[text = "Find me !" content = new Slider() hideOnClick = true]
					]
				]
			]
		])
	}

	/*Create The scene */
	def paginationPane() {
		new ShowWindow( "Pagination", new AnchorPane => [
			_VBox [
				_Pagination[
					pageCount = 10
					currentPageIndex = 0
					setPageFactory([ Integer pageIndex | {
						new VBox() => [spacing = 5;
							for (i : 1 .. pageIndex + 10)
										_Label [text = "toto " + i]
							]
						} as Node		
					])
				]
			]
		])
	}
	/*Create The scene */
	def Panes() {
		new ShowWindow( "Pane", new AnchorPane => [
			_TabPane[
				_Tab [ text = "Anchor Pane"
					_AnchorPane[setPrefSize(300,300) 
						AnchorPane.setTopAnchor( _Button [text = "Je suis top label"] , 50.0 )
						AnchorPane.setRightAnchor( _Button [text = "ich bin Right label"] , 50.0 )
						AnchorPane.setBottomAnchor(_Button [text = "I am bottom label"] , 50.0 )
						AnchorPane.setLeftAnchor( _Button [text = "yo soy left label"] , 50.0 )
						
					]
				]
				_Tab [ text = "Border Pane"
					_BorderPane [
						_Button[text="Im the first maverick Button and I do not appear"]
						top = new Button=>[text="Top Button"]
						right = new Button=>[text="Right Button"]	
						bottom = new Button=>[text = "Bottom Button"] 
						left = new Button=>[text="Left Button"]
						_Button[text="Im the second maverick Button and I do not appear"]
					]		
				]
				_Tab [ text = "Grid Pane "
					_GridPane [ 
						style = "-fx-background-color: slateblue;"
						_ColumnConstraints(50)[]
						_ColumnConstraints[]
						_ColumnConstraints[prefWidth = 50 minWidth=Region.USE_PREF_SIZE maxWidth=Region.USE_PREF_SIZE]
						_RowConstraints(50)[]
						_RowConstraints[]
						_RowConstraints[prefHeight = 50 minHeight=Region.USE_PREF_SIZE maxHeight=Region.USE_PREF_SIZE]
						_RowConstraints(50)[]
						_RowConstraints(50)[]
						_RowConstraints(50)[]
						GridPane.setConstraints (_Button[text = "Left Top" style = "-fx-background-color: white;" ], 1, 1)
						GridPane.setConstraints (_Button[text = "Center" style = "-fx-background-color: white;" ], 2, 2)
						GridPane.setConstraints (_Button[text = "Left Bottom" style = "-fx-background-color: white;" ], 3, 1)
						GridPane.setConstraints (_Button[text = "right Top" style = "-fx-background-color: white;" ], 1, 3)
						// Duplicate child :
						addRow(6, new Button=>[text="button"], new Button=>[text="button"],new Button=>[text="button"])
					]
				]
				_Tab [ text = "Flow Pane"
					_FlowPane [ vgap=8 hgap=4 prefWrapLength=300 orientation=Orientation.VERTICAL
					     for (i : 0..22 ) _Button[text = "button"+i]
					]		
				]
				_Tab [ text = "Stack Pane"
					_StackPane [ 
					     _Rectangle[width=100 height=100 fill=Color.RED]
					     _Rectangle[width=40 height=100 fill=Color.BLACK]
					     StackPane.setAlignment(_Label[text="text to show"], Pos.BOTTOM_CENTER)
					]		
				]
				_Tab [ text = "Tile Pane"
					_TilePane [ tileAlignment = Pos.CENTER_LEFT
						 prefColumns = 3
					     _Rectangle[width=100 height=100 fill=Color.RED]
					     _Rectangle[width=40 height=100 fill=Color.BLACK]
					     _Label[text="text to show"]
					     _Rectangle[width=100 height=100 fill=Color.RED]
					     _Rectangle[width=40 height=100 fill=Color.BLACK]
					     _Label[text="text to show"]
					]		
				]
			]
		])
	}
	
	
	/*Create The scene  */
	def effectPane() {
		new ShowWindow( "Effect", new AnchorPane => [
			_TabPane[
				_Tab[ text = "Part 1"
					_Group [
						_Blend[ mode = BlendMode.COLOR_BURN
							_ColorInput[ x=10 y=10 width=100 height=180 paint = Color.STEELBLUE]
						]
						_Rectangle [width=220 height=100
							_LinearGradient(0, 0, 0.25, 0.25, true, CycleMethod.REFLECT, <Stop>newArrayList( 
									new Stop(0, Color.LIGHTSTEELBLUE),
									new Stop(1, Color.PALEGREEN)))[
							] 
						]
						_Text [text = "Blend ColorInput" x=15 y=65
							fill = Color.PALEVIOLETRED
							font = Font.font(null, FontWeight.BOLD, 30)
						]

						_Rectangle[x=300 y=10 width=260 height=80 fill = Color.DARKSLATEBLUE]
						_Text[text="Bloom!" x=325 y=65 fill=Color.ALICEBLUE
							font = Font.font(null, FontWeight.BOLD, 40)
							_Bloom[threshold = 0.1]
						]
						
						_Text[text="Blurry text" x=300 y=200 fill=Color.web("0x3b596d") _Font("Arial",50)[]
							_BoxBlur[width=10 height=3 iterations=3]
						]
					]
				]
				_Tab[ text = "Part 2"
					_Group [
						_ImageView[ x=10 fitWidth=180 preserveRatio=true 
							_Image(getResourceURI("Albi.jpg"))[]
							
						]
						_ImageView[ x=200 fitWidth=180 preserveRatio= true
							_Image(getResourceURI("Albi.jpg"))[]
							_ColorAdjust[ contrast=0.1 hue=-0.5 brightness=0.1 saturation=0.2]
						]
						_ImageView[ x=390 fitWidth=180 preserveRatio= true
							_Image(getResourceURI("Albi.jpg"))[]
							_Glow[ level=0.8 ]
						]
						_Text [x=200 y=140 text = ">>> ColorAdjust"]
						_Text [x=390 y=140 text = ">>> Glow" ]
					]	
				]
				_Tab[ text = "Part 3"
					_Group [
						_Text [x=40 y=80 text = "Wavy Text -> DisplacementMap" _Font("Courrier", 35)[]
							_DisplacementMap[ 
								mapData = new FloatMap => [ width = 220 height = 200 
									for ( i : 0..width-1 ){
									    val v = (Math.sin(i / 20.0 * Math.PI) - 0.5) / 40.0
 										for (j : 0..height-1) 
     										setSamples(i, j, 0.0f,  v as float)
     								}
								]
							]
						]
						_Text[text="Drop Shadow" x=40 y=130 fill=Color.web("0x3b596d") _Font("Courrier",40)[]
							cache = true
							_DropShadow[radius=5 offsetX=3 offsetY=3 _Color(0.4,0.5,0.5,1)[]] 
						]
						_Text[text="Gaussian Blur" x=40 y=190 fill=Color.web("0x3b596d") _Font("Courrier",40)[]
							cache = true
							_GaussianBlur[radius = 5] 
						]
						_Text[text="Image Input" x=300 y=130 fill=Color.web("0x3b596d") _Font("Courrier",40)[]
							_ImageInput[ x=300 y=130 _Image(getResourceURI("Albi.jpg"))[]
								
							] 
						]
						_Text[text="Inner Shadow" x=40 y=250 fill=Color.web("0x3b596d") 
							font = Font.font(null, FontWeight.BOLD, 50)
							fill = Color.ALICEBLUE
							_InnerShadow[ offsetX = 4 offsetY = 4 _Color(0.5,0.5,0.5,0.5)[]] 
						]
					]	
				]
				_Tab[ text = "Part 4"
					_Group [
						val r1 = _Rectangle[ width=600 height=100 fill = Color.ALICEBLUE
							_Lighting [ surfaceScale = 5
								_LightDistant[ azimuth=45 elevation=30 ]
							]
						]
						_Text [x=10 y=10 text = "Lighting Distant" textOrigin = VPos.TOP
							font = Font.font("null", FontWeight.BOLD, 60)
							fill = Color.STEELBLUE
							effect = r1.effect
						]
						val r2 = _Rectangle[y=110 width=600 height=100 fill = Color.ALICEBLUE
							_Lighting [ surfaceScale = 5.0
								_LightPoint[ x=50 y=50 z=50]
							]
						]
						_Text [x=10 y=120 text = "Lighting Point" textOrigin = VPos.TOP
							font = Font.font("null", FontWeight.BOLD, 60)
							fill = Color.STEELBLUE
							effect = r2.effect
						]
						val r3 = _Rectangle[y=210 width=600 height=100 fill = Color.ALICEBLUE
							_Lighting [ surfaceScale = 5.0
								_LightSpot[ x=50 y=50 z=50 pointsAtX=0 pointsAtY=0 pointsAtZ=-50 ]
							]
						]
						_Text [x=10 y=230 text = "Lighting Spot" textOrigin = VPos.TOP
							font = Font.font("null", FontWeight.BOLD, 60)
							fill = Color.STEELBLUE
							effect = r3.effect	
						]
					]
				]
				_Tab[ text = "Part 5"
					_ScrollPane [
						_VBox[ spacing = 10
							_Text [x=10 y=10  text = "Motion Blur"
								font = Font.font("null", FontWeight.BOLD, 60)
								fill = Color.STEELBLUE
								_MotionBlur[radius=10 angle=45]
							]
							_VBox[ 
								_PerspectiveTransform[ ulx=10 uly=10 urx=310 ury=40 lrx=310 lry=60 llx=10 lly=90]
								_Text [x=10 y=200 text = "Perspective Transform for the group"
									font = Font.font("null", FontWeight.BOLD, 100)
									fill = Color.STEELBLUE
									_MotionBlur[radius=10 angle=45]
								]
							]
							
						]
					]
				]
				_Tab[ text = "Part 6"
					_Group [ 
						_Text [x=10 y=10 text = "Reflexion" textOrigin = VPos.TOP
							font = Font.font("null", FontWeight.BOLD, 60)
							fill = Color.STEELBLUE
							_Reflection[fraction=0.7]
						]
						_Text [x=10 y=160 text = "Shadow" textOrigin = VPos.TOP
							font = Font.font("null", FontWeight.BOLD, 60)
							fill = Color.STEELBLUE
							_Shadow[]
						]
						_ImageView[ x=390 fitWidth=180 preserveRatio= true
							_Image(getResourceURI("Albi.jpg"))[]
							_SepiaTone[level=0.7]
						]
						_Text= [text = "SepiaTone" x=390 y=120 ]
					]
				]
			]
		])
	}
	

	/*Create The scene */  
	def  SplitPane() {
		new ShowWindow( "SplitPane", new AnchorPane => [
			_SplitPane[ //minHeight = 400 maxWidth = 600
				orientation = Orientation.HORIZONTAL
				setDividerPositions(0.1f, 0.3f, 0.4f)
				_ToolBar[
					orientation = Orientation.VERTICAL
					_Tooltip[text = "I'm a Toolbar"]
					_Button[text = "button 1"]
					_Separator[]
					_Button[text = "button 2"]
					_Button[text = "button 3"]
				]
				_VBox[ 
					_Label[text = "This button do something : "]
					_Button[
						text = "Say 'Hello Xtend World'"
						setOnAction([ActionEvent event|System.out.println("Hello World!")])
					]
				]
				_VBox[
					_Label[text = "This canvas is smart"]
					_Canvas[ width=300 height=300
						graphicsContext2D => [
							_Color(0,1,1,0.5)[]
							_Font("Arial Bold",20.0)[]
							fillText("so smart",10,50)
							fillRect(75,75,100,100)
							fill = Color.DARKRED
							fillOval(30,30,80,140)
							_Font("Arial ",20.0)[]
							fillText("so cool",10,200)
						]
					]
				]
			]
		])
	}
	
	/*Create The scene   */
	def mediaPane() {
		new ShowWindow( "Audio, Media and Web", new AnchorPane => [
			_VBox [
		
				_TabPane[
					_Tab[text = "Play video"
						_VBox[ prefWidth=500 prefHeight=300
							val mView = _MediaView[  
								_MediaPlayer(new Media("http://download.oracle.com/otndocs/products/javafx/oow2010-2.flv"))[]								
							]
							_Button[text = "Play Video"
								setOnAction[mView.mediaPlayer.play]
							]
							_Button[text = "Stop Video"
								setOnAction[mView.mediaPlayer.stop]
							]
						]
					]
					_Tab[text = "Play sound"
						val sound = new AudioClip(getResourceURI("test.wav"))
						_Button[text = "Play Sound"
							setOnAction[sound.play()]
						]
					]	
					_Tab[text = "Web view"
						_WebView[engine.load("http://www.eclipse.org/xtend")]
					]
				]
			]
		])
	}
	/*Create The scene  */
	def shapePane() {
		new ShowWindow( "Shapes", new AnchorPane => [
			_TabPane[
				_Tab[text = "Crystal clear Path"
					_Path[
						_MoveTo			[x=0 	y=0]
						_HLineTo		[x=70]
						_QuadCurveTo	[x=120 	y=60 controlX=100 controlY=0]
						_LineTo			[x=175 	y=55]
						_ArcTo			[x=50 	y=50 radiusX=50 radiusY=50]
						_ClosePath[]
					]
				]
				_Tab[text = "Polygon Polylines & SVGPath"
					_Pane[
						_Polygon[ fill = Color.GREEN
							points.addAll(#[
								0.0,0.0,
								20.0,10.0,
								10.0,20.0])
						]
						_Polyline[ fill = Color.RED
							points.addAll(#[
								50.0,50.0,
								70.0,60.0,
								60.0,70.0])
						]
						_SVGPath[ fill = Color.BLUE
							content = "M40,60 C42,48 44,30 25,32"
						]
					]
				]
			]
		])
	}

}
	