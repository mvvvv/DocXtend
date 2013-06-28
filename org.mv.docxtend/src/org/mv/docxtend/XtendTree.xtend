/*******************************************************************************
* Copyright (c) 2013 M. Vidal (http://www.matthieu-vidal.com) and others.
* All rights reserved. This program and the accompanying materials
* are made available under the terms of the Eclipse Public License v1.0
* which accompanies this distribution, and is available at
* http://www.eclipse.org/legal/epl-v10.html
*******************************************************************************/

package org.mv.docxtend;

import java.lang.annotation.Documented
import java.lang.annotation.ElementType
import java.lang.annotation.Retention
import java.lang.annotation.RetentionPolicy
import java.lang.annotation.Target
import java.util.HashMap
import java.util.List
import java.util.Map
import java.util.Set
import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.ClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.ConstructorDeclaration
import org.eclipse.xtend.lib.macro.declaration.MethodDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableMethodDeclaration
import org.eclipse.xtend.lib.macro.declaration.TypeReference
import org.eclipse.xtend.lib.macro.declaration.Visibility
import org.eclipse.xtext.xbase.lib.Procedures
import org.eclipse.xtend.lib.macro.declaration.MemberDeclaration
import org.eclipse.xtend.lib.macro.declaration.AnnotationReference

/** 
  The  class annotated with this active annotation will define the Xtend Tree of an object builder.
  <br/><br/>  
  The <i>Element "useInsertsFrom"</i> can contains the list of other XtendTree's annotated Classes. 
  The "XtendNodes" from these classes (these builders) could be used as inserts for the containers of the annotated class.
  <br/>
  This behavior is similar to a super class extension, except that each class defined that way will be
  independent from the others (even if they define the same global tree).
 * 
 * 
 * @see XtendNode
 * @author mvidal           
 */
@Target(value=ElementType::TYPE)
@Documented
@Retention(RetentionPolicy::SOURCE)
@Active(XtendTreeProcessor)
annotation XtendTree {
		Class<?>[]  useInsertsFrom = #[]
}


interface IXtendTree {
	static val useInsertsFrom = "useInsertsFrom"
}


/** 
  The method annotated with @XtendNode is a node of the Xtend Tree. 
  <br/><br/>
  A node can describe a container if <i>"inserts"</i> element describes a way to insert other nodes (identified by their method's name).
  The way these nodes will be inserted is indicated before the colon. 
  The nodes that can be inserted are listed, using their method's name, after the colon.
  <br/><br/>A node is an insert for one or more containers or only here to define a generic type container. 
  <br/><b>The return type of the method's node (inferred or not) is the container.</b> 
  <br/><br/>
  The method annotated with @XtendNode will be "duplicated" as often as this node has containers:
  <ul>
  	<li> Each duplicated method will have is corresponding container as first parameter (the Xtend receiver for extension)</li>
  	<li> Each duplicated method will be enhanced by a last parameter for closure and builder syntax ((NodeType)=> void init) </li>
  </ul>
  The <i>Element "usingConstructors"</i> can be set to true if the return type is a real class type having more than one constructor
  (i.e: SWT objects). With this flag set to true:
  <ul> 
  		<li>All the constructors matching the container as Xtend receiver will correspond to a "duplicated" method ; provided they do not
  		specify an affectation method in the "inserts" statement of this container (nothing before the colon).</li>
  		<li>Furthermore, if the method's unique parameter is a varArg <Object...>, 
  		then all the constructors will be duplicated for all containers of this node having an affectation method for this insert.</li>
  </ul>>
  <b>Important:</b> If "usingConstructors" flag is not set then the method body is in charge for the creation of the object 
  (using a factory ... or one of its constructors). This is the better choice as it gives a simple access to object creation and
  specific adaptation.
 </li> 
  
  <br/><br/>
  The method visibility should be "protected" as this method should not be visible outside this class. The "duplicated"
  methods generated from this methods are always public. 
  The <i>Element "Container"</i> can define the container type (instead )
 * @author mvidal           
 * @see XtendTree
 */
@Target(ElementType::METHOD )
@Documented
@Retention(RetentionPolicy::SOURCE)
annotation XtendNode {

	boolean 	usingConstructors = false

	String[] 	inserts = #[]

	Class<?> 	container = typeof(Object)
	
}

interface IXtendNode {
	static val container = "container"
	static val usingConstructors = "usingConstructors"
	static val inserts = "inserts"
}


/**Processing @XtendTree active annotation
 * @author mvidal           
 */
class XtendTreeProcessor extends AbstractClassProcessor {

	
	/**List of the annotatedClass + useInsetsFrom classes */
	protected var List<ClassDeclaration> accessibleClasses 
	
	/**List of the all the accessible methods */
	protected var List<MethodDeclaration> methodList 
	
	
	/**Tree defined by the @XtendTree Type definition String -> type reference*/
	protected var Map<String, TypeReference> xType

	/**Tree defined by the @XtendTree Node's method name -> containers set */
	protected var Map<String, Set<String>> xContainer


	/** here is a doTransform */
	override doTransform(MutableClassDeclaration annotatedClass, extension TransformationContext context) {

		accessibleClasses = <ClassDeclaration>newArrayList(annotatedClass)
		methodList = <MethodDeclaration>newArrayList()
		xType = <String, TypeReference>newHashMap()
		xContainer = <String, Set<String>>newHashMap()


		//--------------------------------------------------------
		//------------------Read the class and method annotations
		val thisAnnotation = annotatedClass.findAnnotation(XtendTree.findTypeGlobally)
		
		//---Add all the inserts we have in userInsertFrom
		annotatedClass.addAccessibleClasses(thisAnnotation, context)
		annotatedClass.addAccessibleMethods()
		
		
		
		try { //---Read the types we have in this class
			annotatedClass.inferTypes(context)
		} catch (DocXException e) {
			thisAnnotation.addError(e.message)
		}

		for (method : annotatedClass.declaredMethods) {
			try {
				method.readXTree(annotatedClass, context)
			} catch (DocXException e) {
				method.addError(e.message)
			}
		}

		
		
		//------------------Extend each method
		for (method : methodList) {
			try { //---Create all the methods asked by the xtendTree
				if (! method.xtendNodeS.empty) {
					if (method.isToGenerateFromConstructors) {
						method.generateXTreeNodeFromConstructors(annotatedClass, context)
					} else {
						method.generateXTreeNode(annotatedClass, context)
					}
				}
			} catch (DocXException e) {
				method.error(annotatedClass, context, e.message + " -> " + method.simpleName)			
			}
			
		}


		//------------------remove each method annotated with empty body !!! TODO remove Annotation also !!
		if (annotatedClass.final) {
			for (method : annotatedClass.getDeclaredMethods) {
				try { //---Create all the methods ask by the xtendTree			
					if (! method.xtendNodeS.empty)
						if (method.hasABody) {
							if (method.isToGenerateFromConstructors)
								method.warning(annotatedClass, context,
									method.simpleName + " should have an empty body because of " + IXtendNode::usingConstructors)

						} else {
							if (! method.isToGenerateFromConstructors && xContainer.containsKey(method.simpleName)) {
								method.addWarning(
									method.simpleName + " should have a body " +
										" to return (mostly to create) a real '" + method.returnType + "' instance")
							} else {
								method.remove
							}
						}
				} catch (DocXException e) {
					method.error(annotatedClass, context, e.message)

				}

			}
		}

		
		//------We do not tolerate parameterized constructors 
		for (constructor : annotatedClass.declaredConstructors) {
			if (! constructor.parameters.isEmpty) {
				constructor.addError("Constructors with parameters are not allowed with @XtendTree.")
			}
		}
		
		//		if (xContainer.empty && ! annotatedClass.abstract )
		//			thisAnnotation.addWarning("This Class should be abstract as it do not defines any container")

		if (xType.size == 0)
			thisAnnotation.addError("Unable to Xtend the tree (no Types) : check @XtendNode tags of this class")

		//-----------------Make a Nice Javadoc (Not possible too ugly) and xtend editor sees nothing
		if (true ) {
			var docAddendum = '<p><i>This class contains the following XtendNode methods :</i><br/><br/>'
			for (typeName : xContainer.keySet.sort) {
				docAddendum = docAddendum + "<b>" + typeName + " can be inserted in :</b><ul>"
				for (insert : xContainer.get(typeName)) {
					docAddendum = docAddendum + "<li>" + insert.replace("..", "  ---> ") + "</li>"
				}
				docAddendum = docAddendum + "</ul><br/>"
			}
			docAddendum = docAddendum + "</p>"
			
			//annotatedClass.docComment.replace(treeDetail, docAddendum)
			annotatedClass.docComment = docAddendum + annotatedClass.docComment?:""  
		}

	}
	
	/**
	 * We have to check the classes as XtendTree Builders and enhanced the list of accessibleMethod
	 */
	protected def void addAccessibleClasses(MutableClassDeclaration annotatedClass, AnnotationReference thisAnnotation,
		extension TransformationContext context) {

		val msgNotUsable = IXtendTree::useInsertsFrom + " references a type that is not an extend-able XtendTree Class : "
		
		val xtendTreeAno = annotatedClass.xtendTree
		val object = xtendTreeAno.getValue(IXtendTree::useInsertsFrom)
		if (object != null) {
			
			if (List.isInstance(object)) {
				for (objectDef : object as List<?>) {
					val ref = objectDef.getReferencedClass(annotatedClass, context)
					if (ref != null)
						accessibleClasses += ref
					else
						thisAnnotation.addError( msgNotUsable + objectDef.toString)
									
				}
			} else {
					val ref = object.getReferencedClass(annotatedClass,context)
					if (ref != null)
						accessibleClasses += ref
					else
						thisAnnotation.addError( msgNotUsable + object.toString)
					
			
			}
		}
	}
	
	/**
	 * We check if the method is accessible for this xtendTree
	 */
	protected def getReferencedClass(Object object, MutableClassDeclaration annotatedClass, extension TransformationContext context ) {
		var TypeReference objectRef
		if (ClassDeclaration.isInstance(object)){
			objectRef = object as TypeReference					
		}
		else {//---Ugly  workaround of the JvmGeneric bug
			val fromObjectString = object.toString.replaceFirst(".* identifier:","").replaceFirst("\\).*", "")
			objectRef = newTypeReference(fromObjectString)
		}
		if (objectRef != null && ClassDeclaration.isInstance(objectRef.type )) {
					val classDec = objectRef.type as ClassDeclaration
					if (! classDec.isFinal && 
						classDec.findAnnotation(XtendTree.findTypeGlobally) != null	&&
						( 	classDec.visibility == Visibility::PUBLIC || 
							(	classDec.visibility== Visibility::PROTECTED && 
								classDec.qualifiedName.replaceFirst(classDec.simpleName+"$","") ==
									annotatedClass.qualifiedName.replaceFirst(annotatedClass.simpleName+"$",""))))
						return classDec
		}
	}
		

	/**
	 * We work on all the existing method Nodes (from extended class and "useInsertFrom classes")
	 * @return all the accessible methods of the given class 
	 * @see #error(MethodDeclaration, MutableClassDeclaration,TransformationContext,String) 
	 * @see #warning(MethodDeclaration, MutableClassDeclaration,TransformationContext,String) 
	 */
	protected def addAccessibleMethods(MutableClassDeclaration annotatedClass) {

	
		//---We need to find all the accessible methods for all accessible classes
		for (classIterA : accessibleClasses) {
			if (classIterA === annotatedClass)
				methodList += classIterA.declaredMethods.filter[!xtendNodeS.empty]
			else
				for (accessibleMethod : classIterA.declaredMethods.filter[ visibility != Visibility::PRIVATE && !xtendNodeS.empty ] ) {
						methodList += accessibleMethod
				}
			
			var classIter = classIterA
			while (classIter.extendedClass != null) {
				classIter = classIter.extendedClass.type as ClassDeclaration
				for (accessibleMethod : classIter.declaredMethods.filter[visibility != Visibility::PRIVATE && !xtendNodeS.empty ] ) {
						methodList += accessibleMethod
				}

			}

		}
		return methodList

	}


	/**Get all the typeReferences we need from method's node return types  */
	protected def inferTypes(MutableClassDeclaration annotatedClass, extension TransformationContext context) throws
	DocXException {
		var sillyLog = ""
		try {
			var TypeReference classTypeRef

			
			for (method : methodList) {
				classTypeRef = null

				//---Setting the typeReference from the annotated XtendNode "container" parameter
				for (annotation : method.xtendNodeS) {
					if (annotation.getValue(IXtendNode::container) == Object) {

						val cType = annotation.getValue(IXtendNode::container) as Class<?>
						val cTypeRef = newTypeReference(cType)
						if (cTypeRef == null)
							method.error(annotatedClass, context,
								annotation.getValue(IXtendNode::container) + " do not return a valid object Type")
						else if (!xType.containsKey(cTypeRef.type.simpleName)) {
							xType.put(cTypeRef.type.simpleName, classTypeRef)
						}

					}
				}

				//---Setting the typeReference of the class
				val methodCheck = methodList.filter[simpleName == method.simpleName]
				for (methodIter : methodCheck) {
					if (classTypeRef == null)
						classTypeRef = methodIter.returnType
					else if (classTypeRef != methodIter.returnType) {
						method.error(annotatedClass, context,
							methodIter.returnType.simpleName + " type mismatch with other method return type : " +
								classTypeRef)
					}
					if (classTypeRef == null)
						throw new DocXException(
							method.simpleName + " do not return a valid object type in " + methodIter.class.simpleName)

					if (!xType.containsKey(classTypeRef.type.simpleName)) {
						xType.put(classTypeRef.type.simpleName, classTypeRef)
					}
				}
			}

		} catch (Exception e) {
			throw new DocXException(e.message + "\n\t" + sillyLog, e)
		}
	}

	/**Process XtendTree javadoc information */
	protected def readXTree(MutableMethodDeclaration method, MutableClassDeclaration annotatedClass,
		extension TransformationContext context) throws	DocXException {
		var sillyLog = ""
		try {

			//---Then we Extract the tree defined after @XtendTree
			sillyLog = ""
			

			//---Setting the typeReference from the annotated XtendNodes "container" parameter
			val annotation = method.findAnnotation(XtendNode.findTypeGlobally)
			if (annotation != null) {
				val evals = <String>newArrayList()
				val insertsValue = annotation.getValue(IXtendNode::inserts)
				if (insertsValue != null) {
					if (insertsValue.class == String) {
						val insertsString = insertsValue as String
						if (! insertsString.nullOrEmpty)
							evals.add(insertsString)
					} else {
						val insertsList = insertsValue as List<String>
						if (insertsList != null)
							evals.addAll(insertsList)
					}

					for (eval : evals) {
						var currentEval = ""
						val eval2Part = eval.split(":")

						if (eval2Part.size != 2)
							annotation.addError(
								"'inserts' attribute must have a colon which separates an "+
								"optional expression from a list of node's method")
						if (annotation.getValue(IXtendNode::container) == Object) {
							val cType = annotation.getValue(IXtendNode::container) as Class<?>
							currentEval = cType.simpleName + ".." + eval2Part.head.trim

						} else {
							currentEval = method.returnType.simpleName + ".." + eval2Part.head.trim
						}

						var insertsName = eval2Part.last.trim

						if (!insertsName.trim.nullOrEmpty)
							for (insertName : insertsName.trim.split("[\\s\\|]+")) {

								//---We need to find the returned type 
								
								if ( methodList.filter[simpleName == insertName].isEmpty){
										method.addError(
											insertName + " is not an accessible method of " +
												annotatedClass.simpleName)
								}

								//---Setting the containers for this class
								if (xContainer.containsKey(insertName)) {

									//---check for double entry
									var evalsContainer = xContainer.get(insertName)
									for (evalC : evalsContainer) {

										if (evalC.containerClassName == currentEval.containerClassName)
											method.addError(
												currentEval.containerClassName + " is twice a container for" +
													insertName)
									}
									evalsContainer.add(currentEval)
								} else {
									xContainer.put(insertName, <String>newHashSet(currentEval))
								}
							}
					}
					
					//---Cosmetic correction
					if (insertsValue != "") {
						val cleanEvals = <String>newArrayList()
						var doc = ""
						for (eval : evals) {
							val cleanEval = eval.replaceAll("\\s+", " ")
							doc = doc + "<br/>" + cleanEval + "<br>"
							cleanEvals += cleanEval
						}
						annotation.remove(IXtendNode::inserts)
						annotation.set(IXtendNode::inserts, cleanEvals)
					}
				}
			}

		} catch (DocXException e) {
			throw new DocXException(e.message + "\n\t" + sillyLog)
		} catch (Exception e) {
			throw new DocXException(e.message + "\n\t" + sillyLog, e)
		}

	}

	/**Duplicate all the desired methods defined for a XtendNode */
	protected def generateXTreeNode(MethodDeclaration method, MutableClassDeclaration annotatedClass,
		extension TransformationContext context) throws DocXException {
		var sillyLog = ""
		try {

			if (xContainer.containsKey(method.simpleName)) {

				//----If the method is outside the annotatedClass then we have to implement its class or use its static call
				var callObjectProvider = method.simpleName
				if (method.declaringType != annotatedClass && accessibleClasses.contains(method.declaringType))
				{
					if (method.isStatic) {
						callObjectProvider = method.declaringType.qualifiedName + "." + method.simpleName
					}
					else
					{   
						callObjectProvider = "(new "+ method.declaringType.qualifiedName + "())." + method.simpleName
						
					}
				}
				val callObjectProviderF = callObjectProvider
				
				for (exprAffectation : xContainer.get(method.simpleName)) {
					sillyLog = method.simpleName + " <--" + exprAffectation.containerClassName

					annotatedClass.addMethod(method.simpleName) [
						val xMethod = it
						static = method.static
						val containerType = exprAffectation.getContainerClassName.getComplexTypeRef(context)
						var oper = exprAffectation.methodAffectation
						if (!oper.trim.empty) {
							//---We have a method to insert the new object in the container
							oper = "parent." + oper + "(obj);"
							addParameter("parent", containerType)
						}
						else {
							//Check that the first parameter of the method (the xtend receiver) is the container
							if (method.parameters.head.type != containerType) {
								method.error(annotatedClass, context,
									method.simpleName + " has not an affectation's method into the container '" +
									containerType.simpleName +
									"'. This container must be the receiver (first parameter) of " +
									method.simpleName)
							}
						}
						method.parameters.forEach[xMethod.addParameter(simpleName + "_" , type)]
						visibility = Visibility::PUBLIC
						returnType = method.returnType
						addParameter("init", Procedures$Procedure1.newTypeReference(returnType))
						var paramsString = ""
						var paramTypesString = ""
						for (param : method.parameters) {
							var paramName =  param.simpleName + "_"
							if (paramsString.nullOrEmpty) {
								paramsString = paramName
								paramTypesString = param.type.name
							} else {
								paramsString = paramsString + "," + paramName
								paramTypesString = paramTypesString + "," + param.type.name
							}

						}
						val paramString = paramsString
						val operOrNothing = oper
						body = [
							'''
								«method.returnType» _obj = «callObjectProviderF»(«paramString»);
								final «method.returnType» obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
																<«method.returnType»>operator_doubleArrow(_obj, init);
								«operOrNothing»							
								return (obj);
							''']
						docComment = "Insert a new " + method.returnType + "[...] instance inside a " +
							exprAffectation.replaceFirst("\\.\\.", " object with '") + "'."
						docComment = docComment + "<br>See {@link " + annotatedClass.compilationUnit.packageName + "."+
						annotatedClass.compilationUnit.simpleName + "}"
						docComment = docComment + "\n@param parent is the container/receiver"
						docComment = docComment + "\n@param init is the closure builder where inserts can be added "
						docComment = docComment + "\n@return the new created " + method.returnType +
							"[...] Object"
						docComment = docComment + " with {@link "+ method.declaringType.qualifiedName +"#"  + method.simpleName + "(" + paramTypesString + ")}"
						docComment = docComment + "\n@see " + method.returnType.name
						setExceptions(method.exceptions)
					//---Todo check the generated code and follow up errors to xtend file Bug 408083
					]
				}
			}

			//else if (method.isCheckingParentContainers)
			//annotatedClass.addWarning(
			//method.simpleName + " do not have a parent container (@XtendNode#checkParentContainers)")
			} catch (Exception e) {

				throw new DocXException(e.message + "\n\t" + sillyLog, e)

			}
		}

		/**Gererate all the desired methods defined with XtendTree */
		protected def generateXTreeNodeFromConstructors(MethodDeclaration method, MutableClassDeclaration annotatedClass,
			extension TransformationContext context) throws DocXException {
			var sillyLog = ""
			try {

				val classT = method.returnType.type as ClassDeclaration
				val containersMap = <String,String>newHashMap()
				
				//---If method contains a single varArgs Object ... we accept a method affectation
				var Boolean isIncluded
				if (method.parameters.size == 0) {
					isIncluded = true
				} else if (method.parameters.size == 1) {
					val param = method.parameters.head
					if (method.isVarArgs && param.type == Object.newTypeReference.newArrayTypeReference())
						isIncluded = false
				}
				if ( isIncluded == null  )
					method.error(annotatedClass, context,
						"With " + IXtendNode::usingConstructors + " only one varArg 'Object...' parameter can be declared (or none)" )

				if (method.returnType == Object.newTypeReference())
					method.error (annotatedClass, context, method.simpleName + 
						"return type cannot be inferred (or Object is forbidden) : specify the method return type"
					)
					

				if (! xContainer.containsKey(method.simpleName)) {
					//if (method.isCheckingParentContainers) {
					//		annotatedClass.addWarning(
					//		method.simpleName +
					//		" do not have a parent container here (@XtendNode#checkParentContainers)")
					//}
				} else {

					//---Here are all the containers of this node and the affecationMethod
					for (eval : xContainer.get(method.simpleName)) 
						containersMap.put(eval.getContainerClassName, eval.getMethodAffectation())
					
					//---A list to check which containers have been effectively found (reconciliation at the end)
					val resolvedContainerList = <String>newArrayList()

					//---Containers which forgot an affectation method
					val allContainers =  <String>newArrayList()
					var possibleErrors = <String>newArrayList()

					var almostOne = false
					for (constructor : classT.declaredConstructors) {

						var TypeReference firstParam 
						if (!constructor.parameters.isEmpty) 
							firstParam = constructor.parameters.head.type
							
						var containers = <TypeReference,String>newHashMap()
						
						if (constructor.visibility == Visibility::PUBLIC) {
							sillyLog = method.simpleName + " inside the constructor : " + constructor.toString

							// ---check if the container is well designed to contain our method
							if (firstParam != null && containersMap.containsKey(firstParam.simpleName)) {

								//---We have to check that the affectation method is empty as the constructor include the container
								val evalAff = containersMap.get(firstParam.simpleName)
								containers.put(firstParam, evalAff)
								
								//---Ambiguous constructor with a first parameter of the same type than the container
								if (evalAff.trim != "")
									method.warning(annotatedClass, context,
										firstParam.simpleName + " should not have '" + evalAff +
											"' affectation method for '" + method.simpleName + "' : A constructor of '" +
											method.returnType.simpleName +	"' already includes it as first parameter") 

								if (!resolvedContainerList.contains(firstParam.simpleName))
									resolvedContainerList.add(firstParam.simpleName)

							} else if (!isIncluded) {
								for (containerName : containersMap.keySet) {
									val evalAff = containersMap.get(containerName)

									if (!evalAff.nullOrEmpty) {
										containers.put(xType.get(containerName), evalAff)
									}
									else if (!containers.containsKey(containerName)){										
										possibleErrors += containerName 
									}

									//---if previous error, it's important to not add next irrelevant error :
									if (!resolvedContainerList.contains(containerName))
										resolvedContainerList.add(containerName)

								}

							}
							//---Time to build all the clones of our node method based upon the constructor
							var somethingDone =	constructor.duplicateNodeMethods(method, containers, annotatedClass, context)
							almostOne = (almostOne || somethingDone)
							containers.keySet.forEach[allContainers += simpleName]
						}
					}
					//---Some containers may want a node they can insert ... 
					for (checkContainer : possibleErrors) {
						if (! allContainers.contains(checkContainer))
									method.error(annotatedClass, context,
										"Affectation method of '" + method.simpleName + "' inside a '" + checkContainer +
											"' is missing")
							}
					for (parentType : resolvedContainerList) {
						containersMap.remove(parentType)
					}
					if (! almostOne) {
						method.error(annotatedClass, context, "No Xtendable constructors for " + method.simpleName)
					}
					for (containerName : containersMap.keySet) {
						method.warning(annotatedClass, context,
							containerName + " is not a constructor container for" + method.simpleName)
					}
				}
			} catch (Exception e) {

				throw new DocXException(e.message + "\n\t" + sillyLog, e)

			}

		}

		/** From a constructor of the object type returned by the node method, 
		 * duplicate this method for all containers of this node
		 * @param constructor : the constructor that will be used for the duplication
		 * @param method : the originate method Node which name will be used for duplication
		 * @param containers : All the container names for this node -> affectation method string
		 * @param annotatedClass : The subject of this work 
		 * @param context : The magic transformation context ... as extension
		 */
		def protected duplicateNodeMethods(ConstructorDeclaration constructor, 
			MethodDeclaration method, 
			HashMap<TypeReference,String> containers, 
			MutableClassDeclaration annotatedClass,
			extension TransformationContext context 
		) {
			
			var almostOne = false
			
			for (container : containers.keySet) {
				
				val operMethod = containers.get(container)
				annotatedClass.addMethod(method.simpleName) [
					static = method.static
					var paramsString = ""
					var paramTypesString = ""
					var operAff = ""
					var operAffText=""
					if (!operMethod.trim.empty) {
						//---We have a method to insert the new object in the container
						operAff = "parent." + operMethod + "(obj);"
						operAffText = " with " + operMethod + ""
						addParameter("parent", container)
					}



					for (parameter : constructor.parameters) {
						var paramName =parameter.simpleName  + "_"  
						if (paramsString.nullOrEmpty) {
							paramsString = paramName
							paramTypesString = parameter.type.name
						} else {
							paramsString = paramsString + "," + paramName
							paramTypesString = paramTypesString + "," + parameter.type.name
						}
						addParameter(paramName, parameter.type)
					}
				

					visibility = Visibility::PUBLIC
					returnType = method.returnType
					addParameter("init", Procedures$Procedure1.newTypeReference(returnType))
					val oper = "new " + method.returnType.simpleName + " (" + paramsString + ")"
					val operOrNothing = operAff
					val operTextOrNothing = operAffText
					body = [
						'''
							«method.returnType» _obj = «oper»;
							final «method.returnType» obj = org.eclipse.xtext.xbase.lib.ObjectExtensions.
															<«method.returnType»>operator_doubleArrow(_obj, init);
							«operOrNothing»
							return (obj);
						''']
					docComment = "Create a new " + method.returnType + "[...] instance associated to a " +
						container.simpleName + operTextOrNothing + "."
					docComment = docComment + " See {@link " + annotatedClass.compilationUnit.packageName +
												"." + annotatedClass.compilationUnit.simpleName + "}"
					if (operAff != "") docComment = docComment + "\n@param parent is the receiver"
					docComment = docComment + "\n@param init is the closure builder where inserts can be added "
					docComment = docComment + "\n@return the new created {@link "+ method.returnType.name + "#" + 
								method.returnType.simpleName +"(" + paramTypesString + ") " + method.returnType + "[...]} Object"
					docComment = docComment + "\n@see " + container.name
					//docComment = docComment + "\n@see " + method.returnType.name + "#Constructor(" +
						//paramTypesString + ")"
					setExceptions(method.exceptions)
				//---Todo check the ability to get the constructors param name (java 8)
				]
				almostOne = true
			}
			return almostOne
		}


		/**@return the XtendTree (the last one) attached to this class or null if none */
		protected def getXtendTree(ClassDeclaration member){
			val annotations = member.annotations.filter[annotationTypeDeclaration.qualifiedName == XtendTree.name]
			return annotations.last 
		}

		/**@return the XtendNode(s) attached to this member or null if none */
		protected def getXtendNodeS(MemberDeclaration member){
			val annotations = member.annotations.filter[annotationTypeDeclaration.qualifiedName == XtendNode.name]
			return annotations 
		}
		
		
		
		/**@return true if the method has a body not empty*/
		protected def hasABody(MethodDeclaration method){
				val bodBody = method.body
				if (bodBody != null)
				 	return ! bodBody.toString.matches("[{]\\s*[}]")
				 
				 return false
		}
		




		/**Add an error message to the method (if possible) or the annotatedClass */
		def protected error(MethodDeclaration method, MutableClassDeclaration annotatedClass,
			extension TransformationContext context, String msg) {
			// do not work : if (method.compilationUnit === annotatedClass.compilationUnit)
			if (method.declaringType === annotatedClass)
				method.addError(msg)
			else
				annotatedClass.addError(msg)
		}

		/**Add a warning message to the method (if possible) or the annotatedClass */
		def protected warning(MethodDeclaration method, MutableClassDeclaration annotatedClass,
			extension TransformationContext context, String msg) {
			// do not work : if (method.compilationUnit === annotatedClass.compilationUnit)
			if (method.declaringType === annotatedClass)
				method.addWarning(msg)
			else
				annotatedClass.addWarning(msg)
		}

		/**Analyse the string representation (which may be a complex one) of a Type */
		protected def TypeReference getComplexTypeRef(String typeString, extension TransformationContext context) throws
			DocXException {
			val mainTypeName = typeString.replaceFirst("\\<.+", "").trim

			if (! xType.containsKey(mainTypeName))
				throw new DocXException(
					mainTypeName + " is not a valid class name for a XtendNode. One method at least must return it : " +
						typeString)

			var typeRef = xType.get(mainTypeName)

			val subTypeList = <TypeReference>newArrayList()
			if (typeString.contains("<")) {
				val subTypes = typeString.replaceFirst(".*\\<", "").replaceAll("\\>$", "")

				for (subType : subTypes.split(",")) {
					subTypeList.add(subType.getComplexTypeRef(context))
				}
				typeRef = newTypeReference(xType.get(mainTypeName).type.qualifiedName, subTypeList)
			}

			if(typeRef == null) throw new DocXException(typeString + " cannot be used as a type")
			return typeRef

		}

		/**@return true if this method has @XtendNode(usingConstructors = true) */
		protected def getIsToGenerateFromConstructors(MethodDeclaration method) {
			var defaultValue = false
			for (annotation : method.annotations.filter[
				annotationTypeDeclaration.qualifiedName == XtendNode.name]) {
				val booli = annotation.getValue(IXtendNode::usingConstructors) as Boolean
				if (booli != null && booli != defaultValue) {
					return true
				}
			}
			return false
		}

		/** extract the container class from the affectation expression */
		protected def getContainerClassName(String lineXtree) {
			lineXtree.replaceFirst("\\.\\..*", "").trim
		}

		/** extract the affectation method from the affectation expression */
		protected def getMethodAffectation(String lineXtree) {
			lineXtree.replaceFirst(".*\\.\\.", "").trim
		}

	}

	/**Internal Exception
	 * @author mvidal           
	 */
	class DocXException extends Exception {
		new(String s) {
			super(s)
		}

		new(Exception e) {
			super(e)
		}

		new(String s, Exception e) {
			super(s, e)
		}
	}
	