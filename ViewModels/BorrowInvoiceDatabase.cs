using Dapper;
using LibraryManagementApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class BorrowInvoiceDatabase:Parrentconnection
    {
        public async Task<List<BorrowInvoice>> GetAccountsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<BorrowInvoice>("select * from vw_GetFilteredBorrowInvoice order by BorrowInvoiceId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }
        public async Task<List<BorrowInvoice>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<BorrowInvoice>("sp_GetFilteredBorrowInvoice", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();

        }
    }
}
