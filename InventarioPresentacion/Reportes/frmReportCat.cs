using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace InventarioPresentacion.Reportes
{
    public partial class frmReportCat : Form
    {
        public frmReportCat()
        {
            InitializeComponent();
        }

        private void frmReportCat_Load(object sender, EventArgs e)
        {
            this.listarCaTableAdapter.Fill(this.dataSet1.ListarCa, cTexto: txtp1.Text);
            this.reportViewer1.RefreshReport();
        }
    }
}
