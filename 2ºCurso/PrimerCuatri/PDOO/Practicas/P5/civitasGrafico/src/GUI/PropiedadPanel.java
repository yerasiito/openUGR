/**
 * @file PropiedadPanel.java
 * @author Yeray Lopez Ramirez
 * @author Jaime Castillo Ucles
 * @date Diciembre de 2021
 */
package GUI;

import civitas.CasillaCalle;

/**
 *
 * @author yerasito
 */
public class PropiedadPanel extends javax.swing.JPanel {
    CasillaCalle tituloPropiedad;
    /**
     * Creates new form PropiedadPanel
     */
    public PropiedadPanel() {
        initComponents();
    }
    
    public void setPropiedad(CasillaCalle propiedad){
        tituloPropiedad = propiedad;
        
        nombre.setText(propiedad.getNombre());
        numCasas.setText(String.valueOf(propiedad.getNumCasas()));
        numHoteles.setText(String.valueOf(propiedad.getNumHoteles()));

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        nombre = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        numCasas = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        numHoteles = new javax.swing.JTextField();

        jLabel1.setText("Propiedad:");
        add(jLabel1);

        nombre.setText("nombre");
        nombre.setBorder(null);
        add(nombre);

        jLabel2.setText("Número de casas:");
        add(jLabel2);

        numCasas.setText("numCasas");
        numCasas.setBorder(null);
        add(numCasas);

        jLabel3.setText("Número de hoteles:");
        add(jLabel3);

        numHoteles.setText("numHoteles");
        numHoteles.setBorder(null);
        add(numHoteles);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JTextField nombre;
    private javax.swing.JTextField numCasas;
    private javax.swing.JTextField numHoteles;
    // End of variables declaration//GEN-END:variables
}
