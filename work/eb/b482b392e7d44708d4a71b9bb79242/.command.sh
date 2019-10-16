#!/usr/bin/env groovy
	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
	import net.bioclipse.managers.CDKManager

	def cdk = new CDKManager(".");

	try {
	mol = cdk.fromSMILES("[<http://www.wikidata.org/entity/Q168790>, CC1CCCC=CC2CC(CC2C(C=CC(=O)O1)O)O]")
	ac = mol.getAtomContainer()
	descriptor=new JPLogPDescriptor()
	logP=descriptor.calculate(ac)
	  println "Log P:" + logP
	

	}
