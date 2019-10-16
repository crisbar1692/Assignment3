#!/usr/bin/env groovy

@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
import net.bioclipse.managers.CDKManager

def cdk = new CDKManager(".");

try {
  mol = cdk.fromSMILES("CC1=CC=CC2=CC=CC=C12")
  println "No problem while parsing this SMILE: CC1=CC=CC2=CC=CC=C12"
} catch (Exception exc) {
  println "Error in parsing this SMILE CC1=CC=CC2=CC=CC=C12"
}
