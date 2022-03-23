using Dapper;
using LibraryManagementApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.ViewModels
{
    internal class SettingDatabase:Parrentconnection
    {
        public async Task<List<SettingModel>> GetAccountsAsync()
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<SettingModel>("select * from Setting");
            await con.CloseAsync();
            return accounts.ToList();
        }
        public async Task<List<SettingModel>> GetFilteredAccountsAsync(Dictionary<string, object> parameters)
        {
            await con.OpenAsync();
            var accounts = await con.QueryAsync<SettingModel>("sp_GetFilteredAccount", parameters, commandType: System.Data.CommandType.StoredProcedure);
            await con.CloseAsync();
            return accounts.ToList();
        }
        public async Task<int> GetCount()
        {
            int count = int.Parse(await GetScalerValueAsync("select count(BooksLimit) from Setting"));
            return count;
        }
    }
}
