#!/usr/bin/env groovy

	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
	import net.bioclipse.managers.CDKManager

	def cdk = new CDKManager(".");

	try {
	mol = cdk.fromSMILES("[<http://www.wikidata.org/entity/Q169326>, CC1CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O]")
	ac = mol.getAtomContainer()
	logP=new JPLogPDescriptor()
	logP.calculate(ac)
	  println "Log P:" +
	((DoubleResult)logP.calculate(ac).value).doubleValue()

	}
