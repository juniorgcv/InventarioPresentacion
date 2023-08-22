using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CEntidades;
using CNegocio;

namespace InventarioPresentacion
{
    public partial class frmCategorias : Form
    {
        public frmCategorias()
        {
            InitializeComponent();
        }

        #region "Mis Variables"
        int IdCategoria = 0;
        int EstadoGuardar = 0;//sin nunguna accion

        #endregion


        #region "Mis Metodos"
        private void FormatoCa()
        {

            dataGridViewlist.Columns[0].Width = 100;
            dataGridViewlist.Columns[0].HeaderText = "Cod_Categoria";
            dataGridViewlist.Columns[1].Width = 300;
            dataGridViewlist.Columns[1].HeaderText = "Categoria";

        }

        private void ListadoCa(string cTexto)
        {

            try
            {

                dataGridViewlist.DataSource = CNCategorias.ListadoCa(cTexto);
                this.FormatoCa();

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message + ex.StackTrace);

            }
        }


        public void EstadobtnPrincipales(bool lEstado)
        {

            this.btnnuevo.Enabled = lEstado;
            this.btnactualizar.Enabled = lEstado;
            this.btneliminar.Enabled = lEstado;
            this.btnreporte.Enabled = lEstado;
            this.btnsalir.Enabled = lEstado;

        }


        private void EstadobtnProcesos(bool lEstado)
        {

            this.btncancelar.Visible = lEstado;
            this.btnguardar.Visible = lEstado;
            this.btnregresar.Visible = !lEstado;

        }


        private void SelecionItem()
        {

           if (string.IsNullOrEmpty(Convert.ToString(dataGridViewlist.CurrentRow.Cells["IdCategoria"].Value)))
           {

                MessageBox.Show("no se tiene informacion para visualizar","Aviso del sistema",MessageBoxButtons.OK, MessageBoxIcon.Error);

           }
           else
            {

                this.IdCategoria = Convert.ToInt32(dataGridViewlist.CurrentRow.Cells["IdCategoria"].Value);
                txtdescri.Text = Convert.ToString(dataGridViewlist.CurrentRow.Cells["Descripcion"].Value);

            }

            

        }

        #endregion

        private void frmCategorias_Load(object sender, EventArgs e)
        {
            this.ListadoCa("%");
        }

        private void btnguardar_Click(object sender, EventArgs e)
        {
            if(txtdescri.Text== string.Empty)
            {

                MessageBox.Show("falta ingresar datos requeridos (*)", "aviso del sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            else // se registra nueva informacion
            {

                CECategorias oCa = new CECategorias();
                string Rpta = "";
                oCa.IdCategoria = this.IdCategoria;
                oCa.Descripcion =txtdescri.Text.Trim();
                Rpta = CNCategorias.GuardaCa(EstadoGuardar, oCa);
                if(Rpta == "Ok")
                {

                    MessageBox.Show("Los datos han sido guardados correctamente", "Aviso del sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    EstadoGuardar = 0; // ninguna accion
                    this.EstadobtnPrincipales(true);
                    this.EstadobtnProcesos(false);
                    txtdescri.Text = "";
                    txtdescri.ReadOnly = true;
                    tabprincipal.SelectedIndex = 0;
                    this.IdCategoria = 0;

                }
                else
                {

                    MessageBox.Show(Rpta, "Aviso del sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);


                }


                    this.ListadoCa("%");
            }    
        }

        private void btnnuevo_Click(object sender, EventArgs e)
        {
            EstadoGuardar = 1; //nuevo registro
            this.EstadobtnPrincipales(false);
            this.EstadobtnProcesos(true);
            txtdescri.Text = "";
            txtdescri.ReadOnly = false;
            tabprincipal.SelectedIndex = 1;
            txtdescri.Focus();
        }

        private void btnactualizar_Click(object sender, EventArgs e)
        {
            EstadoGuardar = 2;//actualizar registros
            this.EstadobtnPrincipales(false);
            this.EstadobtnProcesos(true);
            this.SelecionItem();
            tabprincipal.SelectedIndex = 1;
            txtdescri.ReadOnly = false;
            txtdescri.Focus();
        }

        private void btncancelar_Click(object sender, EventArgs e)
        {
            EstadoGuardar = 0;// ninguna accion
            this.IdCategoria = 0;
            txtdescri.Text = "";
            txtdescri.ReadOnly = true;
            this.EstadobtnPrincipales(true);
            this.EstadobtnProcesos(false);
            tabprincipal.SelectedIndex = 0;
        }

        private void dataGridViewlist_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            this.SelecionItem();
            this.EstadobtnProcesos(false);
            tabprincipal.SelectedIndex = 1;
        }

        private void btnregresar_Click(object sender, EventArgs e)
        {
            this.EstadobtnProcesos(false);
            tabprincipal.SelectedIndex = 0;
            this.IdCategoria = 0;
        }

        private void btneliminar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(Convert.ToString(dataGridViewlist.CurrentRow.Cells["IdCategoria"].Value)))
            {

                MessageBox.Show("no se tiene informacion para visualizar", "Aviso del sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            else
            {

                DialogResult Opcion;
                Opcion = MessageBox.Show("Segura que quiere eliminar el registro?", "Avis del sistema", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (Opcion == DialogResult.Yes)
                {

                    string Rpta = "";
                    this.IdCategoria = Convert.ToInt32(dataGridViewlist.CurrentRow.Cells["IdCategoria"].Value);
                    Rpta = CNCategorias.EliminarCa(this.IdCategoria);//Eliminar datos
                    if (Rpta.Equals("OK"))
                    {

                        this.ListadoCa("%");
                        this.IdCategoria = 0;
                        MessageBox.Show("Registro Eliminado", "Aviso del sisitema", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

                    }

                }

                               

            }

        }

        private void btnbuscar_Click(object sender, EventArgs e)
        {
            this.ListadoCa(txtbuscar.Text.Trim());
        }

        private void btnreporte_Click(object sender, EventArgs e)
        {
            Reportes.frmReportCat oRpt1 = new Reportes.frmReportCat();
            oRpt1.txtp1.Text = txtbuscar.Text;
            oRpt1.ShowDialog();
        }
    }
}
