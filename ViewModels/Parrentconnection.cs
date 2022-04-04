using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Dapper;


namespace LibraryManagementApplication.ViewModels
{
    internal class Parrentconnection
    {
        public SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IRGJ8GC; Initial Catalog=LibraryDb; Integrated Security=True; Encrypt=True; TrustServerCertificate=True; User Instance=False");

        // methodaka dawai parameter aka, ka codey sql a, 1 data agarenetawa
        public async Task<string> GetScalerValueAsync(string sql)
        {
            await con.CloseAsync();
            await con.OpenAsync();
            var lastId = await con.ExecuteScalarAsync(sql);
            await con.CloseAsync();
            return lastId.ToString();
        }

        // dawai 2 parameter aka, sql wa parameter bo sqlaka
        public async Task<int> ExcuteAsyncWithParameters(string sql,Dictionary<string,object> parameters)
        {
            await con.OpenAsync();
            var par = new DynamicParameters(parameters);
            await con.ExecuteAsync(sql,par);
            await con.CloseAsync();
            return 1;
        }

        public async Task<int> ExcuteAsync(string sql)
        {
            await con.OpenAsync();
            await con.ExecuteAsync(sql);
            await con.CloseAsync();
            return 1;
        }


    }
   
}
