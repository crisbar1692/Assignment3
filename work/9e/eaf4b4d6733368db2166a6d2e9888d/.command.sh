#!/usr/bin/env groovy

	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	import net.bioclipse.managers.CDKManager

	def cdk = new CDKManager(".");

	try {
	  mol = cdk.fromSMILES("[<http://www.wikidata.org/entity/Q27145494>, CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O]")
	  println "No problem while parsing this SMILE: [<http://www.wikidata.org/entity/Q27145494>, CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O]"
	} catch (Exception exc) {
	  println "Error in parsing this SMILE [<http://www.wikidata.org/entity/Q27145494>, CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O]"
	}
