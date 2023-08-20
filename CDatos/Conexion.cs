using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

namespace CDatos
{
    public class Conexion
    {

        private string Base;
        private string Servidor;
        private string Usuario;
        private string Calve;
        private bool Seguridad;
        private static Conexion Con = null;


        private Conexion()
        {

            this.Base = "dbinventario";
            this.Servidor = "LAPTOP-QGKM50FL\\SQLEXPRESS";
            this.Usuario = "juniorgcv";
            this.Calve = "123456";
            this.Seguridad = false;

        }


        public SqlConnection CreaConexion()
        {

            SqlConnection Cadena = new SqlConnection();
            try
            {

                Cadena.ConnectionString = "Server=" + this.Servidor + "; Database=" + this.Base + ";";
                if (Seguridad)
                {

                    Cadena.ConnectionString = Cadena.ConnectionString + "Integrated Security = SSPI";
                }
                else
                {

                    Cadena.ConnectionString=Cadena.ConnectionString+"User Id=" + this.Usuario + "; Password=" + this.Calve;

                }


            }
            catch(Exception ex)
            {

                Cadena = null;
                throw ex;


            }

            return Cadena;

        }

        public static Conexion getInstancia()
        {

            if (Con == null)
            {

                Con = new Conexion();

            }    

            return Con;
                

        }


    }
}
