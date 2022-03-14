﻿using System.Collections.Generic;
using System.Windows;
using LibraryManagementApplication.Models;
using LibraryManagementApplication.ViewModels;

namespace LibraryManagementApplication.Views
{
    /// <summary>
    /// Interaction logic for AccountView.xaml
    /// </summary>
    public partial class AccountView : Window
    {
        //List<Account> accounts = new List<Account>();
        int lastid;
        int UpdateId;
        public  AccountView()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
          GetdatagridItems();
            GetLastId(); 
        }
        async void GetdatagridItems()
        {
            AccountViewModel a = new AccountViewModel();
            AccountDatagrid.ItemsSource = await a.GetAccountsAsync();
        }
       async void GetLastId()
        {
            AccountViewModel a = new AccountViewModel();
            var lid = await a.GetScalerValueAsync("select top 1 AccountId from Account order by AccountId desc");
            lastid = int.Parse(lid) + 1;
        }

        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtFullname.Text == "" || txtFullname.Text == null)
                {
                    txtFullname.Focus();
                    throw new System.Exception("Fullname must be inserted");
                }
                if (txtUser.Text == "" || txtUser.Text == null)
                {
                    txtUser.Focus();
                    throw new System.Exception("Username must be inserted");
                }
                if (txtPass.Text == "" || txtPass.Text == null)
                {
                    txtPass.Focus();
                    throw new System.Exception("Password must be inserted");
                }
                if (txtRecovery.Text == "" || txtRecovery.Text == null)
                {
                    txtRecovery.Focus();
                    throw new System.Exception("Recovery phrase must be inserted");
                }
                Account account = new Account();
                GetLastId();
                account.AccountId= lastid;
                account.Fullname= txtFullname.Text;
                account.Permission= txtPermission.Text;
                account.Password=txtPass.Text;
                account.RecoveryPhrase= txtRecovery.Text;
                account.Username = txtUser.Text;
                AccountViewModel accountViewModel = new AccountViewModel();
               await accountViewModel.ExcuteAsyncWithParameters("insert into Account values(@id,@full,@user,@pass,@re,@perm)",
                    new Dictionary<string, object> {
                        {"@id",account.AccountId },
                        {"@full",account.Fullname },
                        {"@user",account.Username },
                        {"@pass",account.Password },
                        {"@re",account.RecoveryPhrase },
                        {"@perm",account.Permission },
                    });
               clear();
               AccountDatagrid.ItemsSource =  await accountViewModel.GetAccountsAsync();

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message,"warrning",MessageBoxButton.OK,MessageBoxImage.Warning);
            }
            
        }

        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtFullname.Text == "" || txtFullname.Text == null)
                {
                    txtFullname.Focus();
                    throw new System.Exception("Fullname must be inserted");
                }
                if (txtUser.Text == "" || txtUser.Text == null)
                {
                    txtUser.Focus();
                    throw new System.Exception("Username must be inserted");
                }
                if (txtPass.Text == "" || txtPass.Text == null)
                {
                    txtPass.Focus();
                    throw new System.Exception("Password must be inserted");
                }
                if (txtRecovery.Text == "" || txtRecovery.Text == null)
                {
                    txtRecovery.Focus();
                    throw new System.Exception("Recovery phrase must be inserted");
                }
                Account account = new Account();
                AccountViewModel accountViewModel = new AccountViewModel();
                int count = int.Parse(await accountViewModel.GetScalerValueAsync($"select count(AccountId) from Account where AccountId = {UpdateId}"));
                if (count==0 || count < 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                }
                
                account.AccountId = UpdateId;
                account.Fullname = txtFullname.Text;
                account.Permission = txtPermission.Text;
                account.Password = txtPass.Text;
                account.RecoveryPhrase = txtRecovery.Text;
                account.Username = txtUser.Text;
                await accountViewModel.ExcuteAsyncWithParameters(@"update Account set Fullname=@full, Username = @user, Password=@pass, RecoveryPhrase=@re,
                                                                    Permission=@perm where AccountId=@id",
                     new Dictionary<string, object> {
                        {"@id",account.AccountId },
                        {"@full",account.Fullname },
                        {"@user",account.Username },
                        {"@pass",account.Password },
                        {"@re",account.RecoveryPhrase },
                        {"@perm",account.Permission },
                     });
                UpdateId = 0;
                GetLastId();
                AccountDatagrid.ItemsSource = await accountViewModel.GetAccountsAsync();

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                AccountViewModel accountViewModel = new AccountViewModel();
                await accountViewModel.ExcuteAsyncWithParameters("delete from Account where AccountId=@id",
                    new Dictionary<string, object> {
                    {"@id",UpdateId }}
                    );
                
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n"+ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            
            GetdatagridItems();
            clear();
            GetLastId();
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {

        }


        private void AccountDatagrid_Selected(object sender, RoutedEventArgs e)
        {
          
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            var selected = (Account)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                UpdateId = selected.AccountId;
                txtFullname.Text = selected.Fullname;
                txtPass.Text = selected.Password;
                txtPermission.Text = selected.Permission;
                txtRecovery.Text = selected.RecoveryPhrase;
                txtUser.Text = selected.Username;
            }
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txtFullname.Focus();
            clear();
        }
        void clear()
        {
            txtFullname.Text = "";
            txtPass.Text = "";
            txtPermission.SelectedIndex = 1;
            txtRecovery.Text = "";
            txtUser.Text = "";
        }
    }
}
