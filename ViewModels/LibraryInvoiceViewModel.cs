using Dapper;
using LibraryManagementApplication.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class LibraryInvoiceViewModel:Parrentconnection
    {
        public async Task<List<LibraryInvoice>> GetAccountsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<LibraryInvoice>("select * from vw_LibraryInvoice order by LibraryId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }
        public async Task<List<LibraryInvoice>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<LibraryInvoice>("sp_GetFilteredAccount", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();

        }
    }
}
