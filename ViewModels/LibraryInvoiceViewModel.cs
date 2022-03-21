using Dapper;
using LibraryManagementApplication.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class LibraryInvoiceViewModel:Parrentconnection
    {
        public async Task<List<LibraryInvoiceModel>> GetAccountsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<LibraryInvoiceModel>("select * from vw_LibraryInvoice order by LibraryInvoiceId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }

        public async Task<List<LibraryInvoiceModel>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<LibraryInvoiceModel>("sp_GetFilteredInvoice", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();
        }
    }
}
