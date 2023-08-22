using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CEntidades;

namespace CDatos
{
    public class CDCategorias
    {

        public DataTable ListadoCa(string cTexto)
        {

            SqlDataReader Resultado;
            DataTable Tabla = new DataTable();
            SqlConnection SQlCon = new SqlConnection();


            try
            {

                SQlCon = Conexion.getInstancia().CreaConexion();
                SqlCommand comando = new SqlCommand("ListarCa", SQlCon);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("@cTexto", SqlDbType.VarChar).Value = cTexto;
                SQlCon.Open();
                Resultado = comando.ExecuteReader();
                Tabla.Load(Resultado);
                return Tabla;
            }
            catch(Exception ex) 
            {

                throw ex;

            }
            finally
            {

                if(SQlCon.State== ConnectionState.Open)SQlCon.Close();

            }

        }

        public string GuardarCa(int nOpcion,CECategorias oCa)
        {

            string Rpta = "";
            SqlConnection SQlCon = new SqlConnection(); 
            try
            {

                SQlCon = Conexion.getInstancia().CreaConexion();
                SqlCommand comando = new SqlCommand("GuardaCa", SQlCon);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("@nOpcion",SqlDbType.Int).Value = nOpcion;
                comando.Parameters.Add("@nCodigoca", SqlDbType.Int).Value = oCa.IdCategoria;
                comando.Parameters.Add("@cDescripcion", SqlDbType.VarChar).Value = oCa.Descripcion;
                SQlCon.Open();
                Rpta = comando.ExecuteNonQuery()==1 ? "OK" : "No se puedo registrar los datos";

            }
            catch(Exception ex)
            {

                Rpta = ex.Message;

            }
            finally
            {

                if(SQlCon.State== ConnectionState.Open) SQlCon.Close();

            }
            return Rpta;

        }



        public string EliminarCa(int IdCategoria)
        {

            string Rpta = "";
            SqlConnection SQlCon = new SqlConnection();
            try
            {

                SQlCon = Conexion.getInstancia().CreaConexion();
                SqlCommand comando = new SqlCommand("EliminarCa", SQlCon);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("@nCodigoca", SqlDbType.Int).Value = IdCategoria;                
                SQlCon.Open();
                Rpta = comando.ExecuteNonQuery() == 1 ? "OK" : "No se puedo eliminar los datos";

            }
            catch (Exception ex)
            {

                Rpta = ex.Message;

            }
            finally
            {

                if (SQlCon.State == ConnectionState.Open) SQlCon.Close();

            }
            return Rpta;

        }


    }
}
