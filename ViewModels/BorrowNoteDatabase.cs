using Dapper;
using LibraryManagementApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class BorrowNoteDatabase:Parrentconnection
    {
        public async Task<List<BorrowNote>> GetAccountsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<BorrowNote>("select * from vw_GetBorrowNote order by borrowId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }

        public async Task<List<BorrowNote>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<BorrowNote>("sp_GetFilteredPerson", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();
        }
    }
}
