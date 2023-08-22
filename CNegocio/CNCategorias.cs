using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CEntidades;
using CDatos;

namespace CNegocio
{
    public class CNCategorias
    {

        public static DataTable ListadoCa(string cTexto)
        {

            CDCategorias datos = new CDCategorias();    
            return datos.ListadoCa(cTexto);

        }


        public static string GuardaCa(int nOpcion, CECategorias oCa)
        {

            CDCategorias datos = new CDCategorias();
            return datos.GuardarCa(nOpcion, oCa);

        }


        public static string EliminarCa(int IdCategoria)
        {

            CDCategorias datos = new CDCategorias();
            return datos.EliminarCa(IdCategoria);

        }

    }
}
