using Dapper;
using LibraryManagementApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class LibraryNoteViewModel:Parrentconnection
    {
        public async Task<List<LibraryNote>> GetAccountsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<LibraryNote>("select * from vw_LibraryNote order by LibraryNoteId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }
     
    }
}
