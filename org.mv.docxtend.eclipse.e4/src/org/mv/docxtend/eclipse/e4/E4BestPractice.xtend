package org.mv.docxtend.eclipse.e4

import org.osgi.framework.FrameworkUtil

/**
 * Best Pactrice values
 */
public static class E4BestPractice {

	public static val Save = "SaveCommand"
	public static val Save_Label = "Save"

	/**value = {@value}*/
	public static val Save_Id = "org.eclipse.ui.file.save"

	public static val Save_keyBinding = "M1+S"

	public static val SaveAll = "SaveAllCommand"
	public static val SaveAll_Label = "Save All"
	public static val SaveAll_Id = "org.eclipse.ui.file.saveAll"
	public static val SaveAll_keyBinding = "M2+M1+S"

	public static val Undo = "UndoCommand"
	public static val Undo_Label = "Undo"
	public static val Undo_Id = "org.eclipse.ui.edit.undo"
	public static val Undo_keyBinding = "M1+Z"

	public static val Redo = "RedoCommand"
	public static val Redo_Label = "Redo"
	public static val Redo_Id = "org.eclipse.ui.edit.redo"
	public static val Redo_keyBinding = "M2+M1+Z"

	public static val Cut = "CutCommand"
	public static val Cut_Label = "Cut"
	public static val Cut_Id = "org.eclipse.ui.edit.cut"
	public static val Cut_keyBinding = "M1+X"

	public static val Copy = "CopyCommand"
	public static val Copy_Label = "Copy"
	public static val Copy_Id = "org.eclipse.ui.edit.copy"
	public static val Copy_keyBinding = "M1+C"

	public static val Paste = "PasteCommand"
	public static val Paste_Label = "Paste"
	public static val Paste_Id = "org.eclipse.ui.edit.paste"
	public static val Paste_keyBinding = "M1+V"

	public static val Delete = "DeleteCommand"
	public static val Delete_Label = "Delete"
	public static val Delete_Id = "org.eclipse.ui.edit.delete"

	public static val Import = "ImportCommand"
	public static val Import_Label = "Import"
	public static val Import_Id = "org.eclipse.ui.file.import"

	public static val Export = "ExportCommand"
	public static val Export_Label = "Export"
	public static val Export_Id = "org.eclipse.ui.file.export"

	public static val SelectAll = "SelectAllCommand"
	public static val SelectAll_Label = "SelectAll"
	public static val SelectAll_Id = "org.eclipse.ui.edit.selectAll"
	public static val SelectAll_keyBinding = "M1+A"

	public static val About = "AboutCommand"
	public static val About_Label = "About"
	public static val About_Id = "org.eclipse.ui.help.aboutAction"

	public static val Preferences = "PreferencesCommand"
	public static val Preferences_Label = "Preferences"
	public static val Preferences_Id = "org.eclipse.ui.window.preferences"

	public static val Exit = "ExitCommand"
	public static val Exit_Label = "Exit"
	public static val Exit_Id = "org.eclipse.ui.file.exit"
	public static val Exit_keyBinding = "M1+Q"


	/**Get the bundleString of a class
	 * @Param clazz the class contributing
	 */
	static def getBundleString(Class<?> clazz) {
		var bundleClass = "bundleclass://"
		if (clazz != null) {
			val bundle = FrameworkUtil.getBundle(clazz)
			if(bundle != null && bundle.getSymbolicName() != null) 
				return bundleClass + bundle.getSymbolicName() + "/" + clazz.name
		}
		return null
	}

}
