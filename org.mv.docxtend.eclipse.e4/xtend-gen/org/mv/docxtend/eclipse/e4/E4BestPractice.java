package org.mv.docxtend.eclipse.e4;

import com.google.common.base.Objects;
import org.osgi.framework.Bundle;
import org.osgi.framework.FrameworkUtil;

/**
 * Best Pactrice values
 */
@SuppressWarnings("all")
public class E4BestPractice {
  public final static String Save = "SaveCommand";
  
  public final static String Save_Label = "Save";
  
  /**
   * value = {@value}
   */
  public final static String Save_Id = "org.eclipse.ui.file.save";
  
  public final static String Save_keyBinding = "M1+S";
  
  public final static String SaveAll = "SaveAllCommand";
  
  public final static String SaveAll_Label = "Save All";
  
  public final static String SaveAll_Id = "org.eclipse.ui.file.saveAll";
  
  public final static String SaveAll_keyBinding = "M2+M1+S";
  
  public final static String Undo = "UndoCommand";
  
  public final static String Undo_Label = "Undo";
  
  public final static String Undo_Id = "org.eclipse.ui.edit.undo";
  
  public final static String Undo_keyBinding = "M1+Z";
  
  public final static String Redo = "RedoCommand";
  
  public final static String Redo_Label = "Redo";
  
  public final static String Redo_Id = "org.eclipse.ui.edit.redo";
  
  public final static String Redo_keyBinding = "M2+M1+Z";
  
  public final static String Cut = "CutCommand";
  
  public final static String Cut_Label = "Cut";
  
  public final static String Cut_Id = "org.eclipse.ui.edit.cut";
  
  public final static String Cut_keyBinding = "M1+X";
  
  public final static String Copy = "CopyCommand";
  
  public final static String Copy_Label = "Copy";
  
  public final static String Copy_Id = "org.eclipse.ui.edit.copy";
  
  public final static String Copy_keyBinding = "M1+C";
  
  public final static String Paste = "PasteCommand";
  
  public final static String Paste_Label = "Paste";
  
  public final static String Paste_Id = "org.eclipse.ui.edit.paste";
  
  public final static String Paste_keyBinding = "M1+V";
  
  public final static String Delete = "DeleteCommand";
  
  public final static String Delete_Label = "Delete";
  
  public final static String Delete_Id = "org.eclipse.ui.edit.delete";
  
  public final static String Import = "ImportCommand";
  
  public final static String Import_Label = "Import";
  
  public final static String Import_Id = "org.eclipse.ui.file.import";
  
  public final static String Export = "ExportCommand";
  
  public final static String Export_Label = "Export";
  
  public final static String Export_Id = "org.eclipse.ui.file.export";
  
  public final static String SelectAll = "SelectAllCommand";
  
  public final static String SelectAll_Label = "SelectAll";
  
  public final static String SelectAll_Id = "org.eclipse.ui.edit.selectAll";
  
  public final static String SelectAll_keyBinding = "M1+A";
  
  public final static String About = "AboutCommand";
  
  public final static String About_Label = "About";
  
  public final static String About_Id = "org.eclipse.ui.help.aboutAction";
  
  public final static String Preferences = "PreferencesCommand";
  
  public final static String Preferences_Label = "Preferences";
  
  public final static String Preferences_Id = "org.eclipse.ui.window.preferences";
  
  public final static String Exit = "ExitCommand";
  
  public final static String Exit_Label = "Exit";
  
  public final static String Exit_Id = "org.eclipse.ui.file.exit";
  
  public final static String Exit_keyBinding = "M1+Q";
  
  /**
   * Get the bundleString of a class
   * @Param clazz the class contributing
   */
  public static String getBundleString(final Class<? extends Object> clazz) {
    String bundleClass = "bundleclass://";
    boolean _notEquals = (!Objects.equal(clazz, null));
    if (_notEquals) {
      final Bundle bundle = FrameworkUtil.getBundle(clazz);
      boolean _and = false;
      boolean _notEquals_1 = (!Objects.equal(bundle, null));
      if (!_notEquals_1) {
        _and = false;
      } else {
        String _symbolicName = bundle.getSymbolicName();
        boolean _notEquals_2 = (!Objects.equal(_symbolicName, null));
        _and = (_notEquals_1 && _notEquals_2);
      }
      if (_and) {
        String _symbolicName_1 = bundle.getSymbolicName();
        String _plus = (bundleClass + _symbolicName_1);
        String _plus_1 = (_plus + "/");
        String _name = clazz.getName();
        return (_plus_1 + _name);
      }
    }
    return null;
  }
}
