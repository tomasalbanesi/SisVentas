using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace SisVentas.Datos
{
    public class Conexion
    {

        private string _base;
        private string _servidor;
        private string _usuario;
        private string _clave;
        private bool _seguridad;
        private static Conexion conn = null; // Es lo unico que voy a compartir, ya que es el que me permite compartir la conexion

        private Conexion()
        {
            this._base = "dbSisVentas";
            this._servidor = "TAA-PC-PRODIGYO";
            this._usuario = "sa";
            this._clave = "tx*prodigyo2018";
            this._seguridad = true;
        }

        public SqlConnection CrearConexion()
        {

            SqlConnection cadena = new SqlConnection();
            try
            {
                cadena.ConnectionString = "Server=" + this._servidor + "; Database=" + this._base + ";";
                
                if (this._seguridad == true)
                {
                    cadena.ConnectionString = cadena.ConnectionString + "Integrated Security = SSPI";
                }
                else
                {
                    cadena.ConnectionString = cadena.ConnectionString + "User id=" + this._usuario + ";Password=" + this._clave;
                }
            }
            catch(Exception ex)
            {
                cadena = null;
                throw ex;
            }

            return cadena;

        }

        public static Conexion getInstancia()
        {
            if(conn == null)
            {
                conn = new Conexion();
            }

            return conn;
        }

    }
}
