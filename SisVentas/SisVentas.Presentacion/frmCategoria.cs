using SisVentas.Negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SisVentas.Presentacion
{
    public partial class frmCategoria : Form
    {
        public frmCategoria()
        {
            InitializeComponent();
        }

        private void Listar()
        {
            try
            {
                dgvListado.DataSource = NCategoria.Listar();
                this.Formato();
                lblTotal.Text = "Total registros: " + Convert.ToString(dgvListado.Rows.Count);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void Buscar()
        {
            try
            {
                dgvListado.DataSource = NCategoria.Buscar(txtBuscar.Text);
                this.Formato();
                lblTotal.Text = "Total registros: " + Convert.ToString(dgvListado.Rows.Count);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void Formato()
        {
            dgvListado.Columns[0].Visible = false;
            dgvListado.Columns[1].Visible = false;
            dgvListado.Columns[2].Width = 200;
            dgvListado.Columns[3].Width = 600;
            dgvListado.Columns[3].HeaderText = "Descripción";
            dgvListado.Columns[4].Width = 100;

        }

        private void Limpiar()
        {
            txtBuscar.Clear();
            txtNombre.Clear();
            txtID.Clear();
            txtDescripcion.Clear();
            btnInsertar.Visible = true;
            errorIcono.Clear();
        }

        private void MensajeError(string mensaje)
        {
            MessageBox.Show(mensaje, "SisVentas - Sistema de ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void MensajeOK(string mensaje)
        {
            MessageBox.Show(mensaje, "SisVentas - Sistema de ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void frmCategoria_Load(object sender, EventArgs e)
        {
            this.Listar();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.Buscar();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                string Rpta = "";
                if(txtNombre.Text == string.Empty)
                {
                    this.MensajeError("Falta ingresar algunos datos, serán remarcados");
                    errorIcono.SetError(txtNombre, "Ingrese un nombre.");
                }
                else
                {
                    Rpta = NCategoria.Insertar(txtNombre.Text.Trim(), txtDescripcion.Text.Trim());
                    if (Rpta.Equals("OK"))
                    {
                        this.MensajeOK("Se ha insertado de forma correcta el registro");
                        this.Limpiar();
                        this.Listar();  
                    }
                    else
                    {
                        this.MensajeError(Rpta);
                    }
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Limpiar();
            tabGeneral.SelectedIndex = 0;
        }
    }
}
