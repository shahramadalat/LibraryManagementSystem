using Dapper;
using LibraryManagementApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class BookViewModel:Parrentconnection
    {
        public async Task<List<Book>> GetItemsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Book>("select * from vw_BookMainView order by BookId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }

        public async Task<List<Book>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Book>("sp_GetFilteredBook", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();

        }


    }
}
