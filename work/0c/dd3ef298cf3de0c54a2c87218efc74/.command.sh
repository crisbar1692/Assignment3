#!/usr/bin/env groovy

	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
	import net.bioclipse.managers.CDKManager

	def cdk = new CDKManager(".");

	try {
	mol = cdk.fromSMILES("[<http://www.wikidata.org/entity/Q27145494>, CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O]")
	ac = mol.getAtomContainer()
	logP=new JPLogPDescriptor()
	logP.calculate(ac)
	  println "Log P:" +
	((DoubleResult)logP.calculate(ac).value).doubleValue()

	}
