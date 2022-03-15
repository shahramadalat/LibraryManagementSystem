using Dapper;
using LibraryManagementApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class CategoreyViewModel:Parrentconnection
    {
        public async Task<List<Categorey>> GetItemsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Categorey>("select * from Categorey order by CategoreyId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }
        public async Task<List<Categorey>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Categorey>("sp_GetFilteredCategorey", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();

        }
    }
}
