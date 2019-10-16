#!/usr/bin/env groovy
	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
	import net.bioclipse.managers.CDKManager
	import org.openscience.cdk.interfaces.IAtomContainer;
	import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor;
	def cdk = new CDKManager(".");

	try {
	mol = cdk.fromSMILES("[<http://www.wikidata.org/entity/Q27145494>, CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O]")
	ac = mol.getAtomContainer()
	descriptor=new JPLogPDescriptor()
	logP=descriptor.calculate(ac).value
	  println "Log P:" + logP
	

	}catch (Exception exc) {
    println "Error in " 
     }
