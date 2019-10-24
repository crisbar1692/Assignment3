

@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor
import org.openscience.cdk.interfaces.IAtomContainer
import groovy.time.TimeCategory
import groovy.time.TimeDuration


Channel
	.fromPath("./Small.tsv")
	.splitCsv(header: ['wikidata','smiles'],sep:'\t')
	.map{row->tuple(row.wikidata,row.smiles)}
	.buffer( size: 50000, remainder: true)
	.set{molecules_ch}

process printSMILES {


    input:
    set wikidata, smiles from molecules_ch
exec:
	
	def cdk = new CDKManager(".");
	try {
	mol = cdk.fromSMILES(smiles)
	descriptor=new JPlogPDescriptor()
	logP=descriptor.calculate(mol.getAtomContainer()).value.toString()
	  println "Log P:" + logP +" for "+mol

	

	}catch (Exception exc) {
    println "Error in " 
     } 
    
}