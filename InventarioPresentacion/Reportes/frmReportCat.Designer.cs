namespace InventarioPresentacion.Reportes
{
    partial class frmReportCat
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.dataSet1 = new InventarioPresentacion.Reportes.DataSet1();
            this.listarCaBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.listarCaTableAdapter = new InventarioPresentacion.Reportes.DataSet1TableAdapters.ListarCaTableAdapter();
            this.txtp1 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.listarCaBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.listarCaBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "InventarioPresentacion.Reportes.ReportDCategorias.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(800, 450);
            this.reportViewer1.TabIndex = 0;
            // 
            // dataSet1
            // 
            this.dataSet1.DataSetName = "DataSet1";
            this.dataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // listarCaBindingSource
            // 
            this.listarCaBindingSource.DataMember = "ListarCa";
            this.listarCaBindingSource.DataSource = this.dataSet1;
            // 
            // listarCaTableAdapter
            // 
            this.listarCaTableAdapter.ClearBeforeFill = true;
            // 
            // txtp1
            // 
            this.txtp1.Location = new System.Drawing.Point(12, 34);
            this.txtp1.Name = "txtp1";
            this.txtp1.Size = new System.Drawing.Size(100, 20);
            this.txtp1.TabIndex = 1;
            this.txtp1.Visible = false;
            // 
            // frmReportCat
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txtp1);
            this.Controls.Add(this.reportViewer1);
            this.Name = "frmReportCat";
            this.Text = "frmReportCat";
            this.Load += new System.EventHandler(this.frmReportCat_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.listarCaBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource listarCaBindingSource;
        private DataSet1 dataSet1;
        private DataSet1TableAdapters.ListarCaTableAdapter listarCaTableAdapter;
        public System.Windows.Forms.TextBox txtp1;
    }
}