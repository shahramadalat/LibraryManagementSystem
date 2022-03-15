using LibraryManagementApplication.Models;
using LibraryManagementApplication.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LibraryManagementApplication.Views.Books
{
    /// <summary>
    /// Interaction logic for LanguageView.xaml
    /// </summary>
    public partial class LanguageView : Window
    {
        public int UpdateId;
        public LanguageView()
        {
            InitializeComponent();
        }
        async void GetdatagridItems()
        {
            LanguageViewModel a = new LanguageViewModel();
            AccountDatagrid.ItemsSource = await a.GetItemsAsync();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
        }

        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtLanguage.Text == "" || txtLanguage.Text == null)
                {
                    txtLanguage.Focus();
                    throw new System.Exception("Language must be inserted");
                }
                Language item = new Language();
                item.LanguageName= txtLanguage.Text;
                LanguageViewModel languageViewModel = new LanguageViewModel();
                await languageViewModel.ExcuteAsyncWithParameters("insert into Language values(@lang)",
                     new Dictionary<string, object> {
                        {"@lang",item.LanguageName }
                     });
                AccountDatagrid.ItemsSource = await languageViewModel.GetItemsAsync();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (txtLanguage.Text == "" || txtLanguage.Text == null)
                {
                    txtLanguage.Focus();
                    throw new System.Exception("Language must be inserted");
                }

                Language language = new Models.Language();
                LanguageViewModel languageViewModel = new LanguageViewModel();
                int count = int.Parse(await languageViewModel.GetScalerValueAsync($"select count(LanguageId) from Language where LanguageId = {UpdateId}"));
                if (count == 0 || count < 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                }

                language.LanguageId = UpdateId;
                language.LanguageName = txtLanguage.Text;
                await languageViewModel.ExcuteAsyncWithParameters(@"update Language set LanguageName=@lang where LanguageId=@id",
                     new Dictionary<string, object> {
                        {"@id",language.LanguageId},
                        {"@lang",language.LanguageName},
                     });
                UpdateId = 0;
                AccountDatagrid.ItemsSource = await languageViewModel.GetItemsAsync();
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
                MessageBoxResult mr = MessageBox.Show("Are you sure to delete this? ", "Quetion", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (mr.Equals(MessageBoxResult.Yes))
                {
                    LanguageViewModel languageViewModel = new LanguageViewModel();
                    await languageViewModel.ExcuteAsyncWithParameters("delete from Language where LanguageId=@id",
                        new Dictionary<string, object> {
                    {"@id",UpdateId }}
                        );
                    MessageBox.Show("deleted");
                }
                else
                {
                    MessageBox.Show("not deleted");
                }
                

            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }

            GetdatagridItems();
            clear();
          
        }

        private async void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            lblSearch.Visibility = Visibility.Visible;
            Language language= new Language();
            language.LanguageName = txtLanguage.Text;
            LanguageViewModel languageViewModel = new LanguageViewModel();
            var item = await languageViewModel.GetFilteredAccountsAsync(new Dictionary<string, object>
            {
                {"@lang",language.LanguageName}
            });
            AccountDatagrid.ItemsSource = item;
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            clear();
            GetdatagridItems();
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            var selected = (Language)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                UpdateId = selected.LanguageId;
                txtLanguage.Text = selected.LanguageName;
                chosen_Language = selected.LanguageName;
            }

        }
        string chosen_Language;
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnChoose_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (chosen_Language == "" || chosen_Language == null || UpdateId == 0 || UpdateId == null)
                {
                    throw new Exception("please ensure to choose a record, try again");
                }
                BooksView.LanguageId = UpdateId;
                BooksView.Language = chosen_Language;
                this.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }
        void clear()
        {
    
            txtLanguage.Text = "";
            
        }
    }
}
