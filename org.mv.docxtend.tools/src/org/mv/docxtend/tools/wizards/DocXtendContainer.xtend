/*******************************************************************************
* Copyright (c) 2013 M. Vidal (http://www.matthieu-vidal.com) and others.
* All rights reserved. This program and the accompanying materials
* are made available under the terms of the Eclipse Public License v1.0
* which accompanies this distribution, and is available at
* http://www.eclipse.org/legal/epl-v10.html
*******************************************************************************/
package org.mv.docxtend.tools.wizards

import org.eclipse.core.runtime.CoreException
import org.eclipse.core.runtime.FileLocator
import org.eclipse.core.runtime.IPath
import org.eclipse.core.runtime.IStatus
import org.eclipse.core.runtime.Path
import org.eclipse.core.runtime.Platform
import org.eclipse.core.runtime.Status
import org.eclipse.jdt.core.ClasspathContainerInitializer
import org.eclipse.jdt.core.IClasspathContainer
import org.eclipse.jdt.core.IClasspathEntry
import org.eclipse.jdt.core.IJavaProject
import org.eclipse.jdt.core.JavaCore
import org.eclipse.jdt.ui.wizards.IClasspathContainerPage
import org.eclipse.jdt.ui.wizards.IClasspathContainerPageExtension
import org.eclipse.jface.wizard.WizardPage
import org.eclipse.swt.SWT
import org.eclipse.swt.widgets.Composite
import org.eclipse.ui.statushandlers.StatusManager
import org.mv.docxtend.eclipse.swt.SwtBuilder

class DocXtendContainerPage extends WizardPage implements IClasspathContainerPage, IClasspathContainerPageExtension {
	
	var IClasspathEntry containerEntryResult;

	new() {
		super(DocXtendContainer::DESC)
		setTitle(DocXtendContainer::DESC);
		setDescription("Add DocXtend annotation library to the classpath");

		containerEntryResult = JavaCore::newContainerEntry(DocXtendContainer::ID);

	}

	override boolean finish() {
		return true;
	}

	override IClasspathEntry getSelection() {
		return containerEntryResult;
	}

	override void setSelection(IClasspathEntry containerEntry) {
		if (containerEntry != null)
			containerEntryResult = containerEntry;
	}

	override void createControl(Composite parent) {
		extension val swtBuilder = new SwtBuilder
		parent => [
			_Composite(SWT::NONE) [ 
				font = parent.font
				_GridLayout(1, true)[]
				_Label(SWT::NONE) [
					text = "Click \"Finish\" to add DocXtend Library"
					font = parent.font
					_GridData[]
				]
				setControl
			]
		]
	}

	override initialize(IJavaProject project, IClasspathEntry[] currentEntries) {
	}
}

/**DocXtend Container ... simple and functional */
class DocXtendContainer implements IClasspathContainer {

	public static val BUNDLE_ID = "org.mv.docxtend"
	private static final String SOURCE_SUFIX = ".source";

	public static val ID = new Path(BUNDLE_ID + ".DocXtend_Container");

	public static val DESC = "DocXtend annotations library";

	//---Entry list do not change ... 
	private val entryList = <IClasspathEntry>newArrayList()

	// --- path string that  identifies this container instance <--> ID
	private var IPath path;

	// --- We want nice errors
	private val statusManager = StatusManager::manager

	new(IPath path) {
		this.path = path;

		try {
			val bundle = Platform::getBundle(BUNDLE_ID)
			if (bundle != null) {

				val bundleJarURL = FileLocator::getBundleFile(bundle).toURI.toURL
				val BundleJarFileURL = FileLocator::toFileURL(bundleJarURL)
				val pathJar = new Path(BundleJarFileURL.getPath()).makeAbsolute()

				//----Looking for source	
				var IPath pathSourceJar = null

				//---First we try using its id ... but we do not found it ... it's not a public plugin ....
				val bundleSource = Platform::getBundle(BUNDLE_ID + SOURCE_SUFIX)
				if (bundleSource != null) {
					val bundleSourceJarURL = FileLocator::getBundleFile(bundleSource).toURI.toURL
					val BundleSourceJarFileURL = FileLocator::toFileURL(bundleSourceJarURL)
					pathSourceJar = new Path(BundleSourceJarFileURL.getPath()).makeAbsolute()
				} else {
					//---Then we do a very ugly processing
					val bundlesParentFolder = pathJar.removeLastSegments(1);
					val binaryJarName = pathJar.lastSegment();
					val symbolicName = bundle.getSymbolicName();
					val sourceJarName = binaryJarName.replace(symbolicName, symbolicName.concat(SOURCE_SUFIX));
					val potentialSourceJar = bundlesParentFolder.append(sourceJarName);
					if (potentialSourceJar.toFile().exists())
						pathSourceJar = potentialSourceJar
					else {
						val myStatus = new Status(IStatus::INFO, BUNDLE_ID,
							"DocXtendContainer Source is missing : " + BUNDLE_ID + SOURCE_SUFIX)
						statusManager.handle(myStatus, StatusManager::LOG);
					}
				}
				entryList.add(JavaCore::newLibraryEntry(pathJar, pathSourceJar, new Path("/")))
			} else {
				val myStatus = new Status(IStatus::ERROR, BUNDLE_ID,
					"DocXtendContainer plugin is missing : " + BUNDLE_ID)
				statusManager.handle(myStatus, StatusManager::LOG);
			}

		} catch (Exception exc) {
			val myStatus = new Status(IStatus::ERROR, BUNDLE_ID, "DocXtendContainer constructor error :", exc)
			statusManager.handle(myStatus, StatusManager::LOG)
		}
	}

	override getClasspathEntries() {

		// convert the list to an array and return it
		val entryArray = <IClasspathEntry>newArrayList();
		return (entryList.toArray(entryArray) as IClasspathEntry[])

	}

	override getDescription() {
		return DocXtendContainer::DESC
	}

	override getKind() {
		IClasspathContainer::K_APPLICATION
	}

	override getPath() {
		return path
	}
}

/**Initialise DocXtend Container */
class DocXtendContainerInitializer extends ClasspathContainerInitializer {

	override initialize(IPath containerPath, IJavaProject project) throws CoreException {
		val container = new DocXtendContainer(containerPath)

		JavaCore::setClasspathContainer(
			containerPath,
			<IJavaProject>newArrayList(project),
			<IClasspathContainer>newArrayList(container),
			null
		);

	}

}
