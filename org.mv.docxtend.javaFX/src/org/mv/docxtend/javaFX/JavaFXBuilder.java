package org.mv.docxtend.javaFX;

import javafx.event.EventTarget;
import javafx.scene.chart.AreaChart;
import javafx.scene.chart.Axis;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.BubbleChart;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.ScatterChart;
import javafx.scene.chart.StackedAreaChart;
import javafx.scene.chart.StackedBarChart;
import javafx.scene.chart.XYChart;
import javafx.scene.chart.XYChart.Data;
import javafx.scene.chart.XYChart.Series;
import javafx.scene.control.CheckBoxTreeItem;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeView;
import javafx.scene.control.cell.PropertyValueFactory;

import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

/**
 * Xtend builder for JavaFX 2.2
 * 
 * This builder was first created with Docxtend  @XtendTree annotation {@link http: http://mvvvv.github.io/DocXtend/}
 * then the java file has been manually modified to turn around the bug of the generic type parameters that can't be passed to
 * duplicated method.
 * {@link https://bugs.eclipse.org/bugs/show_bug.cgi?id=412703}
 * 
 *@author Matthieu Vidal
 *@version 0.1
*/
public class JavaFXBuilder extends JavaFXBuilderToPatch {
  
    
  /**
   * Insert a new javafx.scene.chart.XYChart$Series&lt;X, Y&gt;[...] instance inside a {@link javafx.scene.chart.XYChart&lt;?, ?&gt;} using getData().add. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created Series&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_XYChart_Series()}
   * @see javafx.scene.chart.XYChart$Series&lt;X, Y&gt;
   */
  public <X, Y> Series<X,Y> _XYChart_Series(final XYChart<X,Y> parent, final Procedure1<Series<X,Y>> init) {
    Series<X, Y> _obj = new XYChart.Series<X,Y>();
    final Series<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<Series<X, Y>>operator_doubleArrow(_obj, init);
    XYChart<X, Y> pparent  = (XYChart<X, Y>) parent; pparent.getData().add(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.XYChart$Data&lt;X, Y&gt;[...] instance inside a {@link javafx.scene.chart.XYChart$Series&lt;?, ?&gt;} using getData().add. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created Data&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_XYChart_Data()}
   * @see javafx.scene.chart.XYChart$Data&lt;X, Y&gt;
   */
  public <X, Y> Data<X,Y> _XYChart_Data(final Series<X,Y> parent, final Procedure1<Data<X,Y>> init) {
    Data<X, Y> _obj = new XYChart.Data<X,Y>();
    final Data<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<Data<X, Y>>operator_doubleArrow(_obj, init);
    Series<X, Y> pparent  = (Series<X, Y>) parent; pparent.getData().add(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.AreaChart&lt;X, Y&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created AreaChart&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_AreaChart(javafx.scene.chart.Axis&lt;X&gt;,javafx.scene.chart.Axis&lt;Y&gt;)}
   * @see javafx.scene.chart.AreaChart&lt;X, Y&gt;
   */
  public <X, Y> AreaChart<X,Y> _AreaChart(final EventTarget parent, final Axis<X> xAxis_, final Axis<Y> yAxis_, final Procedure1<AreaChart<X,Y>> init) {
    AreaChart<X, Y> _obj = new AreaChart<X,Y>((Axis<X>)xAxis_,(Axis<Y>)yAxis_);
    final AreaChart<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<AreaChart<X, Y>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.BarChart&lt;X, Y&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created BarChart&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_BarChart(javafx.scene.chart.Axis&lt;X&gt;,javafx.scene.chart.Axis&lt;Y&gt;)}
   * @see javafx.scene.chart.BarChart&lt;X, Y&gt;
   */
  public <X, Y> BarChart<X,Y> _BarChart(final EventTarget parent, final Axis<X> xAxis_, final Axis<Y> yAxis_, final Procedure1<BarChart<X,Y>> init) {
    BarChart<X, Y> _obj = new BarChart<X,Y>((Axis<X>)xAxis_,(Axis<Y>)yAxis_);
    final BarChart<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<BarChart<X, Y>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.BubbleChart&lt;X, Y&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created BubbleChart&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_BubbleChart(javafx.scene.chart.Axis&lt;X&gt;,javafx.scene.chart.Axis&lt;Y&gt;)}
   * @see javafx.scene.chart.BubbleChart&lt;X, Y&gt;
   */
  public <X, Y> BubbleChart<X,Y> _BubbleChart(final EventTarget parent, final Axis<X> xAxis_, final Axis<Y> yAxis_, final Procedure1<BubbleChart<X,Y>> init) {
    BubbleChart<X, Y> _obj = new BubbleChart<X,Y>((Axis<X>)xAxis_,(Axis<Y>)yAxis_);
    final BubbleChart<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<BubbleChart<X, Y>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.LineChart&lt;X, Y&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created LineChart&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_LineChart(javafx.scene.chart.Axis&lt;X&gt;,javafx.scene.chart.Axis&lt;Y&gt;)}
   * @see javafx.scene.chart.LineChart&lt;X, Y&gt;
   */
  public <X, Y> LineChart<X,Y> _LineChart(final EventTarget parent, final Axis<X> xAxis_, final Axis<Y> yAxis_, final Procedure1<LineChart<X,Y>> init) {
    LineChart<X, Y> _obj = new LineChart<X,Y>((Axis<X>)xAxis_,(Axis<Y>)yAxis_);
    final LineChart<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<LineChart<X, Y>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.ScatterChart&lt;X, Y&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created ScatterChart&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_ScatterChart(javafx.scene.chart.Axis&lt;X&gt;,javafx.scene.chart.Axis&lt;Y&gt;)}
   * @see javafx.scene.chart.ScatterChart&lt;X, Y&gt;
   */
  public <X, Y> ScatterChart<X,Y> _ScatterChart(final EventTarget parent, final Axis<X> xAxis_, final Axis<Y> yAxis_, final Procedure1<ScatterChart<X,Y>> init) {
    ScatterChart<X, Y> _obj = new ScatterChart<X,Y>((Axis<X>)xAxis_,(Axis<Y>)yAxis_);
    final ScatterChart<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<ScatterChart<X, Y>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.StackedAreaChart&lt;X, Y&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created StackedAreaChart&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_StackedAreaChart(javafx.scene.chart.Axis&lt;X&gt;,javafx.scene.chart.Axis&lt;Y&gt;)}
   * @see javafx.scene.chart.StackedAreaChart&lt;X, Y&gt;
   */
  public <X, Y> StackedAreaChart<X,Y> _StackedAreaChart(final EventTarget parent, final Axis<X> xAxis_, final Axis<Y> yAxis_, final Procedure1<StackedAreaChart<X,Y>> init) {
    StackedAreaChart<X, Y> _obj = new StackedAreaChart<X,Y>((Axis<X>)xAxis_,(Axis<Y>)yAxis_);
    final StackedAreaChart<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<StackedAreaChart<X, Y>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.chart.StackedBarChart&lt;X, Y&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created StackedBarChart&lt;X, Y&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_StackedBarChart(javafx.scene.chart.Axis&lt;X&gt;,javafx.scene.chart.Axis&lt;Y&gt;)}
   * @see javafx.scene.chart.StackedBarChart&lt;X, Y&gt;
   */
  public <X, Y> StackedBarChart<X,Y> _StackedBarChart(final EventTarget parent, final Axis<X> xAxis_, final Axis<Y> yAxis_, final Procedure1<StackedBarChart<X,Y>> init) {
    StackedBarChart<X, Y> _obj = new StackedBarChart<X,Y>((Axis<X>)xAxis_,(Axis<Y>)yAxis_);
    final StackedBarChart<X, Y> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<StackedBarChart<X, Y>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  
  /**
   * Insert a new javafx.scene.control.ChoiceBox&lt;T&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created ChoiceBox&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_ChoiceBox()}
   * @see javafx.scene.control.ChoiceBox&lt;T&gt;
   */
  public <T> ChoiceBox<T> _ChoiceBox(final EventTarget parent, final Procedure1<ChoiceBox<T>> init) {
    ChoiceBox<T> _obj = new ChoiceBox<T>();
    final ChoiceBox<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<ChoiceBox<T>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  
  /**
   * Insert a new javafx.scene.control.ListView&lt;T&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created ListView&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_ListView()}
   * @see javafx.scene.control.ListView&lt;T&gt;
   */
  public <T> ListView<T> _ListView(final EventTarget parent, final Procedure1<ListView<T>> init) {
    ListView<T> _obj = new ListView<T>();
    final ListView<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<ListView<T>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.TableView&lt;S&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created TableView&lt;S&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_TableView()}
   * @see javafx.scene.control.TableView&lt;S&gt;
   */
  public <S> TableView<S> _TableView(final EventTarget parent, final Procedure1<TableView<S>> init) {
    TableView<S> _obj = new TableView<S>();
    final TableView<S> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<TableView<S>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.TableColumn&lt;S, T&gt;[...] instance inside a {@link javafx.scene.control.TableView&lt;?&gt;} using getColumns().add. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created TableColumn&lt;S, T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_TableColumn()}
   * @see javafx.scene.control.TableColumn&lt;S, T&gt;
   */
  public <S, T> TableColumn<S,T> _TableColumn(final TableView<S> parent, final Procedure1<TableColumn<S,T>> init) {
    TableColumn<S, T> _obj = new TableColumn<S,T>();
    final TableColumn<S, T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<TableColumn<S, T>>operator_doubleArrow(_obj, init);
    TableView<S> pparent  = (TableView<S>) parent; pparent.getColumns().add(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.cell.PropertyValueFactory&lt;S, T&gt;[...] instance inside a {@link javafx.scene.control.TableColumn&lt;?, ?&gt;} using setCellValueFactory. (See {@link org.mv.docxtend.javaFX.JavaFXBuilderToPatch.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created PropertyValueFactory&lt;S, T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilderToPatch#_PropertyValueFactory(java.lang.String)}
   * @see javafx.scene.control.cell.PropertyValueFactory&lt;S, T&gt;
   */
  public <S, T> PropertyValueFactory<S,T> _PropertyValueFactory(final TableColumn<S,T> parent, final String property_, final Procedure1<PropertyValueFactory<S,T>> init) {
    PropertyValueFactory<S, T> _obj = new PropertyValueFactory<S,T>((String)property_);
    final PropertyValueFactory<S, T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<PropertyValueFactory<S, T>>operator_doubleArrow(_obj, init);
   parent.setCellValueFactory(obj);							
    return (obj);
    
  }
  
//  Strange documentation do not match reality /**
//   * Insert a new javafx.scene.control.cell.MapValueFactory&lt;T&gt;[...] instance inside a {@link javafx.scene.control.TableColumn&lt;?, ?&gt;} using setCellValueFactory. (See {@link org.mv.docxtend.javaFX.JavaFXBuilderToPatch.xtend})
//   * @param parent is the container/receiver
//   * @param init is the closure builder where inserts can be added 
//   * @return the new created MapValueFactory&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilderToPatch#_MapValueFactory(java.lang.String)}
//   * @see javafx.scene.control.cell.MapValueFactory&lt;T&gt;
//   */
//  public <S,T> MapValueFactory<T> _MapValueFactory(final TableColumn<S,T> parent, final String property_, final Procedure1<MapValueFactory<?>> init) {
//    MapValueFactory<T> _obj = new MapValueFactory<T>((String)property_);
//    final MapValueFactory<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
//    								<MapValueFactory<T>>operator_doubleArrow(_obj, init);
//    parent.setCellValueFactory(obj);							
//    return (obj);
//    
//  }
  
  
  /**
   * Insert a new javafx.scene.control.TreeView&lt;T&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created TreeView&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_TreeView()}
   * @see javafx.scene.control.TreeView&lt;T&gt;
   */
  public <T> TreeView<T> _TreeView(final EventTarget parent, final Procedure1<TreeView<T>> init) {
    TreeView<T> _obj = new TreeView<T>();
    final TreeView<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<TreeView<T>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.TreeItem&lt;T&gt;[...] instance inside a {@link javafx.scene.control.TreeView&lt;?&gt;} using setRoot. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created TreeItem&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_TreeItem()}
   * @see javafx.scene.control.TreeItem&lt;T&gt;
   */
  public <T> TreeItem<T> _TreeItem(final TreeView<T> parent, final Procedure1<TreeItem<T>> init) {
    TreeItem<T> _obj = new TreeItem<T>();
    final TreeItem<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<TreeItem<T>>operator_doubleArrow(_obj, init);
    TreeView<T> pparent  = (TreeView<T>) parent; pparent.setRoot(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.TreeItem&lt;T&gt;[...] instance inside a {@link javafx.scene.control.CheckBoxTreeItem&lt;?&gt;} using getChildren().add. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created TreeItem&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_TreeItem()}
   * @see javafx.scene.control.TreeItem&lt;T&gt;
   */
  public <T> TreeItem<T> _TreeItem(final CheckBoxTreeItem<T> parent, final Procedure1<TreeItem<T>> init) {
    TreeItem<T> _obj = new TreeItem<T>();
    final TreeItem<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<TreeItem<T>>operator_doubleArrow(_obj, init);
    CheckBoxTreeItem<T> pparent  = (CheckBoxTreeItem<T>) parent; pparent.getChildren().add(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.TreeItem&lt;T&gt;[...] instance inside a {@link javafx.scene.control.TreeItem&lt;?&gt;} using getChildren().add. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created TreeItem&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_TreeItem()}
   * @see javafx.scene.control.TreeItem&lt;T&gt;
   */
  public <T> TreeItem<T> _TreeItem(final TreeItem<T> parent, final Procedure1<TreeItem<T>> init) {
    TreeItem<T> _obj = new TreeItem<T>();
    final TreeItem<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<TreeItem<T>>operator_doubleArrow(_obj, init);
    TreeItem<T> pparent  = (TreeItem<T>) parent; pparent.getChildren().add(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.CheckBoxTreeItem&lt;T&gt;[...] instance inside a {@link javafx.scene.control.TreeView&lt;?&gt;} using setRoot. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created CheckBoxTreeItem&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_CheckBoxTreeItem()}
   * @see javafx.scene.control.CheckBoxTreeItem&lt;T&gt;
   */
  public <T> CheckBoxTreeItem<T> _CheckBoxTreeItem(final TreeView<T> parent, final Procedure1<CheckBoxTreeItem<T>> init) {
    CheckBoxTreeItem<T> _obj = new CheckBoxTreeItem<T>();
    final CheckBoxTreeItem<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<CheckBoxTreeItem<T>>operator_doubleArrow(_obj, init);
    TreeView<T> pparent  = (TreeView<T>) parent; pparent.setRoot(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.CheckBoxTreeItem&lt;T&gt;[...] instance inside a {@link javafx.scene.control.CheckBoxTreeItem&lt;?&gt;} using getChildren().add. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created CheckBoxTreeItem&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_CheckBoxTreeItem()}
   * @see javafx.scene.control.CheckBoxTreeItem&lt;T&gt;
   */
  public <T> CheckBoxTreeItem<T> _CheckBoxTreeItem(final CheckBoxTreeItem<T> parent, final Procedure1<CheckBoxTreeItem<T>> init) {
    CheckBoxTreeItem<T> _obj = new CheckBoxTreeItem<T>();
    final CheckBoxTreeItem<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<CheckBoxTreeItem<T>>operator_doubleArrow(_obj, init);
    CheckBoxTreeItem<T> pparent  = (CheckBoxTreeItem<T>) parent; pparent.getChildren().add(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.CheckBoxTreeItem&lt;T&gt;[...] instance inside a {@link javafx.scene.control.TreeItem&lt;?&gt;} using getChildren().add. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created CheckBoxTreeItem&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_CheckBoxTreeItem()}
   * @see javafx.scene.control.CheckBoxTreeItem&lt;T&gt;
   */
  public <T> CheckBoxTreeItem<T> _CheckBoxTreeItem(final TreeItem<T> parent, final Procedure1<CheckBoxTreeItem<T>> init) {
    CheckBoxTreeItem<T> _obj = new CheckBoxTreeItem<T>();
    final CheckBoxTreeItem<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<CheckBoxTreeItem<T>>operator_doubleArrow(_obj, init);
    TreeItem<T> pparent  = (TreeItem<T>) parent; pparent.getChildren().add(obj);							
    return (obj);
    
  }
  
  /**
   * Insert a new javafx.scene.control.ComboBox&lt;T&gt;[...] instance inside a {@link org.mv.docxtend.javaFX.JavaFXBuilder#dispatchContainer}. (See {@link org.mv.docxtend.javaFX.JavaFXBuilder.xtend})
   * @param parent is the container/receiver
   * @param init is the closure builder where inserts can be added 
   * @return the new created ComboBox&lt;T&gt;[...] Object with {@link org.mv.docxtend.javaFX.JavaFXBuilder#_ComboBox()}
   * @see javafx.scene.control.ComboBox&lt;T&gt;
   */
  public <T> ComboBox<T> _ComboBox(final EventTarget parent, final Procedure1<ComboBox<T>> init) {
    ComboBox<T> _obj = new ComboBox<T>();
    final ComboBox<T> obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
    								<ComboBox<T>>operator_doubleArrow(_obj, init);
    dispatchContainer(parent, obj);							
    return (obj);
    
  }
  
 }
