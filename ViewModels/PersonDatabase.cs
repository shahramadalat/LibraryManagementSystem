using Dapper;
using LibraryManagementApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class PersonDatabase:Parrentconnection
    {
        public async Task<List<Person>> GetAccountsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Person>("select * from Person order by PersonId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }

        public async Task<List<Person>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Person>("sp_GetFilteredPerson", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();
        }
    }
}
