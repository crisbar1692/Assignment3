#!/usr/bin/env nextflow

@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor
import org.openscience.cdk.interfaces.IAtomContainer


Channel
	.fromPath("./short.tsv")
	.splitCsv(header: ['wikidata','smiles'],sep:'\t')
	.map{row->tuple(row.wikidata,row.smiles)}
	.set{molecules_ch}

process printSMILES {


    input:
    val wikidata, smiles from molecules_ch

    def cdk = new CDKManager(".");
	try {
	mol = cdk.fromSMILES("$smile")
	ac = mol.getAtomContainer()
	descriptor=new JPLogPDescriptor()
	logP=descriptor.calculate(ac).value
	  println "Log P:" + logP
	

	}catch (Exception exc) {
    println "Error in " 
     } 
      """
}

out.println{ it }
