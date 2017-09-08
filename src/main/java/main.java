
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

import org.openrdf.model.Model;
import org.openrdf.model.Statement;
import org.openrdf.model.impl.LinkedHashModel;
import org.openrdf.rio.RDFFormat;
import org.openrdf.rio.RDFHandlerException;
import org.openrdf.rio.Rio;

import clojure.lang.LazySeq;
import clojure.lang.RT;

public class main {
	public static void main(String[] args) throws IOException, RDFHandlerException {
		RT.loadResourceScript("pipelines/RetribucionesNominativas.clj");
		 LazySeq lazy = (LazySeq) RT.var("pipelines.RetribucionesNominativas",
		 "convertidor").invoke("./DatosIniciales/retribuciones_nominativas.csv");
		 Iterator ite = lazy.iterator();
		 Model model = new LinkedHashModel();
		 while (ite.hasNext()) {
		 model.add((Statement) ite.next());
		 }
		 /**
		 * C�digo para sacar el archivo RDF/XML-TURTLE
		 */
		 File file = new File("./DatosConvertidos/archivoRnominativas.rdf");
		 FileOutputStream fileTurtle = new FileOutputStream(file);
		 Rio.write(model, fileTurtle, RDFFormat.NQUADS);
	}
}