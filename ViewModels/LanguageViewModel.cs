using Dapper;
using LibraryManagementApplication.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class LanguageViewModel:Parrentconnection
    {
        public async Task<List<Language>> GetItemsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Language>("select * from Language order by LanguageId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }
    }
}
