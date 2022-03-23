using Dapper;
using LibraryManagementApplication.ViewModels;
using LibraryManagementApplication.Models;
using System.Collections.Generic;
using System.Windows;
using System.Text.RegularExpressions;
using System.Windows.Input;

namespace LibraryManagementApplication.Views.Setting
{
    /// <summary>
    /// Interaction logic for SettingView.xaml
    /// </summary>
    
    
    public partial class SettingView : Window
    {
        public SettingView()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private async void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtBooksLimit.Text==""||txtBooksLimit.Text==null)
                {
                    throw new System.Exception("Books Borrow Limit must be inserted");
                }
                if (txtReturndate.Text == "" || txtReturndate.Text == null)
                {
                    throw new System.Exception("Books Return Date Limit must be inserted");
                }
                SettingModel settingModel = new SettingModel();
                settingModel.ReturnLimit = int.Parse(txtReturndate.Text);
                settingModel.BooksLimit = int.Parse(txtBooksLimit.Text);
                SettingDatabase settingDatabase = new SettingDatabase();
                await settingDatabase.ExcuteAsync($"update Setting set BooksLimit={settingModel.BooksLimit}, ReturnLimit={settingModel.ReturnLimit}");
                MessageBox.Show("Setting saved");
                this.Close();
            }
            catch (System.Exception ex)
            {

                MessageBox.Show(ex.Message);
            }

        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            SettingDatabase settingDatabase = new SettingDatabase();
            int countRow = await settingDatabase.GetCount();
            if (countRow==0)
            {
                await settingDatabase.ExcuteAsync("insert into Setting values(3,10)");
            }
            else
            {
                SettingModel setting = new SettingModel();
                List<SettingModel> settingModels = await settingDatabase.GetAccountsAsync();
                foreach (SettingModel item in settingModels)
                {
                    txtBooksLimit.Text = item.BooksLimit.ToString();
                    txtReturndate.Text=item.ReturnLimit.ToString();
                }
            }
        }
    }
}
