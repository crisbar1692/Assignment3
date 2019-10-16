#!/usr/bin/env groovy

	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	import net.bioclipse.managers.CDKManager

	def cdk = new CDKManager(".");

	try {
	  mol = cdk.fromSMILES("[<http://www.wikidata.org/entity/Q168790>, CC1CCCC=CC2CC(CC2C(C=CC(=O)O1)O)O]")
	  println "No problem while parsing this SMILE: [<http://www.wikidata.org/entity/Q168790>, CC1CCCC=CC2CC(CC2C(C=CC(=O)O1)O)O]"
	} catch (Exception exc) {
	  println "Error in parsing this SMILE [<http://www.wikidata.org/entity/Q168790>, CC1CCCC=CC2CC(CC2C(C=CC(=O)O1)O)O]"
	}
