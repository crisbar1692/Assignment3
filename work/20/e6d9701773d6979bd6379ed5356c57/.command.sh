#!/usr/bin/env groovy

@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
import net.bioclipse.managers.CDKManager

def cdk = new CDKManager(".");

try {
  mol = cdk.fromSMILES("CC4CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O")
  println "No problem while parsing this SMILE: CC4CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O"
} catch (Exception exc) {
  println "Error in parsing this SMILE CC4CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O"
}
