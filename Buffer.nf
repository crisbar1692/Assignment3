
@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor
import org.openscience.cdk.interfaces.IAtomContainer
import groovy.time.TimeCategory
import groovy.time.TimeDuration


//Specify the file where the molecules will be taken from
Channel
	.fromPath("./Small.tsv")
//Split the file and put headers
	.splitCsv(header: ['wikidata','smiles'],sep:'\t')
	.map{row->tuple(row.wikidata,row.smiles)}
//Define the buffer to simulate the use of less cores
	.buffer( size: 2, remainder: true)
//Define the name of the variable containing all the data
	.set{molecules_ch}

//Start process to calculate LogP
process printLogP {


    input:
    each set from molecules_ch
exec:
	
	for (entry in set){
	def cdk = new CDKManager(".");
	try {
	smiles=entry[1]
	molecule = cdk.fromSMILES(smiles)
	descriptor=new JPlogPDescriptor()
	Atom_Container=molecule.getAtomContainer()
	logP=descriptor.calculate(Atom_Container).value.toString()
	  println "Log P:" + logP +" for "+molecule
		

	}catch (Exception exc) {
    println "Error in " 
     } 
    
}
}
