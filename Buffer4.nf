

@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor
import org.openscience.cdk.interfaces.IAtomContainer
import groovy.time.TimeCategory
import groovy.time.TimeDuration


//Specify the file where the molecules will be taken from
Channel
	.fromPath("./AllSmilesWikidata.tsv")
//Split the file and put headers
	.splitCsv(header: ['wikidata','smiles'],sep:'\t')
	.map{row->tuple(row.wikidata,row.smiles)}
//Define the buffer to simulate the use of less cores
	.buffer( size: 4, remainder: true)
//Define the name of the variable containing all the data
	.set{molecules_ch}

//Start process to calculate LogP
process printLogP {

//Take the input from molecules_ch to set to iterate in the for loop
    input:
    each set from molecules_ch

exec:
//Start for loop over each molecule in set	
	for (entry in set){
//Define method to parse  the smiles
	def cdk = new CDKManager(".");
	try {
//Assign corresponding entry of the smiles to variable smiles
	smiles=entry[1]
//Parse the smiles
	molecule = cdk.fromSMILES(smiles)
//Define method to calculate LogP
	descriptor=new JPlogPDescriptor()
//Calculate Atom container as required input for logP calculation
	Atom_Container=molecule.getAtomContainer()
//Calculate Log P
	logP=descriptor.calculate(Atom_Container).value.toString()
//print logP
	  println "Log P:" + logP +" for "+molecule
		
//Print error in in case of error in the process
	}catch (Exception exc) {
    println "Error in " 
     } 
    
}
}
