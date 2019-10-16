#!/usr/bin/env groovy
	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
	import net.bioclipse.managers.CDKManager
	import org.openscience.cdk.interfaces.IAtomContainer;
	import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor;
	def cdk = new CDKManager(".");

	try {
	mol = cdk.fromSMILES("[<http://www.wikidata.org/entity/Q161656>, CC1=CC=CC2=CC=CC=C12]")
	ac = mol.getAtomContainer()
	descriptor=new JPLogPDescriptor()
	logP=descriptor.calculate(ac)
	  println "Log P:" + logP
	

	}catch (Exception exc) {
    println "Error in " + fields[0] + ": " + exc.message
}
