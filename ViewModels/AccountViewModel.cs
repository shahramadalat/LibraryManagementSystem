﻿using LibraryManagementApplication.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using System.Linq;

namespace LibraryManagementApplication.ViewModels
{
    internal class AccountViewModel : Parrentconnection
    {
        public List<Account> accountList = new List<Account>();
        public AccountViewModel()
        {

        }
        public async Task<List<Account>> GetAccountsAsync()
        { 
            await con.OpenAsync();
            var accounts = await con.QueryAsync<Account>("select * from Account order by AccountId desc");
            await con.CloseAsync();
            return accounts.ToList();
        }
      
            

        



    }
}