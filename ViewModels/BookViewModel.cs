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




    }
}
